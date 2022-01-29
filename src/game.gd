extends Node2D

#const Game := preload("res://src/game.tscn")
var waves := [{"zombie0" : 5, "rifle" : 90, "grenade" : 10}, {"zombie0" : 10, "rifle" : 90, "grenade" : 10}]
var wave := 0

var started := false
onready var zombies := 0
onready var zombiesSpawned := 0
onready var zombiesKilled := 0

var Zombie0 = preload("res://src/zombie0.tscn")
export var starting_lives := 10
func get_total_zombies():
	var ret := 0
	for key in waves[wave]:
		if key[0] == "z":
			ret += waves[wave][key]		
	return ret
	
func _ready():
	zombies = get_total_zombies()
	$survivorCount.text = str(starting_lives)
	#$wave.text = "wave: " + str(wave+1)
	#$zombies.text = "zombies: " + str(zombies)
	#$weapons.disabled = true
	
func _on_spawner_timeout():
	var zombie0 = Zombie0.instance()
	zombie0.offset = $weapons.rect_size.x
	zombie0.connect("win", self, "_on_zombie_win")
	zombie0.connect("die", self, "_on_zombie_die")
	add_child(zombie0)
	$spawner.wait_time *= 0.99
	zombiesSpawned += 1
	if zombiesSpawned >= zombies:
		#$spawner.one_shot = true
		#$spawner.stop()
		#$spawner.queue_free()
		pass
		
func _on_weapons_rifle(at):
	$rifle.cast_to = at - $rifle.position
	$rifle.force_raycast_update()
	if $rifle.is_colliding():
		var collider = $rifle.get_collider()
		collider.die()
	$rifle/AudioStreamPlayer.play()

func _on_zombie_win():
	var lives = int ($survivorCount.text)
	lives -= 1
	zombiesKilled += 1
	$survivorCount.text = str(lives)
	if not lives:
		get_tree().change_scene("res://src/gameover.tscn")
		
func _on_zombie_die():
	zombiesKilled += 1
	if zombiesKilled >= zombies:
		var next = self.duplicate()#load("res://src/game.tscn").instance()
		wave = wave + 1
		#get_tree().change_scene_to(next)
		
