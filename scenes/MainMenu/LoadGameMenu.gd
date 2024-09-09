extends Control

signal exit_menu()

static var save_button_scene = load("res://scenes/MainMenu/SavedGamePanel.tscn")

var saves: Array[MetadataSave] = []
var selected_save: MetadataSave = null

func _ready():
	saves = SaveLoadManager.get_saves()
	for save in saves:
		var savePanel = save_button_scene.instantiate()
		$MarginContainer/VBoxContainer/ScrollContainer/SavesContainer.add_child(savePanel)
		savePanel.set_save(save)
		savePanel.callback = func(meta): selected_save = meta

func _on_button_pressed():
	exit_menu.emit()

func _on_load_game_button_pressed():
	if (!selected_save): return
	SaveLoadManager.load_game(selected_save)
