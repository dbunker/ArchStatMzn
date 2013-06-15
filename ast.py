# simple ANSI c parser
# only type is int

import copy
import ply.lex as lex
import ply.yacc as yacc

#################################
# structs

class Root:
	def __init__(self):
		self.functions = []

# an opTree is a variable or a 
# unary or binary operation

class Function:
	def __init__(self):

		# function name (str)
		self.name = None

		# function parameter names (str)
		self.parameters = []

		# function variable names (str)
		self.variables = []

		# list of assignments in function (Assign)
		self.assignments = []

		# return value (OpNode)
		self.returnOpTree = None 

class Assign:
	def __init__(self):
		self.variableName = None
		self.opTree = None

class OpNode:
	def __init__(self):
	
		# int, var
		# ~, !
		# +, &, ^, |, <<, >>
		self.opType = None
		
		self.leafValue = None
		
		self.opTreeSingle = None
		self.opTreeLeft = None
		self.opTreeRight = None

#################################
# lexer

tokens = (
    'INT',
    'RETURN',
    'PLUS',
    'AND','XOR','OR','LEFT','RIGHT',
    'FLIP','NOT',
    'EQUALS',
    'COMMA', 'SEMI',
    'LPAREN','RPAREN',
    'LBRACKET','RBRACKET',
    'NUMBER','HEX',
    'NAME'
)

# Tokens
t_INT		= r'int'
t_RETURN	= r'return'
t_PLUS    	= r'\+'
t_AND  		= r'\&'
t_XOR  		= r'\^'
t_OR  		= r'\|'
t_LEFT		= r'<<'
t_RIGHT		= r'>>'
t_FLIP		= r'~'
t_NOT		= r'!'
t_EQUALS  	= r'='
t_COMMA  	= r','
t_SEMI  	= r';'
t_LPAREN  	= r'\('
t_RPAREN  	= r'\)'
t_LBRACKET  = r'\{'
t_RBRACKET  = r'\}'

def t_NAME(t):
	r'(?!int)(?!return)([a-zA-Z_][a-zA-Z0-9_]*)'
	return t

def t_NUMBER(t):
    r'(?!0x)\d+'
    t.value = int(t.value)
    return t

def t_HEX(t):
    r'0x[0-9a-fA-F]+'
    t.value = int(t.value,0)
    return t

def t_newline(t):
    r'\n+'
    t.lexer.lineno += t.value.count("\n")

# Ignored characters
t_ignore = " \t"

# /* ( ((not *) or (* (not /))) any-number-of-times ) */
def t_comment(t):
	r'/\*(([^*])|(\*[^/]))*\*/'

def t_error(t):
    print("Illegal character '%s'" % t.value[0])
    t.lexer.skip(1)

# Build the lexer
lex.lex()

#################################
# syntax

root = Root()

# Precedence rules for the arithmetic operators
precedence = (
	('left','OR'),
	('left','XOR'),
	('left','AND'),
	('left','LEFT','RIGHT'),
    ('left','PLUS'),
    ('right','FLIP','NOT')
)

def p_function(p):
	'''function : INT NAME paramListParen inBracket'''

	(vars,assignments,ret) = p[4]
	
	newFunc = Function()
	newFunc.name = p[2]
	newFunc.parameters = p[3]
	newFunc.variables = vars
	newFunc.assignments = assignments
	newFunc.returnOpTree = ret
	
	root.functions.append(newFunc)

def p_paramListParen(p):
	'''paramListParen	: LPAREN RPAREN 
						| LPAREN paramList RPAREN '''
	
	if len(p) == 4:
		p[0] = p[2]
	elif len(p) == 3:
		p[0] = []
	else:
		assert(False)

def p_paramList(p):
	'''paramList	: INT NAME
					| INT NAME COMMA paramList'''
	
	if len(p) == 3:
		p[0] = [p[2]]
	elif len(p) == 5:
		p[0] = [p[2]] + p[4]
	else:
		assert(False)

def p_inBracket(p):
	'''inBracket	: LBRACKET varList assignmentList RETURN opTree SEMI RBRACKET
					| LBRACKET assignmentList RETURN opTree SEMI RBRACKET
					| LBRACKET RETURN opTree SEMI RBRACKET'''

	# can have assignments based on input variables
	# no point in var list without assignments
	
	vars = []
	assignments = []
	ret = None
	
	if len(p) == 8:
		vars = p[2]
		assignments = p[3]
		ret = p[5]
	elif len(p) == 7:
		assignments = p[2]
		ret = p[4]
	elif len(p) == 6:
		ret = p[3]
	else:
		assert(False)
	
	p[0] = (vars,assignments,ret)

def p_varList(p):
    '''varList		: INT typeList SEMI
    				| INT typeList SEMI varList'''
    
    if len(p) == 4:
    	p[0] = p[2]
    elif len(p) == 5:
    	p[0] = p[2] + p[4]
    else:
    	assert(False)
        
def p_typeList(p):
    '''typeList		: NAME
    				| NAME COMMA typeList'''
    
    if len(p) == 2:
    	p[0] = [p[1]]
    elif len(p) == 4:
    	p[0] = [p[1]] + p[3]
    else:
    	assert(False)

def p_assignmentList(p):
	'''assignmentList	: NAME EQUALS opTree SEMI
						| NAME EQUALS opTree SEMI assignmentList'''
	
	newAssign = Assign()
	newAssign.variableName = p[1]
	newAssign.opTree = p[3]
	
	if len(p) == 5:
		curList = []
	elif len(p) == 6:
		curList = p[5]
	else:
		assert(False)
	
	p[0] = [newAssign] + curList

def p_opTree(p):
	'''opTree	: NAME 
				| NUMBER
				| HEX
				| LPAREN opTree RPAREN
				| binOpTree
				| sinOpTree'''

	proc = p[1]
	
	if len(p) == 4:
		proc = p[2]
		p[0] = proc
		return
	
	if isinstance(proc,OpNode):
		p[0] = proc
		
	elif isinstance(proc,int):
		op = OpNode()
		op.opType = 'int'
		op.leafValue = proc
		p[0] = op
		
	elif isinstance(proc,str):
		op = OpNode()
		op.opType = 'var'
		op.leafValue = proc
		p[0] = op
		
	else:
		assert(False)

def p_sinOpTree(p):
	'''sinOpTree	: FLIP opTree
					| NOT opTree'''

	op = OpNode()
	op.opType = p[1]
	op.opTreeSingle = p[2]
	p[0] = op

def p_binOpTree(p):
	'''binOpTree	: opTree PLUS 	opTree
					| opTree AND	opTree
					| opTree XOR	opTree
					| opTree OR		opTree
					| opTree LEFT	opTree
					| opTree RIGHT	opTree'''
	
	op = OpNode()
	op.opType = p[2]
	op.opTreeLeft = p[1]
	op.opTreeRight = p[3]
	p[0] = op

def p_error(p):
    print("Syntax error at '%s'" % p.value)

yacc.yacc()

#################################

def parseFile(fileName):

	root.functions = []
	fileStr = open(fileName,'r').read()
	
	yacc.parse(fileStr)
	
	retRoot = copy.deepcopy(root)
	return retRoot
	