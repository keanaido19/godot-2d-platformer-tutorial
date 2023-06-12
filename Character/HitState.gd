extends State

class_name HitState

@export var damageable: Damageable

@export var death_state: State
@export var return_state: State

@export var hit_animation: String = "hit"
@export var hit_animation_name: String = "hit"
@export var death_animation: String = "death"

@export var knockback_speed: float = 300.0

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_damageable_hit(node: Node, damage_taken: int, knockback_direction: Vector2):
	character.velocity = knockback_speed * knockback_direction
	if (damageable.health > 0):
		emit_signal("interupt_state", self)
		playback.start(hit_animation)		
	else:
		emit_signal("interupt_state", death_state)
		playback.travel(death_animation)


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == hit_animation_name:
		next_state = return_state
