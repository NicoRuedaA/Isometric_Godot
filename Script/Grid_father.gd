extends TileMap

enum {
	EMPTY = -1,
	MOVEMENT = 0,
	ATTACK = 1,
	CLICKED_NORMAL = 2,
	P1_NORMAL = 3,
	P2_NORMAL = 4,
	P2_BOSS = 14,
	P1_BOSS = 15,
	CLICKED_BOSS = 16
}

func print_cell(cell,tile):
	set_cellv(cell, tile)
