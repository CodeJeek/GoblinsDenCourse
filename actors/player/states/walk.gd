extends PlayerState


func enter() -> void:
	context.animation_tree.enable_condition("walk")


func exit() -> void:
	context.animation_tree.disable_condition("walk")


func _physics_process(delta: float) -> void:
	var horizontial_velocity := Vector3(context.velocity.x, 0, context.velocity.z)
	if horizontial_velocity.length_squared() == 0 and context.is_on_floor():
		context.state = context.find_child("Idle")
