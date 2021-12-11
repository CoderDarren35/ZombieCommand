extends Area2D


func _physics_process(delta):
	for collider in get_overlapping_bodies():
		collider.die()

func _ready():
	$AnimatedSprite.play("default")


func _on_AudioStreamPlayer_finished():
	queue_free()
