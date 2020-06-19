extends Area2D



func _on_DirArea2D0_body_entered(body):
	if body.is_in_group("Enemigos"):
		body.my_velocity_x = body.my_velocity_x * -1
		body.get_node("AnimatedSprite").flip_h = !body.get_node("AnimatedSprite").flip_h
