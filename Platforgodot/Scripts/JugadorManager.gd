extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity= Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	print(DataManager.init_position)
	global_position = DataManager.init_position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += 200 * delta
	if Input.is_action_pressed("Robot_jump") and is_on_floor():
		velocity.y = -200
	if Input.is_action_pressed("Robot_left"):
		velocity.x = -200
		$AnimationPlayer.play("Left")
	if Input.is_action_pressed("Robot_right"):
		velocity.x = 200
		$AnimationPlayer.play("Right")
	if !Input.is_action_pressed("Robot_right") and !Input.is_action_pressed("Robot_left"):
		velocity.x = 0
		$AnimationPlayer.play("Idle")
	if !is_on_floor():
		$AnimationPlayer.play("Jump")
	move_and_slide(velocity,Vector2(0,-1))

func _on_Area2D_body_entered(body):
	if body == self:
		get_tree().reload_current_scene()

func _on_CheckArea2D0_body_entered(body):
	if body == self:
		DataManager.init_position = body.global_position
