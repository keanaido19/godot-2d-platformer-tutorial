extends Control

class_name Transitioner

@onready var texture_rect: TextureRect = $TextureRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var fade_in_animation_name: String = "fade_in"
@export var fade_out_animation_name: String = "fade_out"


# Called when the node enters the scene tree for the first time.
func _ready():
	texture_rect.visible = false

func set_next_animation(fading_out: bool):
	animation_player.stop()
	if fading_out:
		animation_player.queue("fade_out")
	else:
		animation_player.queue("fade_in")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == fade_in_animation_name:
		get_tree().paused = false


func _on_animation_player_animation_started(anim_name):
	if anim_name == fade_out_animation_name:
		get_tree().paused = true
