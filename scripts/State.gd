extends Node
class_name State

var active = false
var state_machine = null
var player: CharacterBody3D = null
var enemy: CharacterBody3D = null

func _ready() -> void:
	var parent = get_parent().get_parent()
	if parent is CharacterBody3D:
		if parent.get_script().get_path().find("PlayerController") != -1:
			player = parent
		else:
			enemy = parent
	state_machine = get_parent()
	
	set_active(false)
	
func set_active(is_active: bool):
	active = is_active
	if is_active: 
		enter()
	else: 
		exit()
	
	set_physics_process(is_active)
	set_process(is_active)
	set_process_input(is_active)

func enter():
	pass
	
func exit():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func handle_input(_event: InputEvent):
	pass
