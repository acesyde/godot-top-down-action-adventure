extends CharacterBody2D
class_name Player

#--------------------------------
# Exported variables
#--------------------------------
@export var move_speed : float = 100.0

#--------------------------------
# Onready variables
#--------------------------------
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D

#--------------------------------
# Local variables
#--------------------------------
var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var state : String = "idle"

func _process(delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * move_speed
	
	if SetState() || SetDirection():
		UpdateAnimation()

func _physics_process(delta: float) -> void:
	move_and_slide()

func SetDirection() -> bool:
	var new_direction : Vector2 = cardinal_direction
	
	if direction == Vector2.ZERO:
		return false
		
	if direction.y == 0:
		new_direction = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_direction = Vector2.UP if direction.y < 0 else Vector2.DOWN
		
	if new_direction == cardinal_direction:
		return false
		
	cardinal_direction = new_direction
	sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
		
	return true

func SetState() -> bool:
	var new_state : String = "idle" if direction == Vector2.ZERO else "walk"
	
	if new_state == state:
		return false

	state = new_state
	return true

func UpdateAnimation() -> void:
	var animation_name:String = state+"_"+AnimDirection()
	animation_player.play(animation_name)
	
func AnimDirection() -> String:
	match cardinal_direction:
		Vector2.UP: return "up"
		Vector2.DOWN: return "down"
		Vector2.LEFT: return "side"
		Vector2.RIGHT: return "side"
		_:
			return "unknown"
