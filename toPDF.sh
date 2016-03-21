BASENAME=main
NAME=main.tex
pdflatex $NAME
bibtex $BASENAME
makeglossaries $BASENAME
pdflatex $NAME
pdflatex $NAME
