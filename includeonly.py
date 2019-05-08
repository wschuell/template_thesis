import sys
import os

with open('Makefile','r') as f:
	makefile = f.readline()
	while makefile[:5] != 'MAIN=':
		makefile = f.readline()
mainfile = makefile[5:][:-1]

if mainfile[-4:] != '.tex':
	mainfile += '.tex'

filename = '/'.join(sys.argv[1].split('_'))

assert filename[-4:] == '.tex'

filepath = 'content/' + filename[:-4]
filename_bis = '_'.join(filename[:-4].split('/'))
tempfile = 'temp_'+filename_bis+'.tex'



if not os.path.isfile(mainfile):
	raise IOError('No such file: '+mainfile)

with open(mainfile,'r') as f:
	mainfile_content = f.read()
includes_mainfile = [ t.split('}')[0] for t in mainfile_content.split('\include{')[1:]]



if os.path.isfile(filepath+'.tex'):
	filepaths = [filepath]
else:
	filepaths = [fp for fp in includes_mainfile if filepath in fp]
#	raise IOError('No such file: '+filepath+'.tex')

if includes_mainfile:
	for fp in filepaths:
		assert fp in includes_mainfile
	content_bis = ('\includeonly{'+','.join(filepaths)+'}').join(mainfile_content.split('%\includeonly{}'))
	with open(tempfile,'w') as f:
		f.write(content_bis)
