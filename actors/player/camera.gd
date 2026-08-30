extends Camera3D


@export var player_root: Node3D
@export var eye_bone_name: StringName = "mixamorig_Head"
@export var offset: Vector3 = Vector3(0, 0.06, 0.03)

var skeleton: Skeleton3D
var bone_idx: int = -1


func _ready() -> void:
	print("实现相机眼睛追踪")
