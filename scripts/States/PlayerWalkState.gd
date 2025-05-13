extends State


func enter():
	#print("walk")
	pass

func physics_update(_delta):
	if not player.is_on_floor():
		player.velocity.y -= player.gravity * _delta

	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction:
		player.velocity.x = direction.x * player.move_speed
		player.velocity.z = direction.z * player.move_speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.move_speed)
		player.velocity.z = move_toward(player.velocity.z, 0, player.move_speed)

	player.move_and_slide()

	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_machine.change_state("jumping")
	if input_dir.length() < 0.1:
		state_machine.change_state("idle") 
