MAIN = a2edR.tex
RES = $(find recursos)
OUT=${MAIN:.tex=.pdf}
SRC=$(wildcard *.tex)
LATEX=latexmk -pdf
LATEX_CLEAN=latexmk -c
LATEX_WATCH=latexmk -pdf -pvc

${OUT}: ${SRC} recursos.zip
	${LATEX} ${MAIN}

recursos.zip: ${RES}
	zip -rv recursos.zip recursos

dist: clean
	make a2edR.pdf
	zip -rv a2edR.zip a2edR.pdf recursos.zip

clean:
	$(foreach file,${SRC}, ${LATEX_CLEAN} ${file};)
	rm -f *.atfi *.zip

watch:
	${LATEX_WATCH} ${MAIN}

.PHONY: clean watch dist
