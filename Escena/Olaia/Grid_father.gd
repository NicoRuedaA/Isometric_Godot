extends TileMap


enum {EMPTY=-1, MOVEMENT=0, ATTACK}

func print_cell(cell,tile):
	set_cellv(cell, tile)
