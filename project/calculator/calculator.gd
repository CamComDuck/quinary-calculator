class_name Calculator
extends Node2D

var last_button_pressed : int = -1

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
	
#square one quinary string
func square_Quinary_String(input:String) -> String:
	var decimal := quinary_String_to_Base_10_Int(input)
	if decimal <0:
		return "error"
	return base_10_Int_to_Quinary_String(decimal*decimal)

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
