# Thesis template
Based on Tufte book. Baptiste Busch did the first version. Benjamin Clement contributed as well. My thesis can be found here: https://tel.archives-ouvertes.fr/tel-02073770 . Do not hesitate to ask if more details are needed.

Examples of figures, usage, and structure are presented in the introduction part and in the first chapter. The rest is only lorem ipsum to feel the gaps.

### Dependencies

Python, git, bash, inkscape (not mandatory, modify buildfigs if not wanted), pubs (not mandatory, use custom named .bib file if not wanted), latexmk


### Compile

``` make``` will compile the whole thesis and create thesis.pdf

``` make clean``` will clean auxiliary files, this may be useful when you get a compilation error.

``` make buildfigs``` Builds the figures and puts them in ./figures

``` make continuous``` recompiles the document at every modification of one of the .tex files


### General structure and .tex files

Modify thesis.tex for general structure. Put chapters in ./content (see examples)

usepackage commands, and special commands are to be found in input_commands.tex; to separate them well from the rest in ase you want to change template or reuse them elsewhere.

Do not forget to put your name in thesis.tex!

### Figures

Figures to be put in ./figures-bin but imported from ./figures; they are built with ``` make buildfigs ```. The buildfigs script can be modified. It copies files, and processes .svg files using inkscape.

With this, you can modify directly your svg files and do not worry about exporting them each time. For everyone to be able to compile directly even without inkscape, processed files are present in the repo as well.


### Biblio

The usage of https://github.com/pubs/pubs is implemented, but not mandatory. A filter to change dynamically some parts of the bib entries is suggested in pubs_filter.py (to avoid warnings at compilation), which you can modify at your ease.


### Overleaf compatibility

Set up a blank overleaf project, and run ``` bash push_to_overleaf.sh```. You will be asked for the URL of the project and your credentials, the rest will be automatic. An overleaf branch is created, apart from master, that is synced with overleaf. You have to manually merge the branch into master when wanting to retrieve changes made on overleaf (Of course beforehand you need to use the pull_from_overleaf script).



### Other features

#### Cover

Standard and verified for University of Bordeaux (output pdf is also compatible with required formats).

#### Before chapter pictures

Pages are not left blank before chapters, but pictures are included. You can modify it and include citations, or whatever you'd like (see input_commands.tex).

#### Get labels

Python script to get labels that are defined in your .tex files; in case you do not know how you named them.

#### Include only

To compile only one chapter, considered as one .tex file in the content folder (here ./content/introduction/main.tex), type the following (replacing / with _ ): ``` make introduction_main.pdf```
It will create temp_introduction_main.pdf in the main folder.

