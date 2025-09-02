class_name TestCalculator
extends GutTest


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
