extends RigidBody2D


onready var break_s : AudioStreamPlayer = get_node("break")
onready var start_s : AudioStreamPlayer = get_node("start")
onready var you_win_s : AudioStreamPlayer = get_node("you_win")
onready var lose_s : AudioStreamPlayer = get_node("lose")
onready var hit_s : AudioStreamPlayer = get_node("hit")

const SPEED_X = 50
const SPEED_Y = -400

var game_started : bool = false


func _input(event):
	if event.is_action_pressed("iniciar") and not game_started:
		linear_velocity = Vector2(SPEED_X, SPEED_Y)
		game_started = true
		start_s.play()
		



func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	for body in get_colliding_bodies():
		if body.is_in_group("gr_blocks"):
			body.queue_free()
			break_s.play()
			if body.get_parent().get_child_count() == 1:
				print("HAS GANADO!!")
				queue_free()
				you_win_s.play()
		elif body.get_name() == "border_bottom":
			print("PIERDES")			
			lose_s.play()			
			queue_free()							
			get_tree().change_scene("res://title/title.tscn")			
		else:
			hit_s.play()
			
		

