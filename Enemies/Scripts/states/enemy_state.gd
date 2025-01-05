extends Node
class_name  EnemyState

var enemy: Enemy
var state_machine: EnemyStateMachine

func init() -> void:
	pass

## Whats happens when the enemy enters this State ?
func enter() -> void:
	pass
	
## Whats happens when the enemy exits this State ?
func exit() -> void:
	pass

## What happens during the _process update in this State ?
func process(delta: float) -> EnemyState:
	return null

## What happens during the _physics_process update in this State ?
func physics(delta: float) -> EnemyState:
	return null
