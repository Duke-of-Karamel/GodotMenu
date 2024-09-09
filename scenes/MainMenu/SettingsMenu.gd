extends Control

signal exit_menu()



func _on_retun_button_pressed():
	exit_menu.emit()


func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_fullscreen_check_box_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
