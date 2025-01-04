extends State
class_name StateIdle

@onready var walk: StateWalk = $"../Walk"


## Whats happens when the player enters this State ?
func Enter() -> void:
	player.UpdateAnimation("idle")
	
## Whats happens when the player exits this State ?
func Exit() -> void:
	pass

## What happens during the _process update in this State ?
func Process(delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	
	player.velocity = Vector2.ZERO
	return null

## What happens during the _physics_process update in this State ?
func Physics(delta: float) -> State:
	return null
	
## What happens with the input events in this State ?
func HandleInput(event: InputEvent) -> State:
	return null
