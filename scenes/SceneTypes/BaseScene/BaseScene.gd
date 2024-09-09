class_name BaseScene
extends Control

@onready var text: SceneText
@onready var choices: SceneChoices
@onready var picture: TextureRect

var data: SceneStoryNode

func _ready():
	pass

func setup(sd: SceneStoryNode, translations: Dictionary):
	data = sd
	picture.texture = load(sd.picture) as Texture2D
	text.choices = sd.choices
	
