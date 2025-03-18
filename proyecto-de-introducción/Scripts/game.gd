extends Node2D

@onready var star_scene = preload("res://scenes/star.tscn")


func _on_timer_timeout():
	var star = star_scene.instantiate()
	star.position.x = randi_range(0,get_viewport().size.x)
	star.position.y = 0
	add_child(star)
