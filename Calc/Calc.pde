// Calculator Created by KIAN, NIMA A on 11/3/14. | Copyright 2014.
// Instantiate each of the classification of buttons
// Track of of the Global Variables
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
Button[] spButtons = new Button[1];


String displayValue = "";
String valueToCompute = "";
String valueToCompute2 = "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
float result = 0;
char opValue;
boolean firstNum;
void setup() {
  size(260, 455);
  background(#1191F0);
  //frameRate(10);
  noFill();
  strokeWeight(3);
  stroke(200);
  //rect();

  //populate number buttons


  numButtons[0] = new Button(25, 387).asNumber(0, 100, 45);
  numButtons[1] = new Button(25, 332).asNumber(1, 45, 45);
  numButtons[2] = new Button(80, 332).asNumber(2, 45, 45);
  numButtons[3] = new Button(135, 332).asNumber(3, 45, 45);
  numButtons[4] = new Button(25, 275).asNumber(4, 45, 45);
  numButtons[5] = new Button(80, 275).asNumber(5, 45, 45);
  numButtons[6] = new Button(135, 275).asNumber(6, 45, 45);
  numButtons[7] = new Button(25, 220).asNumber(7, 45, 45);
  numButtons[8] = new Button(80, 220).asNumber(8, 45, 45);
  numButtons[9] = new Button(135, 220).asNumber(9, 45, 45);
  //Set the initial value of first num to true
  firstNum = true;

  //populate operators
  opButtons[0] = new Button(190, 332).asOperator("+", 45, 45);
  opButtons[1] = new Button(190, 275).asOperator("-", 45, 45);
  opButtons[2] = new Button(190, 220).asOperator("*", 45, 45);
  opButtons[3] = new Button(190, 165).asOperator("/", 45, 45);
  opButtons[4] = new Button(25, 165).asOperator("C", 45, 45);
  opButtons[5] = new Button(190, 387).asOperator("=", 45, 45);
  opButtons[6] = new Button(135, 165).asOperator("±", 45, 45);
  opButtons[7] = new Button(80, 165).asOperator("√", 45, 45);
  opButtons[8] = new Button(25, 110).asOperator(" ²", 45, 45);
  opButtons[9] = new Button(80, 110).asOperator(" ", 45, 45);
  opButtons[10] = new Button(135, 110).asOperator(" ", 45, 45);
  opButtons[11] = new Button(190, 110).asOperator("﻿", 45, 45);
  //populate special buttons
  spButtons[0]= new Button(135, 387).asSpecial(".", 45, 45);
}
void draw() {
  // Draw number buttons
  for ( int i=0; i<numButtons.length; i++) {
    Button inumButtons = numButtons[i];
    inumButtons.display();
  }
  for ( int i=0; i<opButtons.length; i++) {
    Button iOpButtons = opButtons[i];
    iOpButtons.display();
  }
  for ( int i=0; i<spButtons.length; i++) {
    Button ispButton = spButtons[i];
    ispButton.display();
  }

  updateDisplay();
  text("cos", 84, 138);
  text("tan", 139, 138);
  text("sin", 194, 138);
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.click();
    if (inumButton.overBox) {
      if (firstNum) {
        println(i + " " + inumButton.numButtonValue);
        valueToCompute += int(inumButton.numButtonValue);
        displayValue = valueToCompute;
      } else { 
        valueToCompute2 += int(inumButton.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }

  for ( int i=0; i<opButtons.length; i++) {
    Button iOpButton = opButtons[i];
    iOpButton.click(); 
    if (iOpButton.overBox) {
      if (iOpButton.opButtonValue == "+") {
        if ( result !=0) {
          opValue = '+';
          valueToCompute2= "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "-") {
        if ( result !=0) {
          opValue = '-';
          valueToCompute2= "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == "√") {
        if ( result !=0) {
          opValue = '√';
          valueToCompute2= "";
          firstNum = true;
          performCalculation();
        } else {
          opValue = '√';
          firstNum = true;
          performCalculation();
        }
      } else if (iOpButton.opButtonValue == "²") {
        if ( result !=0) {
          opValue = '²';
          valueToCompute2= "";
          firstNum = true;
          performCalculation();
        } else {
          opValue = '²';
          firstNum = true;
          performCalculation();
        }
      } else if (iOpButton.opButtonValue == "*") {
        if ( result !=0) {
          opValue = '*';
          valueToCompute2= "";
          firstNum = false;
          displayValue = "*";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "*";
        }
      } else if (iOpButton.opButtonValue == " ") {
        if ( result !=0) {
          opValue = ' ';
          valueToCompute2= "";
          firstNum = true;
          performCalculation();
        } else {
          opValue = ' ';
          firstNum = true;
          performCalculation();
        }
      } else if (iOpButton.opButtonValue == " ") {
        if ( result !=0) {
          opValue = ' ';
          valueToCompute2= "";
          firstNum = true;
          performCalculation();
        } else {
          opValue = ' ';
          firstNum = true;
          performCalculation();
        }
      } else if (iOpButton.opButtonValue == "﻿") {
        if ( result !=0) {
          opValue = '﻿';
          valueToCompute2= "";
          firstNum = true;
          displayValue = "﻿";
        } else {
          opValue = '﻿';
          firstNum = true;
          performCalculation();
        }
      } else if (iOpButton.opButtonValue == "/") {
        if ( result !=0) {
          opValue = '/';
          valueToCompute2= "";
          firstNum = false;
          displayValue = "/";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "/";
        }
      } else if (iOpButton.opButtonValue == "=") { 
        firstNum = true;
        performCalculation();
      } else if (iOpButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI = 0;
        valueToComputeI = 0;
        result = 0;
        firstNum = true;
      } else if (iOpButton.opButtonValue == "±") {
        opValue = 'n';
        performCalculation();
      }
    }
  } 
  for (int i=0; i<spButtons.length; i++) {
    Button iSpButton = spButtons[i];
    iSpButton.click();
    if (iSpButton.overBox) {
      if (iSpButton.spButtonValue == ".") {
        if (firstNum) {
          valueToCompute += iSpButton.spButtonValue;
          displayValue = valueToCompute;
        } else {
          valueToCompute2 += iSpButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
}

void keyPressed() {
  if (keyPressed == true)

  {
    if (key == '0')
    {
      if (firstNum) {
        valueToCompute = 0 + valueToCompute;
        displayValue = "0";
      } else {
        valueToCompute2 = 0 + valueToCompute2;
        displayValue = "0";
      }
    }
  }
  if (key == '1')
  {
    if (firstNum) {
      valueToCompute = 1 + valueToCompute;
      displayValue = "1";
    } else {
      valueToCompute2 = 1 + valueToCompute2;
      displayValue = "1";
    }
  }
  if (key == '2')
  {
    if (firstNum) {
      valueToCompute = 2 + valueToCompute;
      displayValue = "2";
    } else {
      valueToCompute2 = 2 + valueToCompute2;
      displayValue = "2";
    }
  } 
  if (key == '3')
  {
    if (firstNum) {
      valueToCompute = 3 + valueToCompute;
      displayValue = "3";
    } else {
      valueToCompute2 = 3 + valueToCompute2;
      displayValue = "3";
    }
  } 
  if (key == '4')
  {
    if (firstNum) {
      valueToCompute = 4 + valueToCompute;
      displayValue = "4";
    } else {
      valueToCompute2 = 4 + valueToCompute2;
      displayValue = "4";
    }
  }
  if (key == '5')
  {
    if (firstNum) {
      valueToCompute = 5 + valueToCompute;
      displayValue = "5";
    } else {
      valueToCompute2 = 5 + valueToCompute2;
      displayValue = "5";
    }
  }
  if (key == '6')
  {
    if (firstNum) {
      valueToCompute = 6 + valueToCompute;
      displayValue = "6";
    } else {
      valueToCompute2 = 6 + valueToCompute2;
      displayValue = "6";
    }
  }
  if (key == '7')
  {
    if (firstNum) {
      valueToCompute = 7 + valueToCompute;
      displayValue = "7";
    } else {
      valueToCompute2 = 7 + valueToCompute2;
      displayValue = "7";
    }
  }
  if (key == '8')
  {
    if (firstNum) {
      valueToCompute = 8 + valueToCompute;
      displayValue = "8";
    } else {
      valueToCompute2 = 8 + valueToCompute2;
      displayValue = "8";
    }
  }
  if (key == '9')
  {
    if (firstNum) {
      valueToCompute = 9 + valueToCompute;
      displayValue = "9";
    } else {
      valueToCompute2 = 9 + valueToCompute2;
      displayValue = "9";
    }
  }
  if (key == '+')
  {
    if (firstNum) 
      if (result != 0) {
        opValue = '+';
        valueToCompute2 = "";
        firstNum = false;
        displayValue = "+";
      } else {
        opValue = '+';
        firstNum = false;
        displayValue = "+";
      }
  }  
  if (key == '-')
  {
    if (firstNum) 
      if (result != 0) {
        opValue = '-';
        valueToCompute2 = "";
        firstNum = false;
        displayValue = "-";
      } else {
        opValue = '-';
        firstNum = false;
        displayValue = "-";
      }
  }   
  if (key == '*')
  {
    if (firstNum) 
      if (result != 0) {
        opValue = '*';
        valueToCompute2 = "";
        firstNum = false;
        displayValue = "*";
      } else {
        opValue = '*';
        firstNum = false;
        displayValue = "*";
      }
  }  
  if (key == '/')
  {
    if (firstNum) 
      if (result != 0) {
        opValue = '/';
        valueToCompute2 = "";
        firstNum = false;
        displayValue = "/";
      } else {
        opValue = '/';
        firstNum = false;
        displayValue = "/";
      }
  }  

  if (key == '=' || keyCode == ENTER)
  {

    firstNum = true;
    performCalculation();
  }
}
void updateDisplay() {
  fill(#FFFFFF);
  rect(25, 25, 210, 50, 0);
  fill(0);
  textSize(25);
  text(displayValue, 30, 60);
}

void performCalculation() {
  //set string values to floats
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  //perform calculation base on the appropriate operator
  if ( opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '√') {
    result = sqrt(valueToComputeI); 
    displayValue = str(result);
  } else if (opValue == ' ') {
    result = cos(valueToComputeI); 
    displayValue = str(result);
  } else if (opValue == ' ') {
    result = tan(valueToComputeI); 
    displayValue = str(result);
  } else if (opValue == '﻿') {
    result = sin(valueToComputeI); 
    displayValue = str(result);
  } else if (opValue == '²') {
    result = sq(valueToComputeI);
    displayValue = str(result);
  } else if (opValue == 'n') {
    if (firstNum) {
      valueToComputeI *= -1;
      displayValue = str(valueToComputeI);
    } else {
      valueToComputeI2 = valueToComputeI2 * -1;
      displayValue = str(valueToComputeI);
    }
  }

  //let = work multiple times
  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}

class Button {
  //member variable
  boolean isNumber;
  boolean isOperator;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  //int boxSize = 45;
  int buttonW = 45;
  int buttonH = 45;
  boolean overBox = false;

  //Constructor 1
  Button(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
    //println(numButtonValue);
  }

  //Constructor 2
  Button asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW= tempW;
    buttonH = tempH;
    return this;
  }
  Button asOperator(String tempOpButtonValue, int tempW, int tempH) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }


  Button asSpecial(String tempSpButtonValue, int tempW, int tempH) {
   isSpecial = true;
   spButtonValue = tempSpButtonValue;
   buttonW = tempW;
   buttonH = tempH;
   return this;
   }
   
  //member methods display
  void display () {
    // Draw rounded edged button on canvas
    if (isNumber) {
      fill(#F0508D);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 0);
      fill(#000000);
      textSize(24);
      text(int(numButtonValue), xpos + 15, ypos+30);
    } else if (isSpecial) {
      fill(#B53DF2);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 0);
      fill(#0343FC);
      textSize(24);
      text(spButtonValue, xpos + 15, ypos+30);
    } else if (isOperator) {
      fill(#B53DF2);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 0);
      fill(#0343FC);
      textSize(24);
      text(opButtonValue, xpos + 15, ypos+30);
    } 
    /*else if (opButtonValue == "+") {
      fill(#9658FA);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 0);
      fill(#000000);
      textSize(24);
      text(opButtonValue, xpos + 15, ypos+30);
    } else if (opButtonValue == "-") {
      fill(#9658FA);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 0);
      fill(#000000);
      textSize(24);
      text(opButtonValue, xpos + 15, ypos+30);
    } else if (opButtonValue == "*") {
      fill(#9658FA);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 0);
      fill(#000000);
      textSize(24);
      text(opButtonValue, xpos + 15, ypos+30);
    } else if (opButtonValue == "/") {
      fill(#9658FA);
      stroke(0);
      strokeWeight(2);
      rect(xpos, ypos, buttonW, buttonH, 0);
      fill(#000000);
      textSize(24);
      text(opButtonValue, xpos + 15, ypos+30);
    }*/
  }
  //member method behavior
  void click() {
    overBox = mouseX > xpos && mouseX < xpos+buttonW && mouseY > ypos && mouseY < ypos+buttonH;
  }
}

