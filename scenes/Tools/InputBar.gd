extends Control

@export var lineEdit: LineEdit

var _history: Array[String] = []
var _history_index: int = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().process_frame
	self.lineEdit.grab_focus()

func _on_line_edit_text_submitted(new_text):
	self.lineEdit.clear()
	self._history.push_front(new_text)
	self._history_index = -1
	InputLineManager.submit(new_text)
	


func _on_line_edit_gui_input(_event):
	if (Input.is_key_pressed(KEY_UP)):
		if _history.size() <= _history_index + 1:
			return;
		_history_index += 1
		lineEdit.text = _history[_history_index]
		await get_tree().process_frame
		lineEdit.caret_column = _history[_history_index].length()
	if (Input.is_key_pressed(KEY_DOWN)):
		if _history_index <= 0:
			_history_index = -1
			lineEdit.text = ''
			return;
		_history_index -= 1
		lineEdit.text = _history[_history_index]
		await get_tree().process_frame
		lineEdit.caret_column = _history[_history_index].length()
		
func get_history():
	return _history
	
func set_history(save: Array[String]):
	_history_index = -1
	if save:
		_history = save
	else:
		_history = []
