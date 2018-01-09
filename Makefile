LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf
CONTINUOUS=-pvc

MAIN=main
SOURCES=$(MAIN).tex Makefile
#FIGURES := $(shell find figures/* images/* -type f)

all:	once#$(MAIN).pdf

continuous:	$(MAIN).pdf

.refresh:
	touch .refresh

$(MAIN).pdf:	$(MAIN).tex .refresh $(SOURCES) $(FIGURES)
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
	-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAIN)

%.pdf:	%.tex .refresh $(SOURCES) $(FIGURES)
	$(LATEXMK) $(LATEXMKOPT) \
	-pdflatex="$(LATEX) $(LATEXOPT) %O %S" temp_$<

force:
	touch .refresh
	rm $(MAIN).pdf
	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

clean:
	$(LATEXMK) -C $(MAIN)
	find ./content -type f -name "*.aux" -exec rm -f {} \;
	rm -f temp_*.tex
	rm -f *.pdfsync
	rm -rf *~ *.tmp
	rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk *.bcf *.run.xml

once:
	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

debug:
	$(LATEX) $(LATEXOPT) $(MAIN)

%.tex:
	python includeonly.py $@


.PHONY: clean force once all continuous
