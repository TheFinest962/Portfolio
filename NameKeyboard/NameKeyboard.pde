//Global Variable
int x, y;

void setup() {
  size(800,800);
  frameRate(10);
  // Set start coords
  x = width/2;
  y = height/2;
}

void draw() {
  //drawName();
  //noLoop();
}

// Method to draw right line
void moveRight(int rep) {
  for (int i=0; i<rep*10; i++) {
    stroke(random(255),random(255),random(255));
    point(x+i, y);
  }
  x=x+(10*rep);
}
void moveDown(int rep) {
  for (int i=0; i<rep*10; i++) {
    stroke(random(255),random(255),random(255));
    point(x, y+i);
  }
  y=y+(10*rep);
}
void moveUp(int rep) {
  for (int i=0; i<rep*10; i++) {
    stroke(random(255),random(255),random(255));
    point(x, y-i);
  }
  y=y-(10*rep);
}
void moveRightDown(int rep) {
  for (int i=0; i<rep*10; i++) {
    point(y+i, x+i);
  }

  y=y+(10*rep);
  x=x+(10*rep);
}
void moveLeft(int rep) {
  for (int i=0; i<rep*10; i++) {
    stroke(random(255),random(255),random(255));
    point(x-i, y);
  }
  x=x-(10*rep);
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      moveRight(5);
    } else if(keyCode == DOWN) {
      moveDown(5);
    } else if(keyCode == UP) {
      moveUp(5);
    } else if(keyCode == LEFT) {
      moveLeft(5);
    } //else if(keyCode == RIGHT && keyCode == DOWN) {
      //rightDown(1);
    //}
  }
}

//Take Picture
void mouseClicked() {
  
  saveFrame("line-######.png");
  
}


