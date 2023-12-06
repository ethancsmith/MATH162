document=main
sources=*.tex img/*.png

all: $(document).pdf $(document)_with_solutions.pdf

$(document).pdf: $(document).tex $(sources)
	latexmk $(document).tex

$(document)_with_solutions.pdf: $(document)_with_solutions.tex $(document).tex $(sources)
	latexmk $(document)_with_solutions.tex

clean:
	latexmk -C
#rm -f *.aux *.bak *.bbl *.blg *.dvi *.fls *.fdb_latexmk *.idx *.ilg *.ind *.log *.out *.synctex.gz *.toc *.xdv $(document).pdf

.PHONY: all clean 
