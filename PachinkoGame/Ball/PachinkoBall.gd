extends RigidBody2D

var launch = 0 

func _ready():
	apply_impulse(Vector2.ZERO, Vector2(0 , launch))
	
