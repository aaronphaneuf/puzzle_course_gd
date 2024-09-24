extends Node

var GRID_SIZE = 32

@export var _highlight_tile_map_layer: TileMapLayer
@export var _base_terrain_tilemap_layer: TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Ready - TileMapLayer:", _highlight_tile_map_layer)
	
	
func highlight_valid_tiles_in_radius(root_cell: Vector2, radius: int):
	clear_highlighted_tiles()

	for x in range(root_cell.x - radius, root_cell.x + (radius + 1)):
		for y in range(root_cell.y - radius, root_cell.y + (radius + 1)):
			var position = Vector2i(x, y)
			_highlight_tile_map_layer.set_cell(position, 0, Vector2i(0,1))
			
func clear_highlighted_tiles():
	_highlight_tile_map_layer.clear()
	
func get_mouse_cell_position():
	print("Calling get_mouse_cell_position")
	print(_highlight_tile_map_layer)  # This will help see if it's initialized
	if _highlight_tile_map_layer == null:
		print("TileMapLayer is null!")
	else:
		var mouse_position = _highlight_tile_map_layer.get_global_mouse_position()
		print("Mouse position:", mouse_position)
	
