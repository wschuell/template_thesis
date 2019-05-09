import sys
import re

avoid = [
	r'([ ]+)url = {https://doi*',
	#r' url = {https://doi*',
	r'([ ]+)url = {http://dx.doi*',
	]

replace = [
	#('orig_substring','new_substring'),
	]

avoid_re = [re.compile(expr) for expr in avoid]

for line in sys.stdin:
    if not any([ re.match(regex,line) for regex in avoid_re]):
    	for r_orig,r_new in replace:
    		line = r_new.join(line.split(r_orig))
    	sys.stdout.write(line)

sys.stdout.write('\n')
sys.stdout.flush()
