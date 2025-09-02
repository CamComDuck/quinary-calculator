class_name Calculator
extends Node2D

var last_button_pressed : int = -1

var num1 = ""
var num2 = ""
var calcChoice = ""
var currentNum= 1

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
	while input >0:
		# % input by 5 converts the digit into base 5, concat to the output string
		output =str(input %5) +output
		# this removes the digit previously calculated thru int division, like dividing something by 10
		# in base 10 does (150/10 = 15, the 0 is effectively removed)
		input = input/5
	return output
	
#add two quinary strings together, return a quinary string
func add_Quinary_Strings(input1:String, input2:String) -> String:
	var decimal1 := quinary_String_to_Base_10_Int(input1)
	var decimal2 := quinary_String_to_Base_10_Int(input2)
	
	if decimal1 <0 or decimal2 <0:
		return "error"
	return base_10_Int_to_Quinary_String(decimal1 + decimal2)

#TODO
func subtract_Quinary_Strings(input1:String,input2:String) -> String:
	return""
	
#TODO
func multiply_Quinary_Strings(input1:String,input2:String) -> String:
	return""
	
#divide one quinary string by another, return a quinary string
func divide_Quinary_Strings(input1:String,input2:String) -> String:
	var decimal1 := quinary_String_to_Base_10_Int(input1)
	var decimal2 := quinary_String_to_Base_10_Int(input2)
	if decimal2 == 0:
		return "error: undefined"
	elif decimal1 < 0 or decimal2 < 0:
		return "error"
	else:
		return base_10_Int_to_Quinary_String(decimal1 / decimal2)
	
#TODO
func squareRT_Quinary_String(input:String) -> String:
	return""
	
	
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
		return num_1 / num_2

func divide_out(input : float) -> String:
	if input == -100:
		return "Undefined"
	else:
		return str(input)
		
		
func reset_on_calc():
	num2 = ""
	calcChoice = ""
	currentNum = 1
	
func full_reset():
	num1 = ""
	num2 = ""
	calcChoice = ""
	currentNum = 1
	

func _update_display(new_display_text : String) -> void:
	display_text.update_display(new_display_text)

func _on_button_pressed(button_pressed : ButtonsGrid.calc_button) -> void:
	print(ButtonsGrid.calc_button.keys()[button_pressed])
	
	#defintely a better way to do this, I just havent looked into it yet
	
	
	#------------------------numbers-------------------------------------
	if ButtonsGrid.calc_button.keys()[button_pressed] == "ZERO":
		if currentNum == 1:
			num1+="0"
		elif currentNum == 2:
			num2+="0"
			
	if ButtonsGrid.calc_button.keys()[button_pressed] == "ONE":
		if currentNum == 1:
			num1+="1"
		elif currentNum == 2:
			num2+="1"
			
	if ButtonsGrid.calc_button.keys()[button_pressed] == "TWO":
		if currentNum == 1:
			num1+="2"
		elif currentNum == 2:
			num2+="2"
	
	if ButtonsGrid.calc_button.keys()[button_pressed] == "THREE":
		if currentNum == 1:
			num1+="3"
		elif currentNum == 2:
			num2+="3"
			
	if ButtonsGrid.calc_button.keys()[button_pressed] == "FOUR":
		if currentNum == 1:
			num1+="4"
		elif currentNum == 2:
			num2+="4"
			
		#-------------------Methods---------------------------
			
	if ButtonsGrid.calc_button.keys()[button_pressed] == "ADD":
		if calcChoice == "" and num1 != "":
			calcChoice = "+"
			currentNum = 2
			
	if ButtonsGrid.calc_button.keys()[button_pressed] == "SUBTRACT":
		if calcChoice == "" and num1 != "":
			calcChoice = "-"
			currentNum = 2
			
	if ButtonsGrid.calc_button.keys()[button_pressed] == "MULTIPLY":
		if calcChoice == "" and num1 != "":
			calcChoice = "*"
			currentNum = 2
			
	if ButtonsGrid.calc_button.keys()[button_pressed] == "DIVIDE":
		if calcChoice == "" and num1 != "":
			calcChoice = "/"
			currentNum = 2
			
	if ButtonsGrid.calc_button.keys()[button_pressed] == "SQUARE":
		if  num1 != "" or num2 != "":
			if currentNum == 1:
				num1 = square_Quinary_String(num1)
			elif currentNum == 2:
				num2 = square_Quinary_String(num2)
				
	if ButtonsGrid.calc_button.keys()[button_pressed] == "ROOT":
		if  num1 != "" or num2 != "":
			if currentNum == 1:
				num1 = squareRT_Quinary_String(num1)
			elif currentNum == 2:
				num2 = squareRT_Quinary_String(num2)
	
	if ButtonsGrid.calc_button.keys()[button_pressed] == "EQUAL":
		if  num1 != "" and num2 != "" and calcChoice != "":
			if calcChoice == "+":
				num1 = add_Quinary_Strings(num1,num2)
				reset_on_calc()
			elif calcChoice == "-":
				num1 = subtract_Quinary_Strings(num1,num2)
				reset_on_calc()
			elif calcChoice == "*":
				num1 =multiply_Quinary_Strings(num1,num2)
				reset_on_calc()
				currentNum
			elif calcChoice == "/":
				num1 =divide_Quinary_Strings(num1,num2)
				reset_on_calc()
	
		
			
	_update_display(num1 + calcChoice + num2)
	
