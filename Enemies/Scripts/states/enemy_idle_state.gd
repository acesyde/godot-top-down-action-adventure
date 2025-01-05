extends EnemyState
class_name  EnemyIdleState

@export var anim_name:String = "idle"

@export_category("AI")
@export var state_duration_min : float = 0.5
@export var state_duration_max : float = 1.5
@export var after_idle_state : EnemyState

var _timer : float = 0.0

## Whats happens when the enemy enters this State ?
func enter() -> void:
	enemy.velocity = Vector2.ZERO
	_timer = randf_range(state_duration_min, state_duration_max)
	enemy.update_animation(anim_name)
	
## Whats happens when the enemy exits this State ?
func exit() -> void:
	pass

## What happens during the _process update in this State ?
func process(delta: float) -> EnemyState:
	_timer -= delta
	
	if _timer <= 0:
		return after_idle_state
	
	return null

## What happens during the _physics_process update in this State ?
func physics(delta: float) -> EnemyState:
	return null
