# The Guild Of Merchant Explorers Parametric Insert

This is an insert for the game [The Guild Of Merchant Explorers](https://boardgamegeek.com/boardgame/350933/guild-merchant-explorers)

It uses the amazing [The Boardgame Insert Toolkit](https://github.com/dppdppd/The-Boardgame-Insert-Toolkit)

It has the library as a sub module, so make sure to clone it with submodules like `git clone --recurse-submodules git@github.com:fzerorubigd/gme-insert.git`, or clone it first and use `git submodule init` and `git submodule update` to fetch the toolkit.
 
To build the STL files, you need to install the [OpenSCAD](https://openscad.org/), and if you have make command ready to be used, then by `make all` all the parts plus a solid and a meshed lid will be generated. 

The Card Box, is bigger than it should, even bigger than the cards with sleeve. The reason is I don't like the insert to be smaller than box space (this game uses part of the box space) but if you wish to store the game vertically, I recommend to use the full height. 

For the card box, setting the infill to 10 or even 5 percent works fine. 