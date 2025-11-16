extends Node2D

const SPEED = 60

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


var direction = 1 #d > 0 = direccion original; d < 0 = direccion opuesta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void: #this runs every frame (remember, there's multiple frames PER SECOND)
	
	#Check if collision against wall to determine direction
	if ray_cast_right.is_colliding():
		direction =-1
		animated_sprite.flip_h = true #upon collision, flip the sprites
		
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x += direction  * SPEED * delta #delta makes the speed independent from the framerate
