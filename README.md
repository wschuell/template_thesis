# template_article
template for articles

starting:
create main.tex and potential style files

in the main.tex, put 
```
%\includeonly{}
``` 
before 
```
\begin{document}
```

and import your custom commands and modifications to the template with

```
\input{input_commands.tex}
```

.tex files are in ./content, figures in ./figures-bin
 
