extends Node2D
class_name Plant

@onready var hit_box: HitBox = $HitBox

func _ready() -> void:
	hit_box.Damaged.connect(TakeDamage)

func TakeDamage(damage:int) -> void:
	queue_free()
