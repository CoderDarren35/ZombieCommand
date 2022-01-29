tool
extends Node2D

const Grass := preload("res://assets/grass (1).png")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite = Sprite

	var position := Vector2.ZERO
	for y in 2:
		for x in 3:
			sprite = Sprite.new()
			sprite.texture = Grass
			sprite.position = position
			position.x += Grass.get_size().x
			add_child(sprite)
		position.x = 0.0
		position.y += Grass.get_size().y
#func _process(delta):
#	pass
