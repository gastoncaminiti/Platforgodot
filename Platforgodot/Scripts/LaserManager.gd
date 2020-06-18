extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed
export(Vector2) var my_speed
# Called when the node enters the scene tree for the first time.
func _ready():
	speed = -300

func _process(delta):
	var collision_body = move_and_collide(my_speed * delta)
	if collision_body != null:
		if !collision_body.get_collider().is_in_group("Enemigos"):
			$AnimatedSprite.play("Delete")
			$AnimatedSprite.z_index=2
			$AnimatedSprite.global_position.x -= 25
			$CollisionShape2D.disabled = true
			$SfxImpact.play()
			my_speed= Vector2(0,0)
			if collision_body.get_collider().is_in_group("Jugadores"):
				DataManager.set_life_player(-1)
				if DataManager.is_game_over():
					get_tree().reload_current_scene()


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Delete":
		queue_free()
