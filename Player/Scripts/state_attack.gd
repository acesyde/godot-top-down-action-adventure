extends State
class_name StateAttack

var attacking: bool = false

@export var attack_sound : AudioStream
@export_range(1, 20, 0.5) var decelerate_speed : float = 5.0

@onready var idle: StateIdle = $"../Idle"
@onready var walk: StateWalk = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_animation_player: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AttackAnimationPlayer"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"
@onready var attack_hurt_box: HurtBox = %AttackHurtBox

## Whats happens when the player enters this State ?
func enter() -> void:
	player.update_animation("attack")
	attack_animation_player.play("attack_"+player.anim_direction())
	animation_player.animation_finished.connect(end_attack)
	audio_stream_player_2d.stream = attack_sound
	audio_stream_player_2d.pitch_scale = randf_range(0.9, 1.1)
	audio_stream_player_2d.play()
	attacking = true
	
	await get_tree().create_timer(0.075).timeout
	attack_hurt_box.monitoring = true
	
## Whats happens when the player exits this State ?
func exit() -> void:
	animation_player.animation_finished.disconnect(end_attack)
	attacking = false
	attack_hurt_box.monitoring = false

## What happens during the _process update in this State ?
func process(delta: float) -> State:
	player.velocity -= player.velocity * decelerate_speed * delta
	
	if not attacking:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	
	return null

## What happens during the _physics_process update in this State ?
func physics(delta: float) -> State:
	return null
	
## What happens with the input events in this State ?
func handle_input(event: InputEvent) -> State:
	return null

func end_attack(animation_name:String) -> void:
	attacking = false
	attack_hurt_box.monitoring = false
