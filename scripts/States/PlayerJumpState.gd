extends State

var can_jump = true

func enter():
	#print("jump")
	player.velocity.y = player.jump_velocity
	can_jump = false

func physics_update(_delta):
	player.velocity.y -= player.gravity * _delta
	
	# 获取输入方向
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# 处理水平移动
	if direction:
		player.velocity.x = direction.x * player.move_speed
		player.velocity.z = direction.z * player.move_speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.move_speed)
		player.velocity.z = move_toward(player.velocity.z, 0, player.move_speed)
	
	# 应用移动
	player.move_and_slide()
	
	# 检查是否落地
	if player.is_on_floor():
		can_jump = true
		if player.velocity.length() < 0.1:
			#print("空闲状态")
			state_machine.change_state("idle")
		else:
			#print("行走状态")
			state_machine.change_state("walking") 
