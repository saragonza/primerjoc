extends KinematicBody2D

var velocitat := 200
var moviment := Vector2.ZERO
var gravetat := Vector2.DOWN * 1000
var salt :=Vector2.UP * 400

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(0,570)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	moviment += gravetat*delta
	moviment.x = velocitat
	if Input.is_action_just_pressed("ves_amunt") and is_on_floor():
		moviment += salt
		rotation_degrees += 90
	
	moviment = move_and_slide(moviment, Vector2.UP)


func _on_triangle_body_entered(body):
	position = Vector2(-4,570)


func _on_final_body_entered(body):
	moviment = Vector2.ZERO
	
