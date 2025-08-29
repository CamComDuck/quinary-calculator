class_name TestCalculator
extends GutTest


func test_divide_pass():
	var calculator_script = load("res://ui/calculator.gd").new()
	var division_result : int = calculator_script.divide(4, 2)
	assert_eq(division_result, 2, "4 / 2 = 2")
