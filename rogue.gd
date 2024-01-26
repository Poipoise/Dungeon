extends Node3D
var messages = [
	["Hello", "Help Me!", "The Goblins are being cringe frfr"], 
	["Wow!", "Get 'Em!", "You;re doing great!"],
	["Wow!", "Thanks for the help, king!"]
]

var message_count = 0
var typing_speed = .1
var read_time = 2

var current_message = 0
var display = ""
var current_char = 0
var dialogue = preload("res://dialogue.tscn")
var talking = false

func interacted():
	print("interacted")
	if not talking && message_count <= len(messages) - 1:
		talking = true
		start_dialogue()

func start_dialogue():
	current_message = 0
	display = ""
	current_char = 0
	
	$next_char.set_wait_time(typing_speed)
	$next_char.start()

func stop_dialogue():
	display = ""
	$Dialogue.text = display
	message_count = message_count + 1
	talking = false
	
func _on_next_char_timeout():
	if (current_char < len(messages[message_count][current_message])):
		var next_char = messages[message_count][current_message][current_char]
		display += next_char
		
		$Dialogue.text = display
		current_char += 1
	else:
		$next_char.stop()
		$next_message.one_shot = true
		$next_message.set_wait_time(read_time)
		$next_message.start()
		
func _on_next_message_timeout():
	if (current_message == len(messages[message_count]) -1):
		stop_dialogue()
	else: 
		current_message += 1
		display = ""
		current_char = 0
		$next_char.start()
	
