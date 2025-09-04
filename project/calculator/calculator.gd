class_name Calculator
extends Node2D

#var last_button_pressed : int = -1

var num1 : String = ""
var num2 : String = ""
var calcChoice : ButtonsGrid.calc_button = ButtonsGrid.calc_button.NONE
var isSecondNum := false

@onready var display_text := %DisplayText as DisplayText

#converts the inputed string from the calculaotr into a normal decial to do calulcations on
func quinary_String_to_Base_10_Int(input:String) -> int:
	#check for empty string
	if input == "":
		return -1
	#check for characters in the string that are not within the quinary bounds (0-4)
	for character in input:
		if character < "0" or character > "4":
			return -2
	var output := 0
	#for each character in the inputted length
	for i in range(input.length()):
		#covert the character into an integer, X
		var x := int(input[i])
		#convert to base 10 using this formula
		output = output *5 +x
	return output
	
#converts a decimal back into a quinary string in order to be displayed eventually
func base_10_Int_to_Quinary_String(input:int) -> String:
	#dont allow negatives
	if input <0:
		return ""
	#base case
	if input ==0:
		return "0"
	var output := "" 
	#convert each digit of the input
	while input > 0:
		# % input by 5 converts the digit into base 5, concat to the output string
		output = str(input %5) +output
		# this removes the digit previously calculated thru int division, like dividing something by 10
		# in base 10 does (150/10 = 15, the 0 is effectively removed)
		@warning_ignore("integer_division")
		input = input/5
	return output
	
#add two quinary strings together, return a quinary string
func add_Quinary_Strings(input1:String, input2:String) -> String:
	var decimal1 := quinary_String_to_Base_10_Int(input1)
	var decimal2 := quinary_String_to_Base_10_Int(input2)
	
	if decimal1 <0 or decimal2 <0:
		return "error"
	return base_10_Int_to_Quinary_String(decimal1 + decimal2)

# subtract one quinary string from another, return a single quinary string
func subtract_Quinary_Strings(input1:String,input2:String) -> String:
	var decimal1 := quinary_String_to_Base_10_Int(input1)
	var decimal2 := quinary_String_to_Base_10_Int(input2)
	
	if decimal1 < 0 or decimal2 < 0:
		return "error"
	return base_10_Int_to_Quinary_String(decimal1 - decimal2)
	
# multiply one quinary string by another, return a quinary string
func multiply_Quinary_Strings(input1:String,input2:String) -> String:
	var decimal1 := quinary_String_to_Base_10_Int(input1)
	var decimal2 := quinary_String_to_Base_10_Int(input2)
	
	if decimal1 < 0 or decimal2 < 0:
		return "error"
	return base_10_Int_to_Quinary_String(decimal1 * decimal2)
	
#divide one quinary string by another, return a quinary string
func divide_Quinary_Strings(input1:String,input2:String) -> String:
	var decimal1 := quinary_String_to_Base_10_Int(input1)
	var decimal2 := quinary_String_to_Base_10_Int(input2)
	if decimal2 == 0:
		return "error: undefined"
	elif decimal1 < 0 or decimal2 < 0:
		return "error"
	else:
		@warning_ignore("integer_division")
		return base_10_Int_to_Quinary_String(decimal1 / decimal2)
	
# sqrt a single quinary string, return a quinary string
func squareRT_Quinary_String(input:String) -> String:
	var decimal := quinary_String_to_Base_10_Int(input)
	
	if decimal == 0:
		return "error: undefined"
	elif decimal < 0:
		return "error"
	else:
		@warning_ignore("narrowing_conversion")
		return base_10_Int_to_Quinary_String(decimal ** 0.5)
	
#square one quinary string
func square_Quinary_String(input:String) -> String:
	var decimal := quinary_String_to_Base_10_Int(input)
	if decimal <0:
		return "error"
	return base_10_Int_to_Quinary_String(decimal*decimal)


#rework these into the divide_Quinary_Strings method above
func divide_calc(num_1 : int, num_2 : int) -> float:
	if num_2 == 0:
		return -100
	elif (num_1 < 0 or num_2 < 0 or num_1 > 4 or num_2 > 4):
		return -100
	else:
		@warning_ignore("integer_division")
		return num_1 / num_2

func divide_out(input : float) -> String:
	if input == -100:
		return "Undefined"
	else:
		return str(input)
		
		
func reset_on_calc():
	num2 = ""
	calcChoice = ButtonsGrid.calc_button.NONE
	isSecondNum = false
	
func full_reset():
	num1 = ""
	num2 = ""
	calcChoice = ButtonsGrid.calc_button.NONE
	isSecondNum = false

func _update_display(new_display_text : String) -> void:
	display_text.update_display(new_display_text)
	
func _calc_choice_string() -> String:
	match calcChoice:
		ButtonsGrid.calc_button.ADD:
			return "+"
			
		ButtonsGrid.calc_button.SUBTRACT:
			return "-"
			
		ButtonsGrid.calc_button.MULTIPLY:
			return "*"
			
		ButtonsGrid.calc_button.DIVIDE:
			return "/"
			
	return ""

func _on_button_pressed(button_pressed : ButtonsGrid.calc_button) -> void:
	var button_pressed_name = ButtonsGrid.calc_button.keys()[button_pressed]
	print(button_pressed_name)
	
	# 0 - 4 key was pressed (a number)
	if button_pressed <= 4:
		if isSecondNum:
			num2 = str(button_pressed)
		else:
			num1 = str(button_pressed)
			
	# 5 - 8 key was pressed (+, -, *, /)
	elif button_pressed <= 8:
		if calcChoice == ButtonsGrid.calc_button.NONE and num1 != "":
			calcChoice = button_pressed
			isSecondNum = true
		
	elif button_pressed == ButtonsGrid.calc_button.SQUARE:
		if num1 != "" or num2 != "":
			if not isSecondNum:
				num1 = square_Quinary_String(num1)
			else:
				num2 = square_Quinary_String(num2)
	
	elif button_pressed == ButtonsGrid.calc_button.ROOT:
		if num1 != "" or num2 != "":
			if not isSecondNum:
				num1 = squareRT_Quinary_String(num1)
			else:
				num2 = squareRT_Quinary_String(num2)
		
	elif button_pressed == ButtonsGrid.calc_button.EQUAL:
		if num1 != "" and num2 != "" and calcChoice != ButtonsGrid.calc_button.NONE:
			if calcChoice == ButtonsGrid.calc_button.ADD:
				num1 = add_Quinary_Strings(num1,num2)
				reset_on_calc()
				
			elif calcChoice == ButtonsGrid.calc_button.SUBTRACT:
				num1 = subtract_Quinary_Strings(num1,num2)
				reset_on_calc()
				
			elif calcChoice == ButtonsGrid.calc_button.MULTIPLY:
				num1 = multiply_Quinary_Strings(num1,num2)
				reset_on_calc()
				
			elif calcChoice == ButtonsGrid.calc_button.DIVIDE:
				num1 = divide_Quinary_Strings(num1,num2)
				reset_on_calc()
	
	elif button_pressed == ButtonsGrid.calc_button.CLEAR:
		full_reset()
			
	_update_display(num1 + _calc_choice_string() + num2)

func _on_button_dc_button_down() -> void:
	if num2 == "" and calcChoice == ButtonsGrid.calc_button.NONE:
		var num = num1
		var decimal = quinary_String_to_Base_10_Int(num)
		print(decimal)

		var temp = str(decimal)
		_update_display(temp)
	
func _on_button_dc_button_up() -> void:
	_update_display(num1 + _calc_choice_string() + num2)
