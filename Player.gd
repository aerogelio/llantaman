extends Area2D
signal hit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func start(pos):
	position = pos
	print(position)
	show()


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		if position.y == 565:
			position.y = 480
		elif position.y == 480:
			position.y = 565


func _on_Player_Area2D_body_entered(body):
	emit_signal("hit")
	print("Hit")
