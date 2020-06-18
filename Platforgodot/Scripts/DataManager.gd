extends Node

var init_position
var life_player = 0

func set_life_player(value):
		life_player += value
		get_parent().get_node("Nivel0/HUB/HBContainer/LTextLife").text = String(life_player)

func is_game_over():
	return life_player == 0
