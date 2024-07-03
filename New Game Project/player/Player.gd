extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.


	# Handle jump.
	if Input.is_action_just_pressed("ui_up") or is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	var direction1 = Input.get_axis("ui_up", "ui_down")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction1:
		velocity.y = direction1 * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
	move_and_slide()


func _on_button_pressed():
	get_tree().quit()
