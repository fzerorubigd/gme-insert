# Depth of the cards box, 29 is enough, tho the top will be empty and I don't like it, so I go for full
gme_card_depth=58
# Print a solid lid, set to false to go for the meshed lid
gme_lid_solid=true

# No change after this line is required, unless you know what you are doing, or don't. who am I to tell you. 
SPLIT = $(subst -, ,$@)
COMPONENT = $(word 2, $(SPLIT))

all: player token coin card
	@echo Done!

zip: clean all
	zip gme-insert.zip dist/*.stl

token: box-token
coin: box-coin lid-coin
player: box-player_top_2x lid-player_top_2x box-player_bottom_2x
card: box-card lid-card box-card_bottom_optional

dist: 
	mkdir -p dist

lid-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "gme_card_depth=$(gme_card_depth)" -D "gme_lid_solid=true" -o dist/$(COMPONENT)-lid-solid.stl ./gme.scad
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=true" -D "g_b_print_box=false" -D "gme_card_depth=$(gme_card_depth)" -D "gme_lid_solid=false" -o dist/$(COMPONENT)-lid.stl ./gme.scad

box-%: dist
	openscad -D "g_isolated_print_box=\"$(COMPONENT)\"" -D "g_b_print_lid=false" -D "g_b_print_box=true" -D "gme_card_depth=$(gme_card_depth)" -o dist/$(COMPONENT)-box.stl ./gme.scad

clean:
	rm -f dist/*.stl gme-insert.zip