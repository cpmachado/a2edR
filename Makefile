VERSION = $(shell cat VERSION)
MAIN = a2edR.tex
RES = $(wildcard recursos/**/*)
RSCRIPTS = \
	codigo/ex3_1.R\
	codigo/ex3_2.R\
	codigo/ex3_3.R\
	codigo/ex4_1.R\
	codigo/ex4_2.R\
	codigo/ex4_3.R\
	codigo/ex4_4.R
DATASETs = $(wildcard dataset/**/*)
TABLES = \
	tabela/ex3_1.csv\
	tabela/ex4_2b.csv
IMAGES = \
	imagem/ex3_2.png\
	imagem/ex3_3.png\
	imagem/ex4_2d.png\
	imagem/ex4_4a.png\
	imagem/ex4_4b.png
OUT=${MAIN:.tex=.pdf}
PKG = \
	CHANGELOG.md\
	LICENSE\
	Makefile\
	README.md\
	VERSION\
	a2edR.pdf\
	a2edR.tex\
	bibliografia.bib\
	codigo\
	dataset\
	imagem\
	tabela

${OUT}: ${MAIN} ${RSCRIPTS} ${DATASETS} ${TABLES} ${IMAGES}
	latexmk -auxdir=aux -quiet $(PREVIEW_CONTINUOUSLY) -use-make -pdf a2edR.tex

watch: PREVIEW_CONTINUOUSLY=-pvc
watch: ${OUT}

dist: clean
	make ${OUT}
	mkdir a2edR-${VERSION}
	cp -rv ${PKG} a2edR-${VERSION}
	zip -rv a2edR-${VERSION}.zip a2edR-${VERSION}
	rm -rf a2edR-${VERSION}

clean:
	@rm -rf aux *.pdf

lint:
	Rscript -e 'library(lintr);lint_dir(".")'

style:
	Rscript -e 'library(styler);style_dir(".")'

tabela/ex3_1.csv: codigo/ex3_1.R dataset/irmaos.csv
	Rscript $<
imagem/ex3_2.png: codigo/ex3_2.R dataset/idas.csv
	Rscript $<
imagem/ex3_3.png: codigo/ex3_3.R dataset/irmaos.csv
	Rscript $<
tabela/ex4_2b.csv imagem/ex4_2d.png: codigo/ex4_2.R dataset/4_2.csv
	Rscript $<
imagem/ex4_4a.png imagem/ex4_4b.png: codigo/ex4_4.R dataset/4_4.csv
	Rscript $<

.PHONY: clean dist lint r-scripts style watch 
