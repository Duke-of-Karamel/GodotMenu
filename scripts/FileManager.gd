extends Node

# TODO: make safe using custom parsers
func save_safe(obj, path: String):
	DirAccess.make_dir_recursive_absolute(path.get_base_dir())
	ResourceSaver.save(obj, path)
	
func load_safe(path):
	return ResourceLoader.load(path)
	
