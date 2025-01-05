extends State
class_name StateIdle

@onready var walk: StateWalk = $"../Walk"
@onready var attack: StateAttack = $"../Attack"


## Whats happens when the player enters this State ?
func enter() -> void:
	player.update_animation("idle")
	
## Whats happens when the player exits this State ?
func exit() -> void:
	pass

## What happens during the _process update in this State ?
func process(delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null

## What happens during the _physics_process update in this State ?
func physics(delta: float) -> State:
	return null
	
## What happens with the input events in this State ?
func handle_input(event: InputEvent) -> State:
	
	if event.is_action_pressed("attack"):
		return attack
	
	return null
