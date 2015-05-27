Lines[] myLines = new Lines[5];

void setup() {
  background(0);
  size(900,500);
  frameRate(20);
  //myLines1 = newLines(random(width), random(height), random(1,5), random(1,20));
  for (int i=0; i<myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(1, 5), random(1, 20));
  }
}
void draw() {
  if (frameCount > 500) {
    frameCount = 0;
    background(0);
  } else {
    for (int i=0; i<myLines.length; i++) {
      Lines iLines = myLines[i];
      iLines.display();
    }
  }
}

class Lines {
  //class variables
  float xpos;
  float ypos;
  float strokeW;
  float pointCount;

  //constructor
  Lines(float tempX, float tempY, float tempStroke, float tempCount) {
    xpos = tempX;
    ypos = tempY;
    strokeW = tempStroke;
    pointCount = tempCount;
  }
  //display
  void display() {
    strokeW = random(5, 15);
    pointCount = random(10, 8);
    stroke(0);
    strokeWeight(strokeW);


    if (xpos > width || xpos < 0 || ypos> height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
    } else {
      
      if (random(100)>60) {
        stroke(#8AF511);
        strokeWeight(strokeW);
        moveLeft(xpos, ypos, pointCount);
      } else if (random(100)>55) {
        stroke(#ED3798);
        strokeWeight(strokeW);
        moveUp(xpos, ypos, pointCount);
      } else if (random(100)>55) {
        stroke(#116AF5);
        strokeWeight(strokeW);
        moveDown(xpos, ypos, pointCount);
      } else {
        stroke(#A337ED);
        strokeWeight(strokeW);
        moveRight(xpos, ypos, pointCount);
      }
    }
  }
  void moveRight(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX+(5*i), startY);
      xpos = startX + 5;
      ypos = startY + 5;
    }
  }
  void moveLeft(float startX, float startY, float moveCount) {
    for (float i=0; i<moveCount; i++) {
      point(startX-(5*i), startY);
      xpos = startX - 5;
    }
  }
  void moveUp(float startX, float startY, float moveCount) {
    for ( float i=0; i<moveCount; i++) {
      point(startX, startY-(5*i));
      ypos = startY - 5;
    }
  }
  void moveDown(float startX, float startY, float moveCount) {
    for ( float i=0; i<moveCount; i++) {
      point(startX, startY+ (i*5));
      ypos = startY + 5;
    }
  }
}


