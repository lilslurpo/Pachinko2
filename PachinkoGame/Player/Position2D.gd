extends Position2D

const SCENE = preload("res://Ball/PachinkoBall.tscn")
onready var pachinkoball = $PachinkoBall



#Timer
var timer = null
export var shoot_delay = .10
var can_shoot = true
var power = -500
export var amount_of_balls = 10
var can_delete = false



func _ready():
	
	#Shot Timer
	timer = Timer.new()
	timer.set_wait_time(shoot_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	




func on_timeout_complete():
		can_shoot = true
	


#Spawn Ball
func _physics_process(delta):

	
	if power <= -700:
		power = -700
	elif power >= -425:
		power = -450
	
	if Input.is_action_just_pressed("power_up"):
		power -= 25
		print(power)
	
	if Input.is_action_just_pressed("power_down"):
		power += 25
		print(power)
	
	
	if Input.is_action_pressed("spawn_ball") && can_shoot && amount_of_balls >= 1:
		var ball = SCENE.instance()
		ball.launch = power
		
		add_child(ball)
		amount_of_balls -= 1
		can_shoot = false
		
		
		timer.start()
		print(amount_of_balls)





func _on_BallGiver_body_entered(body: Node) -> void:
	randomize()
	var extra_ball_chance = randf()
	print(extra_ball_chance)
	
	if extra_ball_chance <= .3:
		amount_of_balls += 10
		print(amount_of_balls)




