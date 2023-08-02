VERSION = $(shell cat VERSION)
MAIN = a2edR.tex
RES = $(wildcard ./recursos/**/*)
OUT=${MAIN:.tex=.pdf}
SRC=$(wildcard *.tex)
LATEX=latexmk -pdf
LATEX_CLEAN=latexmk -c
LATEX_WATCH=latexmk -pdf -pvc
PKG = \
	a2edR.tex\
	bibliografia.bib\
	LICENSE\
	Makefile\
	README.md\
	recursos\
	a2edR.pdf\
	VERSION

${OUT}: ${SRC} ${RES} recursos.zip
	${LATEX} ${MAIN}

recursos.zip: ${RES}
	zip -rv recursos.zip recursos

dist: clean
	make a2edR.pdf
	zip -rv a2edR-${VERSION}.zip ${PKG}

clean:
	$(foreach file,${SRC}, ${LATEX_CLEAN} ${file};)
	rm -f *.atfi *.zip *.bbl *.run.xml *.synctex.gz *.lol

lint:
	Rscript -e 'library(lintr);lint_dir("./recursos/")'

watch:
	${LATEX_WATCH} ${MAIN}

.PHONY: clean watch dist lint
