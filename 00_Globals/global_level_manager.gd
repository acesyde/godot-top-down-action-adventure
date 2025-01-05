extends Node
class_name GlobalLevelManager

signal tile_map_bounds_changed(bounds: Array[Vector2])

var current_tilemap_bounds : Array[Vector2]

func ChangeTileMapBounds(bounds: Array[Vector2]) -> void:
	current_tilemap_bounds = bounds
	tile_map_bounds_changed.emit(bounds)
