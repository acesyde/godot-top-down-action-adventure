extends Area2D
class_name HitBox

signal Damaged(damage:int)

func TakeDamage(damage: int) -> void:
	Damaged.emit(damage)
