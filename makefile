SLIDES = $(wildcard **/*.md)
HTML = $(SLIDES:.md=.html)
PDF = $(SLIDES:.md=.pdf)

%.html: %.md
	npx @marp-team/marp-cli@latest $< -o $@ --html 1

%.pdf: %.md
	npx @marp-team/marp-cli@latest $< -o $@ --html 1 --allow-local-files

html: $(HTML)

pdf: $(PDF)

all: html pdf index.html

deploy: all
	mkdir -p public/listas
	mkdir -p public/slides
	cp listas/*.pdf public/listas/
	cp slides/*.{html,pdf} public/slides/ -r
	cp index.html public/
	pipx run ghp-import public -p -o
	echo https://evandro-crr.github.io/alg2

.PHONY: clean

clean:
	rm -rf $(HTML) $(PDF) public