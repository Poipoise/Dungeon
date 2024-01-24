extends Node3D
var messages = [
	"Hello",
	"Help Me!"
]

var typing_speed = .1
var read_time = 2

var current_message = 0
var display = ""
var current_char = 0
var dialogue = preload("res://dialogue.tscn")
var talking = false

func interacted():
	print("interacted")
	var d = dialogue.instantiate()
	talking = true
	add_child(d)
