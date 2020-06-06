extends Node

export (PackedScene) var Enemy
export var speed = -400
export var score = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func start_new_game():
	$Back_AudioStreamPlayer.play()
	$Background_Node2D.show()
	$Player_Area2D.start( $StartPosition_Position2D.position )
	$Enemy_Timer.start()
	$Speed_Timer.start()
	$Score_Timer.start()
	
func game_over():
	$Back_AudioStreamPlayer.stop()
	$Enemy_Timer.stop()
	$Speed_Timer.stop()
	$Score_Timer.stop()
	speed = -400
	score = 0
	$Enemy_Timer.wait_time = 1
	$Splash_CanvasLayer.restart()
	$Background_Node2D.hide()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Background_Node2D.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Enemy_Timer_timeout():
	var enemy = Enemy.instance()
	var upordown = rand_range(1,2)
	add_child(enemy)
	#enemy.position = Vector2(800, 565)
	#I am fuck noob
	if upordown <= 1.5:
		enemy.position = Vector2(800, 480)
	else:
		enemy.position = Vector2(800, 565)
	enemy.linear_velocity = Vector2(speed, 0)


func _on_Player_Area2D_hit():
	game_over()


func _on_Speed_Timer_timeout():
	speed  -= 20
	$Enemy_Timer.wait_time -= .1
	if $Enemy_Timer.wait_time <= .5:
		$Enemy_Timer.wait_time = .5

func _on_Splash_CanvasLayer_start_game():
	start_new_game()


func _on_Score_Timer_timeout():
	score += 1
	$Splash_CanvasLayer/Label.text = "       " + str(score)
