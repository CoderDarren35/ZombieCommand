tool
extends ItemList
const Explosion := preload("res://src/explosion.tscn")
onready var viewport_rect := get_viewport_rect()
enum weapon{
	UNARMED = -1,
	RIFLE,
	GRENADE
}
func fire(at: Vector2):
	var parent = get_parent()
	var items := get_selected_items()
	if not len(items):
		return
	elif len(items) > 1:
		breakpoint
	var item := items[0]
	match item:
		weapon.RIFLE:
			$RayCast2D.cast_to = at - $RayCast2D.position
			$RayCast2D.force_raycast_update()
			if $RayCast2D.is_colliding():
				var collider = $RayCast2D.get_collider()
				collider.queue_free()
		weapon.GRENADE:
			var explosion := Explosion.instance()
			explosion.position = at
			parent.add_child(explosion)

func _ready():
	clear()
	add_item("rifle")
	add_item("grenade")
	$RayCast2D.position.y = viewport_rect.size.y
	$RayCast2D.position.x = (viewport_rect.size.x - rect_size.x) * 0.5 + rect_size.x

func _input(event):
	if event is InputEventMouseButton and event.is_action_pressed("fire"):
		fire(event.position)
		

