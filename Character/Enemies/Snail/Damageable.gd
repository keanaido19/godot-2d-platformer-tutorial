extends Node

class_name Damageable

signal on_hit(node: Node, damage_taken: int, knockback_direction: Vector2)

@export var health: float = 20:
	get:
		return health
	set(value):
		SignalBus.emit_signal("on_health_changed", get_parent(), value - health)
		health = value

func hit(damage: int, knockback_direction: Vector2):
	if health > 0:
		health -= damage
		emit_signal("on_hit", get_parent(), damage, knockback_direction)
