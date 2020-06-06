extends CanvasLayer
signal start_game
onready var admob = $Admob

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func restart():
	$Label.show()
	$Start_Button.show()
	$TextureRect.show()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Intro_AudioStreamPlayer.play()
	admob.load_banner()
	admob.show_banner()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_Button_button_up():
	$Intro_AudioStreamPlayer.stop()
	$Start_Button.hide()
	$TextureRect.hide()
	$Label.text = "       0"
	emit_signal("start_game")
