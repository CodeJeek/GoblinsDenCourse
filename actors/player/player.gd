class_name Player
extends CharacterBody3D


const MAX_ANGLE_LOOK_UP := deg_to_rad(80)
const MAX_ANGLE_LOOK_DOWN := deg_to_rad(-70)


@onready var camera: Camera3D = $Camera3D
@onready var states: Node = $States
@onready var animation_tree: AnimationTree = $AnimationTree

@onready var state: PlayerState : set = set_state

@export var gravity: float
@export var acceleration: float
@export var walk_speed: float
@export var run_speed: float
@export var jump_strength: float
@export var mouse_sensitivity: float

var input_dir := Vector2.ZERO


func _ready() -> void:
	for state in states.get_children():
		state.context = self
	set_state(find_child("Idle"))

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(delta: float) -> void:
	input_dir = Input.get_vector("left", "right", "backward", "forward")


func _physics_process(delta: float) -> void:
	var input_3d_space := Vector3(input_dir.x, 0, -input_dir.y)
	var target_speed := run_speed if Input.is_action_pressed("run") else walk_speed
	var desired_velocity := transform.basis * input_3d_space * target_speed
	
	velocity.x = move_toward(velocity.x, desired_velocity.x, acceleration * delta)
	velocity.z = move_toward(velocity.z, desired_velocity.z, acceleration * delta)

	if not is_on_floor():
		velocity.y -= gravity
	
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera.rotate_x(-event.relative.y * mouse_sensitivity)
		camera.rotation.x = clampf(camera.rotation.x, MAX_ANGLE_LOOK_DOWN, MAX_ANGLE_LOOK_UP)

	if event.is_action_pressed("jump"):
		jump()

	if event.is_action_pressed("escape"):
		change_mouse_mode()


func jump() -> void:
	if is_on_floor():
		velocity.y = jump_strength


func set_state(new_state: PlayerState) -> void:
	if state:
		state.exit()
		new_state.previous_state = state
	
	state = new_state
	state.enter()


func change_mouse_mode() -> void:
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
