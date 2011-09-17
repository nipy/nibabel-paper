all: p.pdf

p.pdf: p.bbl
	pdflatex -interaction=nonstopmode p.tex

p.aux: p.tex snippets
	pdflatex  -interaction=nonstopmode $<

p.bbl: p.aux
	bibtex $<
	pdflatex -interaction=nonstopmode p.tex

clean:
	rm -f *.pdf *.aux *.log *.out *.toc *.vrb *.nav *.snm *.py.tex code.sty *.blg *.bbl

snippets: code.sty
	for i in *.py; do $(MAKE) $$i.tex; done

code.sty:
	pygmentize -S emacs -f latex > code.sty

PYGMENTIZE_FLAGS=-l python -O style=emacs
%.py.tex: %.py;	pygmentize -f latex $(PYGMENTIZE_FLAGS) -o $@ $^

