extends CharacterBody2D
class_name Enemy

signal direction_changed(new_direction: Vector2)
signal enemy_damaged()

const DIR_4: Array[Vector2] = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO

var player:Player
var invulnerable:bool = false

@export var hp:int = 3

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var enemy_state_machine: EnemyStateMachine = $StateMachine

func _ready() -> void:
	enemy_state_machine.initialize(self)
	player = PlayerManager.player

func _physics_process(delta: float) -> void:
	move_and_slide()

func set_direction(new_direction: Vector2) -> bool:
	direction = new_direction
	if direction == Vector2.ZERO:
		return false
		
	var direction_id : int = int(round((direction + cardinal_direction * 0.1).angle() / TAU * DIR_4.size()))
	new_direction = DIR_4[direction_id]
		
	if new_direction == cardinal_direction:
		return false
		
	cardinal_direction = new_direction
	direction_changed.emit(cardinal_direction)
	sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
		
	return true

func update_animation(state: String) -> void:
	var animation_name:String = state + "_" + anim_direction()
	animation_player.play(animation_name)

func anim_direction() -> String:
	match cardinal_direction:
		Vector2.UP: return "up"
		Vector2.DOWN: return "down"
		Vector2.LEFT: return "side"
		Vector2.RIGHT: return "side"
		_:
			return "unknown"
