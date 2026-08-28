class_name Room
extends Node3D


@onready var floors: GridMap = %Floors
@onready var ceilings: GridMap = %Ceilings


var no_ceiling_cell_ids := []


func _ready() -> void:
	fill_ceilings()


func fill_ceilings() -> void:
	for cell_name: StringName in ["Ground", "Hole-Corner", "Hole-Ground", "Hole-Side", "Hole-UTurn"]:
		no_ceiling_cell_ids.push_back(floors.mesh_library.find_item_by_name(cell_name))
	
	var used_cells: Array[Vector3i] = floors.get_used_cells()
	for cell_coords in used_cells:
		var tile_id: int = floors.get_cell_item(cell_coords)
		if no_ceiling_cell_ids.has(tile_id):
			ceilings.set_cell_item(cell_coords, 0)
