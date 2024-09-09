extends Node

static var game_root_scene: PackedScene = load("res://scenes/GameRoot.tscn")
static var main_menu_scene: PackedScene = load("res://scenes/MainMenu/MainMenu.tscn")
var current_scene = null

func _ready():
	current_scene = get_tree().current_scene

func _game_root():
	if (!get_node_or_null('/GameRoot')):
		var scene = game_root_scene.instantiate()
		get_tree().root.remove_child(current_scene)
		get_tree().root.add_child(scene)
		current_scene.queue_free()
		current_scene = scene
		return scene
	return $/GameRoot

func _main_menu():
	if (!get_node_or_null('/MainMenu')):
		var scene = main_menu_scene.instantiate()
		get_tree().root.remove_child(current_scene)
		get_tree().root.add_child(scene)
		current_scene.queue_free()
		current_scene = scene
	return $/MainMenu


func get_save() -> ScenesSave:
	print(get_tree().root.get_children())
	
	if (get_node_or_null('/GameRoot')):
		return $/GameRoot.get_save()
	return null

func set_save(save: ScenesSave):
	_game_root().set_save(save)
	
func new_game():
	_game_root().new_game()
	
func main_menu():
	_main_menu()
