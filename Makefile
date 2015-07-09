INKSCAPE = inkscape
GHOSTSCRIPT = gs

SLIDES = 00_retroprogramacao.pdf \
			   00a_mame.pdf \
         01_gunsmoke_PCB.pdf \
         02_gunsmoke_main_system.pdf \
         03_gunsmoke_maincpu_eeproms_and_ram.pdf \
         04_CAPCOM_JAMMA.pdf \
         05_ColorPalette.pdf \
				 06_DIP_Switches.pdf \
         07_gunsmoke_boards.pdf \
         08_cps1_maincpu.pdf \
         09_EEPROM.pdf \
         10_universal_eeprom_dumper.pdf \
	       11_minipro_swlivre.pdf \
				 12_pixotosco.pdf \
		     13_passaporte.pdf

PDF = FISL_emuladores_2014.pdf

all: $(PDF)

clean:
	rm -rf $(SLIDES)
	rm $(PDF)

%.pdf: %.svg
	$(INKSCAPE) -f $< --export-pdf=$@

$(PDF): $(SLIDES)
	$(GHOSTSCRIPT) -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=$(PDF) $(SLIDES)
	evince $(PDF)
