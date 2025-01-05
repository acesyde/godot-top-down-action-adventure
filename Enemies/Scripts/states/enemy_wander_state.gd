extends EnemyState
class_name  EnemyWanderState

@export var anim_name : String = "walk"
@export var wander_speed : float = 30.0

@export_category("AI")
@export var state_animation_duration : float = 0.7
@export var state_cycles_min : int = 1
@export var state_cycles_max : int = 3
@export var next_state : EnemyState

var _timer : float = 0.0
var _direction : Vector2 = Vector2.ZERO

## Whats happens when the enemy enters this State ?
func enter() -> void:
	_timer = randi_range(state_cycles_min, state_cycles_max) * state_animation_duration
	var rand = randi_range(0,3)
	_direction = enemy.DIR_4[rand]
	enemy.velocity = _direction * wander_speed
	enemy.set_direction(_direction)
	enemy.update_animation(anim_name)
	
## Whats happens when the enemy exits this State ?
func exit() -> void:
	pass

## What happens during the _process update in this State ?
func process(delta: float) -> EnemyState:
	_timer -= delta
	
	if _timer <= 0:
		return next_state
	
	return null

## What happens during the _physics_process update in this State ?
func physics(delta: float) -> EnemyState:
	return null
