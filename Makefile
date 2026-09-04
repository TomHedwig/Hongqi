.PHONY: issue-1976-10 clean

issue-1976-10:
	latexmk -xelatex -cd issues/1976/10/main.tex

clean:
	latexmk -C -cd issues/1976/10/main.tex

