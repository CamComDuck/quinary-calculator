# quinary-calculator
&nbsp;A quinary calculator is one that, like how binary is base 2, is base 5. This means that when counting, 0, 1, 2, 3, and 4 are themselves, but 5 would be 10, 6 would be 11, 7 would be 12, and so on. When used in a calculator setting, the calculator needs to recognize that 11-2 is not 9, but in fact 4. 

[!NOTE] To complete this request, we used Godot Engine 4, which is a game engine that utilizes GDScript, a programming language nearly identical to Python with built-in UI functionalities.

## How to Use:
&nbsp;This calculator has the same general interface as a normal base 10 calculator, but with only 5 digits since it is in base 5. Anything typed into the calculator will be read as if it in base 5, so if you type 11, it is being treated as 6. Once you open the calculator is should look like the following:

<img width="695" height="694" alt="image" src="https://github.com/user-attachments/assets/570269e8-77ca-4274-90ce-90c77176886a" />

### How to: <ins>Add</ins>
&nbsp;To add two quinary numbers together, enter your first addned using the given digits in quinary form, click the plus sign (+), and enter your second addend using the given digits in quinary form before clicking the equals sign (=). The symbol used for this function is highlighted below:

<img width="389" height="395" alt="image" src="https://github.com/user-attachments/assets/88a4c62f-3282-45fc-a954-7f7097fdafef" />

This will give you the sum of the two quinary numbers you wish to add.

### How to: <ins>Subtract</ins>
&nbsp;To subtract one quinary number from another, enter your subtrahend using the given digits in quinary form, click the minus sign (-), and enter the minuend using the given digits in quinary form before clicking the equals sign (=). The symbol used for this function is highlighted below:

<img width="389" height="395" alt="image" src="https://github.com/user-attachments/assets/eb98c609-c293-403e-b9da-675779d191c1" />

This will give you the difference of the two quinary numbers you wish to subtract.

### How to: <ins>Multiply</ins>
&nbsp;To multiply two quinary numbers together, enter your first factor using the given digits in quinary form, click the "X" or multiplication sign, and enter the second factor using the given digits in quinary form before clicking the equals sign (=). The symbol used for this function is highlighted below:

<img width="389" height="395" alt="image" src="https://github.com/user-attachments/assets/cb7e046d-c55d-44d6-b9ce-65bae27c4183" />

This will give you the product of the two quinary numbers you wish to multiply.

### How to: <ins>Divide</ins>
&nbsp;To divide one quinary number by another, enter your dividend using the given digits in quinary form, click the forward slash or division sign (/), and enter the divisor using the given digits in quinary form before clicking the equals sign (=). The symbol used for this function is highlighted below:

<img width="389" height="395" alt="image" src="https://github.com/user-attachments/assets/eb41ea84-8d60-40ab-a8bc-09d3765f408f" />

This will give you the quotient of the two quinary numbers you wish to divide.

### How to: <ins>Square</ins>
&nbsp;To square a single quinary number, enter your singular factor using the given digits in quinary form and click the square symbol. The symbol used for this function is highlighted below:

<img width="389" height="395" alt="image" src="https://github.com/user-attachments/assets/901cc419-a324-4106-9490-f8db35589f1e" />

This will give you the product of the single quinary number with itself in order to give you its square.

### How to: <ins>Square Root</ins>
&nbsp;To get the square root of a single quinary number, enter your base using the given digits in quinary form and click the square root symbol. The symbol used for this function is highlighted below:

<img width="389" height="395" alt="image" src="https://github.com/user-attachments/assets/1a043455-d36d-455e-9920-686c7a27199c" />

This will give you the square root of the single quinary number.

### How to: <ins>Clear</ins>
&nbsp;To clear the calculator of any past calculations, click the "CE" or clear button, as shown below:

<img width="389" height="395" alt="image" src="https://github.com/user-attachments/assets/6db0dd8a-5891-4f74-a94b-39985642b397" />

### How to: <ins>Convert to Base 10</ins>
&nbsp;To convert the quinary form to a decimal or base 10 form, click the "DC" or decimal button, as shown below:

<img width="389" height="395" alt="image" src="https://github.com/user-attachments/assets/a14526ee-bb7e-400a-a491-ed99500df370" />

## Notes from Authors:
- The "DC" or decimal button only converts to base 10 form when there is not an active equation in the calculator.
- Just like binary, this calculator does not support negative numbers and does not work with calculations such as 1 - 2 that create negative numbers.

## Task Distributions:
 - Gabe Manning = Added division functionality and appropriate tests
 - Elaine Ulsh = Added subtraction and sqrt functionality and appropriate tests as well as shared custody of the toggle (DC) button
 - Braxton Davis = Added multiplication funcationality and appropriate tests as well as shared custody of the toggle (DC) button
 - Ethan Couch = Added addition and squaring functionality and appropriate tests as well as clear button functionality and connection between buttons
 - Camden Hovell = Created all UI and GUI functions, Github, Slack, cleaned code to match Godot style guidelines better

## Meetings
 - 8/29 from 2-2:45pm, Gabe Manning and Camden Hovell, Letterman lobby, walked through how to use Godot since Gabe had never used it before and its test implementation.
 - 09/03 from 4:10-4:40pm, Elaine Ulsh, Braxton Davis, and Ethan Coutch, over Discord, discussed what functionality was left in the project, added a clear button, and discussed how to handle the toggle button.
