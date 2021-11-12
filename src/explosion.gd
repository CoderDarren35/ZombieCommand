extends Area2D


func _physics_process(delta):
	for collider in get_overlapping_bodies():
		collider.queue_free()

func _ready():
	$AnimatedSprite.play("default")
	

func _on_AnimatedSprite_animation_finished():
	queue_free()
