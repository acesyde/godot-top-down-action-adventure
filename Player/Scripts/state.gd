extends Node
class_name State

## Stores a reference to the player that this State belongs to
static var player: Player

## Whats happens when the player enters this State ?
func enter() -> void:
	pass
	
## Whats happens when the player exits this State ?
func exit() -> void:
	pass

## What happens during the _process update in this State ?
func process(delta: float) -> State:
	return null

## What happens during the _physics_process update in this State ?
func physics(delta: float) -> State:
	return null
	
## What happens with the input events in this State ?
func handle_input(event: InputEvent) -> State:
	return null
