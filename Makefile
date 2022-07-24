#Depth of the cards, 29 is enough, tho the top will be empty and I don't like it, so I go for full
gme_card_depth=58
# Print a solid lid, set to false to go for the meshed lid
gme_lid_solid=true

all: clean player-x4 token coin card
	@echo Done!
	
%:
	openscad -D "g_isolated_print_box=\"$@\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "gme_card_depth=$(gme_card_depth)" -D "gme_lid_solid=true" -o $@-lid-solid.stl ./gme.scad
	openscad -D "g_isolated_print_box=\"$@\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "gme_card_depth=$(gme_card_depth)" -D "gme_lid_solid=false" -o $@-lid.stl ./gme.scad
	openscad -D "g_isolated_print_box=\"$@\"" -D "g_b_print_lid=false" -D "g_b_print_box=true" -D "gme_card_depth=$(gme_card_depth)" -o $@-box.stl ./gme.scad

clean:
	rm *.stl