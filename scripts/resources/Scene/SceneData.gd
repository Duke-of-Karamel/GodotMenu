class_name SceneData
extends Resource

@export var key: String;
@export var type: String; # ENUM
@export var image: String;
@export var story_start: int;
@export var story: Dictionary; # SceneStoryNode
@export var loacale: Dictionary # Translations

static func from_dict(dict: Dictionary) -> SceneData:
	var object = SceneData.new()
	for key in dict.keys():
		if key in object:
			object.set(key, dict[key])
	return object
