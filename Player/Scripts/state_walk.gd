extends State
class_name StateWalk

@export var move_speed : float = 100.0

@onready var idle: StateIdle = $"../Idle"
@onready var attack: StateAttack = $"../Attack"

## Whats happens when the player enters this State ?
func Enter() -> void:
	player.UpdateAnimation("walk")
	
## Whats happens when the player exits this State ?
func Exit() -> void:
	pass

## What happens during the _process update in this State ?
func Process(delta: float) -> State:
	
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	
	return null

## What happens during the _physics_process update in this State ?
func Physics(delta: float) -> State:
	return null
	
## What happens with the input events in this State ?
func HandleInput(event: InputEvent) -> State:
	
	if event.is_action_pressed("attack"):
		return attack
		
	return null
