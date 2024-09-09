extends Node

signal text_submited(text: String)

func get_save() -> InputLineSave:
	var node = get_node_or_null('/GameRoot/InputBar')
	if !node:
		return null
	var save = InputLineSave.new()
	save.history = node.get_history()
	return save

func set_save(save: InputLineSave):
	var node = get_node_or_null('/GameRoot/InputBar')
	if !node: return
	node.set_history(save.history)
	
func submit(text: String):
	#get_tree().call_group('input_text_event', 'on_input_text', text)
	text_submited.emit(text)
