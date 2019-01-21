extends Node

var tile_size = 16

onready var Map = $World

func _ready():
	tile_size = Map.cell_size
func update_tile(check_tile_pos):
	var stack = []
	stack.append(check_tile_pos + Vector2(0,-1))
	stack.append(check_tile_pos + Vector2(1,0))
	stack.append(check_tile_pos + Vector2(0,-1))
	stack.append(check_tile_pos + Vector2(-1,0))
	# if statements
	#check North
	var check_id = stack[0].get_id()
	if check_id <= 0 && check_id <= 15:
		if check_id <= 32 && check_id <= 36:
			