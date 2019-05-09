LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf
CONTINUOUS=-pvc

MAIN=thesis
SOURCES=$(MAIN).tex Makefile
FIGURES := $(shell find figures/*  -type f);
FIGURESBIN := $(shell find figures-bin/* -type f);

all:	once#$(MAIN).pdf

continuous:	$(MAIN).pdf

.refresh:
	touch .refresh

$(MAIN).pdf:	buildfigs biblio $(MAIN).tex .refresh $(SOURCES)
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
	-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAIN)

%.pdf:	%.tex .refresh $(SOURCES)
	$(LATEXMK) $(LATEXMKOPT) \
	-pdflatex="$(LATEX) $(LATEXOPT) %O %S" temp_$<

force:	biblio
	touch .refresh
	rm $(MAIN).pdf
	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

clean:
	$(LATEXMK) -C $(MAIN)
	find ./content -type f -name "*.aux" -exec rm -f {} \;
	rm -f temp_*.tex
	rm -f *.pdfsync
	rm -rf *~ *.tmp
	rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk *.bcf *.run.xml *.lot *.lof *.loa *.mtc* *.ind *.idx *.maf *.ilg *.toc

once:	biblio $(MAIN).tex .refresh $(SOURCES)
	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

debug:
	$(LATEX) $(LATEXOPT) $(MAIN)

buildfigs:
	bash buildfigs.sh

biblio:
	bash -c "pubs export | python3 pubs_filter.py > pubs_biblio.bib"

%.tex:
	python includeonly.py $@


.PHONY: clean force once all continuous buildfigs
