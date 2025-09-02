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

func test_divide_calc_pass1():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var division_result : int = calculator_script.divide_calc(4, 2)
	assert_eq(division_result, 2, "4 / 2 = 2")	

func test_divide_calc_pass2():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var division_result : int = calculator_script.divide_calc(4, 0)
	assert_eq(division_result, -100, "4 / 0 = undefined, which is shown as -100 in calculation")

func test_divide_calc_pass3():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var division_result : int = calculator_script.divide_calc(5, -1)
	assert_eq(division_result, -100, "5 / -1 = undefined, which is shown as -100. (Numbers above 4 or 
		below 0 not allowed), shown as -100 in calculation)")

func test_divide_out_pass1():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var output : String = calculator_script.divide_out(-100)
	assert_eq(output, "Undefined", "An undefined output was given from calculation")

func test_divide_out_pass2():
	var calculator_script = load("res://calculator/calculator.gd").new()
	var output : String = calculator_script.divide_out(2)
	assert_eq(output, "2.0", "The output of the calculation was 2.0")
