extends KinematicBody2D


var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
	var viewport_rect := get_viewport_rect()
	var radius :float = $CollisionShape2D.shape.radius
	position.y = radius
	position.x = rng.randf_range(radius, viewport_rect.size.x - radius)
