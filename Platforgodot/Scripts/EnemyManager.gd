extends KinematicBody2D
export(PackedScene) var my_laser

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _on_Area2D_body_entered(body):
	if body.is_in_group("Jugadores"):
		var new_laser = my_laser.instance()
		$AnimatedSprite.play("Shoot")
		if global_position < body.global_position:
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


func _on_Area2D_body_exited(body):
	if body.is_in_group("Jugadores"):
		$AnimatedSprite.play("Idle")
		$Arma.visible = false
