extends State

const GRAVITY = 9.8

func enter():
	#print("idle")
	player.velocity.x = 0
	player.velocity.z = 0

func physics_update(_delta):

	# 应用重力
	if not player.is_on_floor():
		player.velocity.y -= GRAVITY * _delta
	player.move_and_slide()

	# 检查移动输入，切换到walking
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	if input_dir.length() > 0.1:
		state_machine.change_state("walking")
		
	# 检查跳跃输入
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		state_machine.change_state("jumping")

func exit() -> void:
	pass
