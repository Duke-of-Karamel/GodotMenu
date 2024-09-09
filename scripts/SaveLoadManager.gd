extends Node

const SAVE_PATH = "user://textovka_saves/"

func save_game(save_name):
	var metadata_save: MetadataSave = MetadataSave.new()
	metadata_save.name = save_name
	metadata_save.timestamp_unix = Time.get_unix_time_from_system()
	
	var safe_name = save_name.uri_encode() + str(metadata_save.timestamp_unix)
	metadata_save.save_path = safe_name
	
	var game_save: GameSave = GameSave.new()
	game_save.scene_data = SceneManager.get_save()
	game_save.inputline_data = InputLineManager.get_save()
	
	
	
	FileManager.save_safe(game_save, SAVE_PATH+"save_"+safe_name+"/save.tres")
	FileManager.save_safe(metadata_save, SAVE_PATH+"save_"+safe_name+"/meta.tres")

func load_game(meta: MetadataSave):
	var safe_name = meta.save_path
	var game_save: GameSave = FileManager.load_safe(SAVE_PATH+"save_"+safe_name+"/save.tres") as GameSave
	if game_save.scene_data: SceneManager.set_save(game_save.scene_data)
	if game_save.inputline_data: InputLineManager.set_save(game_save.inputline_data)

func get_saves() -> Array[MetadataSave]:
	var saves: Array[MetadataSave] = []
	
	var diraccess = DirAccess.open(SAVE_PATH)
	if !diraccess:
		return []
		
	var save_directories = diraccess.get_directories()
	for directory in save_directories:
		var game_save: MetadataSave = FileManager.load_safe(diraccess.get_current_dir()+'/'+directory+"/meta.tres") as MetadataSave
		if game_save:
			saves.append(game_save)
	saves.sort_custom(_compare_timestamp)
	return saves
	
func _compare_timestamp(a: MetadataSave, b: MetadataSave):
	if (a.timestamp_unix > b.timestamp_unix):
		return true
	return false
