extends KinematicBody2D
export(PackedScene) var my_laser

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var my_velocity_x = 300
var is_shoot
var my_target = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("Idle")
	is_shoot = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_shoot:
		$AnimatedSprite.play("Walk")
		move_and_collide(Vector2(my_velocity_x*delta, 0))

func _on_Area2D_body_entered(body):
	if body.is_in_group("Jugadores"):
		is_shoot = true
		my_target = body
		$Timer.start()
		enemy_shoot()
		
func enemy_shoot():
	var new_laser = my_laser.instance()
	$AnimatedSprite.play("Shoot")
	if global_position < my_target.global_position:
		$AnimatedSprite.flip_h = false
		$Arma.flip_h = false
		$Arma.global_position = $PosShootRight.global_position
		new_laser.position = $PosShootRight.position
		new_laser.my_speed = Vector2(300,0)
	else:
		$AnimatedSprite.flip_h = true
		$Arma.flip_h = true
		$Arma.global_position = $PosShootLeft.global_position
		new_laser.position = $PosShootLeft.position
		new_laser.my_speed = Vector2(-300,0)
	$Arma.visible = true
	call_deferred("add_child",new_laser)
	$SfxShoot.play()

func _on_Area2D_body_exited(body):
	if body.is_in_group("Jugadores"):
		$AnimatedSprite.play("Idle")
		$Arma.visible = false
		$Timer.stop()
		is_shoot = false

func _on_Timer_timeout():
	enemy_shoot()
