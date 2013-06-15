
import os, copy
import ast

def createBool(varName):
	return 'array[0..k-1] of var bool: ' + varName + ';\n\n'

kVal = 32

# program constraints
def progConsts(rootGet,prefix):
	
	root = copy.deepcopy(rootGet)
	finalOutStr = ''
	
	# convert c ast to minizinc equivalent
	
	parameters = root.parameters
	variables = root.variables
	assignments = root.assignments
	returnOpTree = root.returnOpTree
	
	########################
	# pre-process
	
	# to handle duplicate assignments of a variable, 
	# the variable's name is changed each time it is used, starting 
	# at <var>_0 <var>_1 ...
	
	currentlyAssigned = {}
	
	for var in root.parameters:
		currentlyAssigned[var] = 0
	
	def changeVarNames(node):
		
		if node.leafValue != None:
			
			if node.opType == 'var':
				
				# must be assigned before we can use it in an expression
				assert(node.leafValue in currentlyAssigned)
				
				# if assignment is above 0, must change to most recent assignment
				if currentlyAssigned[node.leafValue] > 0:
					node.leafValue = node.leafValue + '_dup_' + str(currentlyAssigned[node.leafValue])
				
				node.leafValue = prefix + '_' + node.leafValue
				
		elif node.opTreeSingle != None:
			changeVarNames(node.opTreeSingle)
			
		elif node.opTreeLeft != None and node.opTreeRight != None:
			changeVarNames(node.opTreeLeft)
			changeVarNames(node.opTreeRight)
			
		else:
			assert(False)
	
	# ast.Assign
	for assign in assignments:
		
		name = assign.variableName
		node = assign.opTree
		
		changeVarNames(node)
		
		# now that this assignment has happened, all places where this
		# variable appears must be changed
		
		if name in currentlyAssigned:
			currentlyAssigned[name] += 1
			assign.variableName = assign.variableName + '_dup_' + str(currentlyAssigned[name])
		else:
			currentlyAssigned[name] = 0
	
		assign.variableName = prefix + '_' + assign.variableName
	
	# for return assignment
	changeVarNames(returnOpTree)
	
	########################
	# initialize parameters and local variables
	
	def initBool(newVar,initVars):
		
		# if already present, don't need to initialize it again
		if newVar in initVars:
			return ''
		
		initVars[newVar] = True
		return createBool(newVar)
	
	# initialized variables
	initVars = {}
	
	# make certain parameters are initialized
	for var in root.parameters:
		newVar = prefix + '_' + var
		finalOutStr += initBool(newVar,initVars)
	
	########################
	# assignments
	
	def generateVar(assignName):
		i = 1
		while True:
			yield assignName + '_temp_' + str(i)
			i += 1
	
	# convert integer to binary
	def boolList(sendName,fromInt):
	
		liStr = ''
		
		toTrans = bin(fromInt)[2:]
		toTrans = ('0' * (kVal - len(toTrans))) + toTrans
		toTrans = toTrans[::-1]
		
		liStr += 'constraint '
		
		i = 0
		for val in toTrans:
			
			liStr += sendName + '[' + str(i) + '] = '
			if val == '1':
				liStr += 'true'
			else:
				liStr += 'false'
			liStr += ' /\ '
			
			i += 1
		
		liStr = liStr[:-4] + ';'
		return liStr
	
	def binConst(op,assignVal,v1,v2):
		
		# +, &, ^, |, <<, >>
		outStr  = '% ( ' + assignVal + ' = ' + v1 + ' ' + op + ' ' + v2 + ' )\n'
		
		if op == '+':
			
			outStr += 'constraint binary_add(' + v1 + ', ' + v2 + ', false, ' + assignVal + ')'
		
		elif op == '&' or op == '^' or op == '|':
		
			outStr += 'constraint forall(i in 0..k-1)( ' + assignVal + '[i] = '
			outStr += '(' + v1 + '[i] '
			
			if op == '&':
				 outStr += '/\\' 
				
			elif op == '^':
				 outStr += 'xor' 
			
			elif op == '|':
				 outStr += '\\/'
				
			else:
				assert(False)

			outStr += ' ' + v2 + '[i]) )'
		
		elif op == '>>':	
		
			outStr += 'constraint shift_right(' + v1 + ', ' + v2 + ', ' + assignVal + ')'	
		
		elif op == '<<':
			
			outStr += 'constraint shift_left(' + v1 + ', ' + v2 + ', ' + assignVal + ')'	
			
		else:
			assert(False)
		
		outStr += ';\n\n'
		return outStr
	
	def sinConst(op,assignVal,v):
		
		# ~, !
		outStr  = '% ( ' + assignVal + ' = ' + op + ' ' + v + ' )\n'
		
		if op == '~':
		
			outStr += 'constraint forall(i in 0..k-1)( ' + assignVal + '[i] = '
			outStr += '( not ' + v + '[i] ' + ') )'
		
		elif op == '!':
		
			outStr += 'constraint negate(' + v + ', ' + assignVal + ')'
		
		else:
			assert(False)
		
		outStr += ';\n\n'
		return outStr
	
	# param: OpNode
	def resolveRec(node,curName,assignName,thisGen,initVars):
		
		outStr = ''
		
		# leaf
		if node.leafValue != None:
		
			if node.opType == 'int':
				
				# assign variable to boolean list for int
				outStr += initBool(curName,initVars)
				outStr += boolList(curName,node.leafValue) + '\n\n'
				return outStr
				
			else:
				
				# node.opType == 'var' handled one recursive step above
				assert(False)
			
		elif node.opTreeSingle != None:
			
			subName = None
			if node.opTreeSingle.opType != 'var':
				subName = thisGen.next()
				outStr += initBool(subName,initVars)
				outStr += resolveRec(node.opTreeSingle,subName,assignName,thisGen,initVars)
				
			else:
				subName = node.opTreeSingle.leafValue
			
			outStr += initBool(curName,initVars)
			outStr += sinConst(node.opType,curName,subName)
			
			return outStr
			
		elif node.opTreeLeft != None and node.opTreeRight != None:
			
			leftName = None
			if node.opTreeLeft.opType != 'var':
				leftName = thisGen.next()
				outStr += initBool(leftName,initVars)
				outStr += resolveRec(node.opTreeLeft,leftName,assignName,thisGen,initVars)
			else:
				leftName = node.opTreeLeft.leafValue
			
			rightName = None
			if node.opTreeRight.opType != 'var':
				rightName = thisGen.next()
				outStr += initBool(rightName,initVars)
				outStr += resolveRec(node.opTreeRight,rightName,assignName,thisGen,initVars)
			else:
				rightName = node.opTreeRight.leafValue
			
			outStr += initBool(curName,initVars)
			outStr += binConst(node.opType,curName,leftName,rightName)
			
			return outStr
			
		assert(False)
	
	def resolve(node,assignName,initVars):
		
		outStr = ''
		
		# in case assigned var is not initialized yet
		outStr += initBool(assignName,initVars)
		
		if node.opType == 'var':
		
			# equal
			eq = '( ' + assignName + '[i] = ' + node.leafValue + '[i] )'
			outStr += 'constraint forall(i in 0..k-1)' + eq + ';\n\n'
			return outStr
		
		thisGen = generateVar(assignName)
		outStr += resolveRec(node,assignName,assignName,thisGen,initVars)
		
		return outStr
	
	########################
	# assignments
	
	# ast.Assign
	for assign in assignments:
		
		name = assign.variableName
		node = assign.opTree
		
		finalOutStr += resolve(node,name,initVars)
	
	########################
	# return operation
	
	name = prefix + 'Return'
	
	finalOutStr += resolve(returnOpTree,name,initVars)
	
	return finalOutStr

