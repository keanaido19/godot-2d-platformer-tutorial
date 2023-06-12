extends State

@export var death_animation_name: String = "death"

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == death_animation_name:
		character.queue_free()
