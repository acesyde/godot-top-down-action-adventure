extends TileMap
class_name LevelTileMap

func _ready() -> void:
	LevelManager.ChangeTileMapBounds(GetTileMapBounds())

func GetTileMapBounds() -> Array[Vector2]:
	var bounds : Array[Vector2] = []
	
	bounds.append(
		Vector2(get_used_rect().position * rendering_quadrant_size)
	)
	
	bounds.append(
		Vector2(get_used_rect().end * rendering_quadrant_size)
	)
	
	print(bounds)
	
	return bounds
