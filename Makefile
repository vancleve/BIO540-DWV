QUARTO := quarto
MD_FILES := syllabus_main.qmd syllabus_classes.qmd syllabus_policies.qmd

all: syllabus.qmd syllabus.html syllabus.pdf

md: syllabus.qmd
syllabus.qmd: syllabus_main.qmd syllabus_classes.qmd syllabus_policies.qmd
	cat syllabus_main.qmd syllabus_classes.qmd syllabus_policies.qmd > syllabus.qmd
	$(QUARTO) render syllabus.qmd -t gfm -o README.md

html: syllabus.html
syllabus.html: syllabus.qmd
	$(QUARTO) render syllabus.qmd --to html

tex: syllabus.tex
syllabus.tex: syllabus.qmd
	$(QUARTO) render syllabus.qmd --to latex --pdf-engine=xelatex \
		-V geometry:"margin=1in" -V fontsize:"10pt" \
        -V mainfont: "Minion Pro" \
        -V sansfont: "Myriad Pro" \
        -V monofont: "Fira Code" \
        -V mathfont: "TeX Gyre Pagella Math" \
        -V sansfontoptions: "Scale=MatchLowercase" \
        -V monofontoptions: "Scale=MatchLowercase" \
        -V mathfontoptions: "Scale=MatchLowercase"

pdf: syllabus.pdf
syllabus.pdf: syllabus.qmd
	$(QUARTO) render syllabus.qmd --to pdf --pdf-engine=xelatex \
		-V "geometry: margin=1in" \
		-V "fontsize:10pt" \
        -V "mainfont: Minion Pro" \
        -V "sansfont: Myriad Pro" \
        -V "monofont: Fira Code" \
        -V "mathfont: TeX Gyre Pagella Math" \
        -V "sansfontoptions: Scale=MatchLowercase" \
        -V "monofontoptions: Scale=MatchLowercase" \
        -V "mathfontoptions: Scale=MatchLowercase"
