FROM thomasweise/texlive
RUN pip install pubs
RUN apt-get install latexmk inkscape
