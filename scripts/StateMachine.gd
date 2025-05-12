extends Node

class_name StateMachine

var states: Dictionary = {}
var current_state: State = null
var previous_state: State = null

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_machine = self

func _process(delta):
	if current_state:
		current_state.update(delta)

func _physics_process(delta):
	if current_state:
		current_state.physics_update(delta)

func change_state(state_name: String):
	if state_name.to_lower() in states:
		if current_state:
			current_state.set_active(false)
		current_state = states[state_name.to_lower()]
		current_state.set_active(true)
 
