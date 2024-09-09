extends Node

const story_path = 'res://story/JSON/'

func load_story() -> Dictionary:
	var story  = {}
	var files = DirAccess.get_files_at(story_path)
	for file in files:
		if(file.get_extension().to_lower() == "json"):
			var scene = _load_json(story_path+file)
			story[scene.key] = scene
	return story
	

func _load_json(path: String) -> SceneData:
	var file = FileAccess.open(path, FileAccess.READ)
	var scene_data_dict = JSON.parse_string(file.get_as_text()) as Dictionary
	print(scene_data_dict)
	var scene_data = SceneData.from_dict(scene_data_dict)
	return scene_data

func _load_packed(path: String) -> SceneData:
	return null
