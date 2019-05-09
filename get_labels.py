
import os
import re
import pandas as pd

# reg exp to find full label specifications
patt = re.compile("\\label{(\w*:\w*)}")
patt2 = re.compile("\\label{(\w*)}")
# reg exp to find `addtotoc` labels
#app_patt = re.compile("(\w+:\w+)")

lbls = []
for root, dirs, files in os.walk('.'):
    for fn in files:
        # if fn == 'main.tex':
        #     with open(os.path.join(root, fn),encoding="Latin-1") as f:
        #         lbls.extend(re.findall(app_patt, f.read()))
        #elif fn.endswith(".tex"):
        if fn.endswith(".tex"):
            with open(os.path.join(root,fn),encoding="Latin-1") as f:
                txt = f.read()
                labels = re.findall(patt, txt)
                labels2 = re.findall(patt2, txt)
                lbls.extend(labels)
                lbls.extend(labels2)
typs = []
names = []
for lbl in lbls:
    if ':' not in lbl:
        t, n = 'noprefix', lbl
    else:
        t, n = lbl.split(':')
    typs.append(t)
    names.append(n)


df = pd.DataFrame({'typ':typs, 'nam':names})


for typ in set(typs):
    print("\n{}:".format(typ))
    for lab in df[df.typ==typ]['nam'].sort_values():
        print("    {}".format(lab))
