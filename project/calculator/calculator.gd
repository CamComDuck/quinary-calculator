class_name Calculator
extends Node2D

var last_button_pressed : int = -1


func divide(num_1 : int, num_2 : int) -> float:
	return num_1 / num_2


func _on_button_1_pressed() -> void:
	last_button_pressed = 1
	print("1")
