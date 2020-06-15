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
	DataManager.life_player += 1
	$AudioStreamPlayer.play()
	print(DataManager.life_player)
	$AnimationPlayer.play("Delete")
