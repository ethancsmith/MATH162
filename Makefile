document=main
sources=*.tex img/*.png

all: $(document).pdf $(document)_with_solutions.pdf

$(document).pdf: $(document).tex $(sources)
	latexmk $(document).tex

$(document)_with_solutions.pdf: $(document)_with_solutions.tex $(document).tex $(sources)
	latexmk $(document)_with_solutions.tex

docx: $(document).tex $(sources)
	pandoc main_with_solutions.tex -o main_with_solutions.docx

clean:
	latexmk -c

cleanall:
	latexmk -C
	rm -f *.docx
#rm -f *.aux *.bak *.bbl *.blg *.dvi *.fls *.fdb_latexmk *.idx *.ilg *.ind *.log *.out *.synctex.gz *.toc *.xdv $(document).pdf

.PHONY: all clean cleanall docx
