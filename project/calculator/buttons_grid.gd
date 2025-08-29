class_name ButtonsGrid
extends GridContainer

signal on_button_pressed(button_pressed : calc_button)

enum calc_button {
	ZERO,
	ONE,
	TWO,
	THREE,
	FOUR,
	ADD,
	SUBTRACT,
	MULTIPLY,
	DIVIDE,
	EQUAL,
	SQUARE,
	ROOT
}

func _on_button_0_pressed() -> void:
	on_button_pressed.emit(calc_button.ZERO)


func _on_button_1_pressed() -> void:
	on_button_pressed.emit(calc_button.ONE)


func _on_button_2_pressed() -> void:
	on_button_pressed.emit(calc_button.TWO)


func _on_button_3_pressed() -> void:
	on_button_pressed.emit(calc_button.THREE)


func _on_button_4_pressed() -> void:
	on_button_pressed.emit(calc_button.FOUR)


func _on_button_add_pressed() -> void:
	on_button_pressed.emit(calc_button.ADD)
	

func _on_button_minus_pressed() -> void:
	on_button_pressed.emit(calc_button.SUBTRACT)


func _on_button_multiply_pressed() -> void:
	on_button_pressed.emit(calc_button.MULTIPLY)


func _on_button_divide_pressed() -> void:
	on_button_pressed.emit(calc_button.DIVIDE)


func _on_button_equal_pressed() -> void:
	on_button_pressed.emit(calc_button.EQUAL)


func _on_button_square_pressed() -> void:
	on_button_pressed.emit(calc_button.SQUARE)


func _on_button_root_pressed() -> void:
	on_button_pressed.emit(calc_button.ROOT)
