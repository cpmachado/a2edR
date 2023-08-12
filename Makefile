VERSION = $(shell cat VERSION)
MAIN = a2edR.tex
RES = $(wildcard recursos/**/*)
RSCRIPTS = $(wildcard codigo/**/*)
DATASETs = $(wildcard dataset/**/*)
TABLES = \
	tabela/ieedr/ex3_1.csv
IMAGES = \
	imagem/ieedr/ex3_2.png
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
	recursos\
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

r-scripts: ${RSCRIPTS}
	$(foreach script,${RSCRIPTS}, Rscript ${script};)

tabela/ieedr/%.csv: codigo/ieedr/%.R
	Rscript $<

imagem/ieedr/%.png: codigo/ieedr/%.R
	Rscript $<


tabela/ieedr/ex3_1.csv: codigo/ieedr/ex3_1.R
imagem/ieedr/ex3_2.png: codigo/ieedr/ex3_2.R
imagem/ieedr/ex3_3.png: codigo/ieedr/ex3_3.R

.PHONY: clean dist lint r-scripts style watch 
