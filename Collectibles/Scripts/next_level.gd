extends Area2D


func _on_body_entered(body: Node2D) -> void:
	var current_scene_file = get_tree().current_scene.scene_file_path
	var next_level_number = current_scene_file.to_int() + 1
	
	var next_level_path = "res://Levels/Scenes/Level_" + str(next_level_number) + ".tscn"
	if current_scene_file=="res://Levels/Scenes/Level_2.tscn":
		next_level_path = "res://Levels/Scenes/Level_1.tscn"
	
	get_tree().change_scene_to_file(next_level_path)
		
