INKSCAPE = inkscape
GHOSTSCRIPT = gs

SLIDES = 00_INTRO.svg \
         01_hw_livre.svg \
         02_Linux_Libre.svg \
         03_Datasheet.svg \
         04_Reverse_Engeneering.svg \
         05_Sean_Cross.svg \
         06_old_vs_new.svg \
         07_MAME.svg \
         08_Carrier_Air_Wing.svg \
         09_Exemplo_de_driver.svg \
         10_MESS.svg \
         11_Replicator_1.svg \
         12_Uzebox.svg \
         13_Minicom_IV.svg \
         14_But_is_it_free_software.svg \
         15_The_paradox.svg \
         16_Internet_Archive.svg \
         17_thanks.svg

PDF = FISL_hw_livre_2015.pdf

all: $(PDF)

clean:
	rm -rf $(SLIDES)
	rm $(PDF)

%.pdf: %.svg
	$(INKSCAPE) -f $< --export-pdf=$@

$(PDF): $(SLIDES)
	$(GHOSTSCRIPT) -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$(PDF) $(SLIDES)
	evince $(PDF)
