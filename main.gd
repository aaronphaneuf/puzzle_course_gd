extends Node

var grid_manager = load("res://scenes/manager/grid_manager.gd")

var GRID_SIZE = 32

var building_scene = preload("res://building.tscn")
var hovered_grid_cell = null
var occupied_cells = {}


#@onready var highlight_tile_map_layer = $highlightTileMapLayer
@onready var cursor = $Cursor

# Called when the node enters the scene tree for the first time.
func _ready():
	#print("Ready - TileMapLayer:", grid_manager._highlight_tile_map_layer)
	#var grid_manager = load("res://scenes/manager/grid_manager.gd").new()
	cursor.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var grid_position = grid_manager.get_mouse_cell_position()
	#cursor.global_position = grid_position * GRID_SIZE
	#
	#if cursor.visible && (hovered_grid_cell == null or hovered_grid_cell != grid_position):
		#hovered_grid_cell = grid_position
		#grid_manager.highlight_valid_tiles_in_radius(hovered_grid_cell, 3)
		#update_highlight_tile_map_layer()
	
#func get_mouse_cell_position():
	#var mouse_position = highlight_tile_map_layer.get_global_mouse_position()
	#var grid_position = mouse_position / GRID_SIZE
	#grid_position = grid_position.floor()
	#return grid_position
	
func _unhandled_input(event):
	if hovered_grid_cell!= null && event.is_action_pressed("left_click") && !occupied_cells.has(hovered_grid_cell):
		place_building()
		cursor.visible = false
	
		
func place_building():
	if hovered_grid_cell == null:
		return
	var building = building_scene.instantiate()
	add_child(building)
	#var grid_position = get_mouse_cell_position()
	building.global_position = hovered_grid_cell * GRID_SIZE
	occupied_cells[hovered_grid_cell] = true
	print(occupied_cells)
	
	hovered_grid_cell = null
	grid_manager.clear_highlighted_tiles()
	
#func update_highlight_tile_map_layer():
	#highlight_tile_map_layer.clear()
#
	#if hovered_grid_cell == null:
		#return
#
	#for x in range(hovered_grid_cell.x - 3, hovered_grid_cell.x + 4):
		#for y in range(hovered_grid_cell.y - 3, hovered_grid_cell.y + 4):
			#var position = Vector2i(x, y)
			#highlight_tile_map_layer.set_cell(position, 0, Vector2i(0,1))
			
	
func _on_building_button_pressed():
	cursor.visible = true
