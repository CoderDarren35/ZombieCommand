extends ItemList

enum weapon{
	UNARMED = -1,
	RIFLE,
	ROCKET
}
func fire():
	var items := get_selected_items()
	if not len(items):
		return
	elif len(items) > 1:
		breakpoint
	var item := items[0]
	match item:
		weapon.RIFLE:
			pass
		weapon.ROCKET:
			pass

func _ready():
	add_item("rifle")
	add_item("rocket")

func _input(event):
	if event.is_action_pressed("fire"):
		fire()
		

