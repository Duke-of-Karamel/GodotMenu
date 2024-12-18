extends Node

static var scenes: Dictionary = {} # <PackedScene>
static var unloaded_scenes: Dictionary = {} #<SceneSaveData>
static var current_scene_key: String = ''
static var current_scene: Node = null

func _ready():
	scenes = {}
	#TODO: load scenes

func _save_scene(key):
	var scene_data: SceneSaveData = SceneSaveData.new()
	var save_data: Array[SaveObjectData] = []
	current_scene.call_group("game_event", "on_save_game", save_data)
	scene_data.save_data = save_data
	unloaded_scenes[key] = scene_data
	
func _load_scene(key):
	current_scene_key = key
	if current_scene:
		$SceneHolder.remove_child(current_scene)
		current_scene.queue_free()
	current_scene = scenes[key]
	current_scene.instance()
	$SceneHolder.add_child(current_scene)
	
func get_save():
	_save_scene(current_scene_key)
	
	var save: ScenesSave = ScenesSave.new()
	save.current_scene = current_scene_key
	save.scenes_data = unloaded_scenes
	return save

func set_save(save: ScenesSave):
	if save.scenes_data:
		unloaded_scenes = save.scenes_data
	if save.current_scene && save.current_scene != '':
		_load_scene(save.current_scene)
	
func change_scene(key):
	_save_scene(current_scene_key)
	_load_scene(key)
	
func new_game():
	_load_scene('firstscene') #TODO: make something better
