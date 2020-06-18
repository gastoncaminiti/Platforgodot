extends Area2D

export(PackedScene) var my_laser
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TorreEnemiga_body_entered(body):
	if body.is_in_group("Jugadores"):
		$AnimatedSprite.play("Shoot")
		$AnimatedSprite.frame = 0
		$SfxShoot.play()
		var new_laser = my_laser.instance()
		call_deferred("add_child",new_laser)
		
