extends Node
class_name PlayerStateMachine

var states: Array[State]
var previous_state: State
var current_state: State

func _ready() -> void:
	process_mode = Node.ProcessMode.PROCESS_MODE_DISABLED

func _process(delta: float) -> void:
	change_state(current_state.process(delta))

func _physics_process(delta: float) -> void:
	change_state(current_state.physics(delta))

func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))

func initialize(player: Player) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
			
	if states.size() > 0:
		states[0].player = player
		change_state(states[0])
		
	process_mode = Node.ProcessMode.PROCESS_MODE_INHERIT

func change_state(new_state:State) -> void:
	if new_state == null || new_state == current_state:
		return
		
	if current_state:
		current_state.exit()

	previous_state = current_state
	current_state = new_state
	current_state.enter()
