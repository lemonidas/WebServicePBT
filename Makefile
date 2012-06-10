.SUFFIXES: .pdf .dvi .tex
.PHONY: default clean distclean

PAPER = pap2

default: $(PAPER).pdf

%.pdf: %.tex *.bib
	latexmk -pdf $*

%.jpg: %.pdf
	./make_thumb.sh $(basename $*)

clean:
	@$(RM) *.aux *.lof *.log *.lot *.out *.toc *.nav *.pag *.snm *.bbl *.blg *~ \#*\# *.fdb_latexmk

distclean: clean
	@$(RM) $(PAPER).pdf $(PAPER).dvi $(PAPER).ps $(PAPER).jpg
