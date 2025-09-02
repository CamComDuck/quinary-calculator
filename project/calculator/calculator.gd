class_name Calculator
extends Node2D

var last_button_pressed : int = -1

@onready var display_text := %DisplayText as DisplayText

func divide_calc(num_1 : int, num_2 : int) -> float:
	if num_2 == 0:
		return -100
	elif (num_1 < 0 or num_2 < 0 or num_1 > 4 or num_2 > 4):
		return -100
	else:
		return num_1 / num_2

func divide_out(input : float) -> String:
	if input == -100:
		return "Undefined"
	else:
		return str(input)

func _update_display(new_display_text : String) -> void:
	display_text.update_display(new_display_text)

func _on_button_pressed(button_pressed : ButtonsGrid.calc_button) -> void:
	print(ButtonsGrid.calc_button.keys()[button_pressed])
