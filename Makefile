#
# This is a blunt Makefile.
#
# If you want a more sophisticated Makefile then take a look at
# https://tex.stackexchange.com/questions/40738/how-to-properly-make-a-latex-project
# for various options and references.
#
# `man latexmk` helps as well.
#

THESIS=thesis

# FYI: https://en.wiktionary.org/wiki/stelling#Dutch
PROPOSITIONS=stellingen

.PHONY: all clean bibtex

all:
	$(info Make all ...)
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $(THESIS) $(PROPOSITIONS)

clean:
	$(info Make clean ...)
	latexmk -C -silent
	$(RM) *.bbl *.swp

bibtex:
	# We assume that propositions aren't full of references.
	$(info Make bibtex ...)
	bibtex $(THESIS)

