extends StaticBody3D
@export var animplayer: AnimationPlayer
var open = false

func interacted():
	if not open:
		open = true
		animplayer.play("Open_Forward")
		await animplayer.animation_finished
	elif open:
		open = false
		animplayer.play_backwards("Open_Forward")
		await animplayer.animation_finished
