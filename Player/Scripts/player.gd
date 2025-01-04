extends CharacterBody2D
class_name Player

@export var move_speed : float = 100.0

func _process(delta: float) -> void:
	var direction : Vector2 = Input.get_vector("left", "right", "up", "down")
	
	velocity = direction * move_speed

func _physics_process(delta: float) -> void:
	move_and_slide()
