QUARTO := quarto
MD_FILES := syllabus_main.qmd syllabus_classes.qmd syllabus_policies.qmd

all: syllabus.qmd

md: syllabus.qmd
syllabus.qmd: syllabus_main.qmd syllabus_classes.qmd syllabus_policies.qmd
	cat syllabus_main.qmd syllabus_classes.qmd syllabus_policies.qmd > syllabus.qmd
	$(QUARTO) render syllabus.qmd -t gfm -o README.md

html: syllabus.html
syllabus.html: syllabus.qmd
	$(QUARTO) render syllabus.qmd --to html

tex: syllabus.tex
syllabus.tex: syllabus.qmd
	$(QUARTO) render syllabus.qmd --to tex --pdf-engine=xelatex -V geometry:"margin=1in" -V fontsize:"10pt"

pdf: syllabus.pdf
syllabus.pdf: syllabus.qmd
	$(QUARTO) render syllabus.qmd --to pdf --pdf-engine=xelatex -V geometry:"margin=1in" -V fontsize:"10pt"
