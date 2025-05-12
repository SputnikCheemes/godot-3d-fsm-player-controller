extends CharacterBody3D

@export var move_speed: float = 7.0
@export var jump_velocity: float = 4.5
@export var gravity: float = 9.8

@onready var state_machine = $StateMachine
@onready var camera = $Camera3D


func _ready():

	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	state_machine.change_state("idle")

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * 0.005)
		camera.rotate_x(-event.relative.y * 0.005)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
	
	if event.is_action_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
