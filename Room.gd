extends Node2D

onready var R1 = preload("res://MapScenes/Rooms/Room1.tscn")

func _ready():
	add_child(R1.instance())
	pass
