extends StaticBody3D
@export var animplayer: AnimationPlayer
var open = false

func interacted():
	print("interacted")
	if not open:
		open = true
		animplayer.play("open")
		await animplayer.animation_finished

