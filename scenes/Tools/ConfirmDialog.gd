extends Control

var callback: Callable = func (): return
signal decision(decision: bool)

func set_label(text: String):
	$PanelContainer/MarginContainer/VBoxContainer/Label.text = text

func _on_cancel_button_pressed():
	decision.emit(false)

func _on_ok_button_pressed():
	callback.call()
	decision.emit(true)

