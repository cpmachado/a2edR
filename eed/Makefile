VERSION = $(shell cat VERSION)
MAIN = eed.tex
OUT=${MAIN:.tex=.pdf}

${OUT}: ${MAIN}
	latexmk -auxdir=aux -quiet $(PREVIEW_CONTINUOUSLY) -use-make -pdf eed.tex

watch: PREVIEW_CONTINUOUSLY=-pvc
watch: ${OUT}

clean:
	@rm -rf aux *.pdf

lint:
	Rscript -e 'library(lintr);lint_dir(".")'

style:
	Rscript -e 'library(styler);style_dir(".")'

.PHONY: clean lint style watch