def printAstRec(node,tabs):
	
	print tabs + 'op: ' + node.opType
	
	if node.leafValue != None:
		print tabs + '\t' + node.leafValue
			
	elif node.opTreeSingle != None:
		printAstRec(node.opTreeSingle,tabs+'\t')
		
	elif node.opTreeLeft != None and node.opTreeRight != None:
		printAstRec(node.opTreeLeft,tabs+'\t')
		printAstRec(node.opTreeRight,tabs+'\t')
	
	else:
		assert(False)

def printAst(root):
	
	parameters = root.parameters
	variables = root.variables
	assignments = root.assignments
	returnOpTree = root.returnOpTree
	
	print 'parameters'
	print parameters
	
	print 'variables'
	print variables
	
	print 'assign'
	for assign in assignments:
		
		name = assign.variableName
		node = assign.opTree
		
		print 'var: ' + name
		printAstRec(node,'\t')
	
	print 'return'
	printAstRec(returnOpTree,'\t')

def solve(fileNameSpec,fileNameOther,fileNameOut,execMini=False):

	outStr = ''
	
	specMain = ast.parseFile(fileNameSpec)
	otherMain = ast.parseFile(fileNameOther)
	
	if len(specMain.functions) == 0:
		print 'spec did not compile'
		exit()
	
	if len(otherMain.functions) == 0:
		print 'other did not compile'
		exit()
	
	specRoot = specMain.functions[0]
	otherRoot = otherMain.functions[0]
	
	assert(specRoot.parameters == otherRoot.parameters)
	assert(specRoot.name == otherRoot.name)
	
	########################
	# init
	
	sep = ('%' * 50) + '\n'
	
	outStr += '% solver for function ' + specRoot.name + '\n\n'
	outStr += 'include "globals.mzn";\n'
	outStr += 'include "commands.mzn";\n'
	outStr += 'int: k = ' + str(kVal) + ';\n\n'
	
	########################
	# assignments
	
	outStr += sep
	outStr += '% spec assignments\n\n'
	
	specStr = progConsts(specRoot,'spec')
	outStr += specStr
	
	outStr += sep
	outStr += '% other assignments\n\n'
	
	otherStr = progConsts(otherRoot,'other')
	outStr += otherStr
	
	########################
	# same input to both other and spec
	
	outStr += sep
	outStr += '% spec and other have identical input parameters\n\n'
	
	# bind inputs
	for param in specRoot.parameters:
		
		specVal = 'spec_' + param
		otherVal = 'other_' + param
		outStr += otherVal + ' = ' + specVal + ';\n\n'
	
	########################
	# inequality check
	
	outStr += sep
	outStr += '% check if there is ever an inequality in output\n\n'
	
	outStr += 'array[0..k-1] of var bool: anyIneq;\n\n'
	
	outStr += 'constraint forall(i in 0..k-1)( anyIneq[i] = (specReturn[i] xor otherReturn[i]) );\n\n'
	
	outStr += 'constraint exists(anyIneq);\n\n'
	
	outStr += 'solve satisfy;\n\n'
	
	########################
	
	outStr += sep
	outStr += '% if conflict found, display parameters and return values\n\n'
	
	def bindInt(intName,binName):
		bindStr  = 'var -pow(2,k-1)..pow(2,k-1)-1: ' + intName + ';\n'
		bindStr += 'constraint '  + intName + ' = '
		bindStr += 'sum(j in 0..k-2)( bool2int(' + binName + '[j]) * pow(2,j) )\n'
		bindStr += '	- bool2int(' + binName + '[k-1]) * pow(2,k-1);\n\n'
		return bindStr
	
	# bind input
	for param in specRoot.parameters:
		intName = 'int_' + param
		binName = 'spec_' + param
		outStr += bindInt(intName,binName)
	
	# bind output
	outStr += bindInt('expected','specReturn')
	outStr += bindInt('got','otherReturn')
	
	# show
	outStr += sep
	outStr += '% show\n\n'
		
	outStr += 'output [\n'
	
	for param in specRoot.parameters:
		outStr += '"' + param + '=", show(int_' + param + '), "\\n",\n'
	
	outStr += '"expected=", show(expected), "\\n",\n'
	outStr += '"got=", show(got),\n'
	outStr += '];\n'
	
	########################
	# run arched minizinc and output result
	
	outFile = fileNameOut
	open(outFile,'w').write(outStr)
	
	if execMini:
		cmd = 'minizinc ' + outFile + ' > result.txt'
		os.system(cmd)
	
		outRes = open('result.txt','r').read()
		print outRes
	
		if outRes == '=====UNSATISFIABLE=====\n':
			print 'programs are equivalent\n'
		else:
			print 'programs are not equivalent\n'

def singleTest():

	fileNameSpec  = 'test/main/correct/bitAnd/bitAnd-spec.c'
	fileNameOther = 'test/main/correct/bitAnd/bitAnd-other.c'
	fileNameOut = 'bitAnd.mzn'

	solve(fileNameSpec,fileNameOther,fileNameOut)

