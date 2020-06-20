extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Vida0_body_entered(body):
	if body.is_in_group("Jugadores"):
		if is_in_group("Vidas"):
			DataManager.set_life_player(1)
		$AudioStreamPlayer.play()
		$AnimationPlayer.play("Delete")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Delete":
		if is_in_group("LastItem"):
			get_tree().change_scene("res://Interfaces/Credit.tscn")
	queue_free()
