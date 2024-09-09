extends Control

@onready var game_root = preload("res://scenes/GameRoot.tscn") as PackedScene

func _ready():
	var saves: Array = SaveLoadManager.get_saves()
	if (saves.size() < 1):
		$MarginContainer/VBoxContainer/ContinueButton.disabled = true

func _on_quit_button_pressed():
	$ConfirmDialog.visible = true
	#$ConfirmDialog.callback = get_tree().quit
	var response = await $ConfirmDialog.decision
	if response: get_tree().quit()
	$ConfirmDialog.visible = false

func _on_settings_button_pressed():
	$MarginContainer.visible = false
	$SettingsMenu.visible = true
	
func _on_settings_menu_exit_menu():
	$MarginContainer.visible = true
	$SettingsMenu.visible = false

func _on_load_game_button_pressed():
	$MarginContainer.visible = false
	$LoadGameMenu.visible = true

func _on_load_game_menu_exit_menu():
	$MarginContainer.visible = true
	$LoadGameMenu.visible = false

func _on_new_game_button_pressed():
	SceneManager.new_game()

func _on_continue_button_pressed():
	var games: Array = SaveLoadManager.get_saves()
	if games.size() > 0:
		SaveLoadManager.load_game(games[0])

