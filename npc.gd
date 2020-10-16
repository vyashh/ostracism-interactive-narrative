extends KinematicBody2D
 
const MOVE_SPEED = 400
 
onready var raycast = $RayCast2D
 
var player = null

var following = true
 
func _ready():
	add_to_group("npc_group")
 
func _physics_process(delta):
	if player == null:
		return
	var vec_to_player = is_following()
	vec_to_player = vec_to_player.normalized()
	global_rotation = atan2(vec_to_player.y, vec_to_player.x)
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	if Input.is_action_just_pressed("shoot"):
		following = !following

		
	#npc.is_following_direction()

func set_player(p):
	player = p

func is_following():
	if following == true:
		return player.global_position - global_position # following
	else: 
		return player.global_position + global_position # not following

func is_following_direction():
	following = !following
	print(following)
