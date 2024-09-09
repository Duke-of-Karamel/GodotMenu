extends PanelContainer

var metadata: MetadataSave
var callback: Callable = func (): return

func set_save(save: MetadataSave):
	metadata = save
	$MarginContainer/HBoxContainer/Name.text = save.name
	$MarginContainer/HBoxContainer/PlayTime.text = _parse_seconds(save.timeplayed_seconds)
	$MarginContainer/HBoxContainer/Date.text = _parse_timestamp(save.timestamp_unix)
	
func _parse_timestamp(timestamp: float) -> String:
	return Time.get_datetime_string_from_unix_time(timestamp)
	
func _parse_seconds(all_seconds: int) -> String:
	var seconds = all_seconds % 60
	var minutes = all_seconds / 60 % 60
	var hours = all_seconds / 60 / 60
	return "%02d:%02d%02d" % [hours, minutes, seconds]


func _on_select_save_button_pressed():
	callback.call(metadata)
