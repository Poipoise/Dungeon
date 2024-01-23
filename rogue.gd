extends Node3D

var dialogue = preload("res://dialogue.tscn")
var talking = false
var d
func _ready():
	d = dialogue.instance()

func interacted():
	talking = true
	add_child(d)
