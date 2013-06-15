import archstat

print 'start'

full = 'test/main/correct/'

allFiles = [ 	'bitAnd','conditional','ezThreeFourths','fitsShort',
				'isGreater','isNonZero','isTmin','leftBitCount',
				'logicalShift','sign','thirdBits','trueThreeFourths' ]

def outputAll():

	for fi in allFiles:
		specFile = full + fi + '/' + fi + '-spec.c'
		otherFile = full + fi + '/' + fi + '-other.c'
		outFile = 'out/' + fi + '-check.mzn'
	
		archstat.solve(specFile,otherFile,outFile)
		print 'output ' + fi

def singleTest():

	fi = 'bitAnd'
	specFile = full + fi + '/' + fi + '-spec.c'
	otherFile = full + fi + '/' + fi + '-other.c'
	outFile = fi + '-check.mzn'

	archstat.solve(specFile,otherFile,outFile,execMini=True)
	print 'output ' + fi

outputAll()
