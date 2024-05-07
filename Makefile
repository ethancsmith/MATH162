DOCUMENT = main
LECTURES = 7-1_inverse_functions 7-2_the_logarithm 7-3_exponentials 7-4_separable_differential_equations 7-5_indeterminate_forms 7-6_inverse_trigonometric_functions 7-7_hyperbolic_functions 7-8_relative_orders 8-2_integration_by_parts 8-3_trigonometric_integration 8-4_trigonometric_substitution 8-5_partial_fractions 8-8_improper_integrals 10-1_infinite_sequences 10-2_infinite_series 10-3_integral_test 10-4_comparison_tests 10-5_ratio_and_root_tests 10-6_alternating_series 10-7_power_series 10-8_taylor_series 10-9_convergence_of_taylor_series 10-10_applications_of_taylor_series 11-1_parametric_equations 11-2_calculus_on_parametric_curves
SOURCES = *.tex img/*.png

all: $(DOCUMENT).pdf $(DOCUMENT)_with_solutions.pdf lectures

lectures: $(addsuffix .pdf, $(LECTURES))

$(DOCUMENT).pdf: $(SOURCES)
	latexmk $(addsuffix .tex, $(DOCUMENT))

$(DOCUMENT)_with_solutions.pdf: $(SOURCES)
	latexmk $(addsuffix _with_solutions.tex, $(DOCUMENT))

%.pdf: %.tex preamble.tex img/*.png
	latexmk -pdflatex="pdflatex -recorder -jobname %A '\documentclass[11pt,reqno]{amsart}\input{preamble}\begin{document}\input{%S}\end{document}'" $<

docx: $(SOURCES)
	pandoc $(addsuffix _with_solutions.tex, $(DOCUMENT)) -o $(addsuffix _with_solutions.docx, $(DOCUMENT)) 

clean:
	latexmk -c

cleanall:
	latexmk -C
	rm -f *.docx
	#rm -f *.aux *.bak *.bbl *.blg *.dvi *.fls *.fdb_latexmk *.idx *.ilg *.ind *.log *.out *.synctex.gz *.toc *.xdv *.pdf

.PHONY: all lectures clean cleanall docx
