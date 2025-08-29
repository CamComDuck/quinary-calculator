class_name Calculator
extends Node2D

var last_button_pressed : int = -1

@onready var display_text := %DisplayText as DisplayText


func divide(num_1 : int, num_2 : int) -> float:
	return num_1 / num_2
	
	
func _update_display(new_display_text : String) -> void:
	display_text.update_display(new_display_text)


func _on_button_pressed(button_pressed : ButtonsGrid.calc_button) -> void:
	print(ButtonsGrid.calc_button.keys()[button_pressed])
