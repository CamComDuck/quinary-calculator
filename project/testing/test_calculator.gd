class_name TestCalculator
extends GutTest

#test the base 10 to quinary string method
func test_d2q_negative():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.base_10_Int_to_Quinary_String(-1)
	assert_eq(result, "")
func test_d2q_zero():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.base_10_Int_to_Quinary_String(0)
	assert_eq(result, "0")
func test_d2q_normal():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.base_10_Int_to_Quinary_String(32)
	assert_eq(result, "112")
	
	
#test the quinary string back to base 10 method
func test_q2d_empty_string():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: int = calculator_script.quinary_String_to_Base_10_Int("")
	assert_eq(result, -1)
func test_q2d_nonnumeric():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: int = calculator_script.quinary_String_to_Base_10_Int("abc")
	assert_eq(result, -2)
func test_q2d_out_of_range():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: int = calculator_script.quinary_String_to_Base_10_Int("156")
	assert_eq(result, -2)
func test_q2d_normal():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: int = calculator_script.quinary_String_to_Base_10_Int("112")
	assert_eq(result, 32)

#test the additon methods
func test_add_normal():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.add_Quinary_Strings("112","32")
	assert_eq(result, "144")
func test_add_negative():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.add_Quinary_Strings("-2","32")
	assert_eq(result, "error")
func test_add_non_numeric():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.add_Quinary_Strings("2","32abc")
	assert_eq(result, "error")
func test_add_out_of_range():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.add_Quinary_Strings("87","326")
	assert_eq(result, "error")

#test the squaring
func test_square_normal():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.square_Quinary_String("43")
	assert_eq(result, "4104")
func test_square_negative():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.square_Quinary_String("-2")
	assert_eq(result, "error")
func test_square_non_numeric():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.square_Quinary_String("43abc")
	assert_eq(result, "error")
func test_square_out_of_range():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.square_Quinary_String("45")
	assert_eq(result, "error")

#Testing divide methods
func test_divide_normal():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.divide_Quinary_Strings("40", "4")
	assert_eq(result, "10")
func test_divide_by_zero():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.divide_Quinary_Strings("2", "0")
	assert_eq(result, "error: undefined")
func test_divide_negative():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.divide_Quinary_Strings("-2", "2")
	assert_eq(result, "error")
func test_divide_non_numeric():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.divide_Quinary_Strings("a", "2")
	assert_eq(result, "error")
func test_divide_out_of_range():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.divide_Quinary_Strings("8", "2")
	assert_eq(result, "error")

func test_subtract_normal():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.subtract_Quinary_Strings("10", "4")
	assert_eq(result, "1")
func test_subtract_with_negative():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.subtract_Quinary_Strings("10", "-1")
	assert_eq(result, "error")
func test_subtract_non_numeric():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.subtract_Quinary_Strings("A", "5")
	assert_eq(result, "error")
func test_subtract_out_of_range():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var result: String = calculator_script.subtract_Quinary_Strings("85", "4")
	assert_eq(result, "error")
