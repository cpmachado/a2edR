VERSION = $(shell cat VERSION)
MAIN = a2edR.tex
RES = $(wildcard recursos/**/*)
RSCRIPTS = \
	codigo/ieedr/ex3_1.R\
	codigo/ieedr/ex3_2.R\
	codigo/ieedr/ex3_3.R\
	codigo/ieedr/ex4_1.R\
	codigo/ieedr/ex4_2.R\
	codigo/ieedr/ex4_3.R\
	codigo/ieedr/ex4_4.R
DATASETs = $(wildcard dataset/**/*)
TABLES = \
	tabela/ieedr/ex3_1.csv\
	tabela/ieedr/ex4_2b.csv
IMAGES = \
	imagem/ieedr/ex3_2.png\
	imagem/ieedr/ex3_3.png\
	imagem/ieedr/ex4_2d.png\
	imagem/ieedr/ex4_4a.png\
	imagem/ieedr/ex4_4b.png
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
	latexmk -quiet $(PREVIEW_CONTINUOUSLY) -use-make -pdf a2edR.tex

watch: PREVIEW_CONTINUOUSLY=-pvc
watch: ${OUT}

dist: clean
	make ${OUT}
	mkdir a2edR-${VERSION}
	cp -rv ${PKG} a2edR-${VERSION}
	zip -rv a2edR-${VERSION}.zip a2edR-${VERSION}
	rm -rf a2edR-${VERSION}

clean:
	@latexmk -C -bibtex
	@rm -f *.atfi *.zip *.bbl *.run.xml *.synctex.gz *.lol

lint:
	Rscript -e 'library(lintr);lint_dir(".")'

style:
	Rscript -e 'library(styler);style_dir(".")'

tabela/ieedr/ex3_1.csv: codigo/ieedr/ex3_1.R dataset/ieedr/irmaos.csv
	Rscript $<
imagem/ieedr/ex3_2.png: codigo/ieedr/ex3_2.R dataset/ieedr/idas.csv
	Rscript $<
imagem/ieedr/ex3_3.png: codigo/ieedr/ex3_3.R dataset/ieedr/irmaos.csv
	Rscript $<
tabela/ieedr/ex4_2b.csv imagem/ieedr/ex4_2d.png: codigo/ieedr/ex4_2.R dataset/ieedr/4_2.csv
	Rscript $<
imagem/ieedr/ex4_4a.png imagem/ieedr/ex4_4b.png: codigo/ieedr/ex4_4.R dataset/ieedr/4_4.csv
	Rscript $<

.PHONY: clean dist lint r-scripts style watch 
