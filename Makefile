INKSCAPE = inkscape
GHOSTSCRIPT = gs

SLIDES = 00_INTRO.pdf \
         01_HW_Livre.pdf \
         02_Linux_Libre.pdf \
         03_Datasheet.pdf \
         04_Reverse_Engeneering.pdf \
         05_Sean_Cross.pdf \
         06_old_vs_new.pdf \
         07_MAME.pdf \
         08_Carrier_Air_Wing.pdf \
         09_Exemplo_de_driver.pdf \
         10_MESS.pdf \
         11_Replicator_1.pdf \
         12_Uzebox.pdf \
         13_Minicom_IV.pdf \
         14_free_software.pdf \
         15_paradox.pdf \
         16_Internet_Archive.pdf \
         17_thanks.pdf

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
