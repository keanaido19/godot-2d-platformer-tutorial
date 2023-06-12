extends State

@export var return_state: State
@export var return_animation: String = "Move"

@export var attack1_name: String = "attack1"
@export var attack2_name: String = "attack2"

@export var attack2_animation: String = "attack2"

@onready var timer: Timer = $Timer

func state_input(event: InputEvent):
	if event.is_action_pressed("attack"):
		timer.start()

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == attack1_name && not timer.is_stopped():
		playback.travel(attack2_animation)
	elif anim_name == attack1_name || anim_name == attack2_name:
		next_state = return_state
		playback.travel(return_animation)
