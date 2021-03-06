//Create an array of car objects
Car[] myCars = new Car[1000];

void setup() {
  size(500,500);
  background(255);
  frameRate(15);
  
  //instantiate of cars
  for (int i=0; i < myCars.length; i++) {
    myCars[i] = new Car(random(width),random(height),15,color(random(255),random(255),random(255)),random(2));

}
}

void draw() {
  background(255);
  // draw cars
  for(int i=0; i < myCars.length; i++) {
    Car iCar = myCars[i];
    iCar.display();
    iCar.drive();
   }
}
class Car {
  //member variables
  int cLength, cHeight, cWeight, cSpeed;
  color cColor;
  float xpos;
  float ypos;
  float left;

  // constructor #1
  Car(float tempX, float tempY) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = 5;
    cColor = color(255, 0, 0);
  }

  // Constructor #2
  Car(float tempX, float tempY, int tempSpeed, int tempColor, float leftTemp) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = tempSpeed;
    cColor = tempColor;
    left = leftTemp;
  }

  //member methods
  void display() {
    
    stroke(0);
    fill(100);
    //draw road
    //rect(0, ypos-5, width, 25);
    fill(cColor);
    //draw body
    rect(xpos, ypos, 40, 15);
    fill(200);
    rect(xpos+15, ypos, 10, 15, 3);
    fill(22);
    // draw tires
    rect(xpos+5, ypos-3, 10, 3);
    rect(xpos+5, ypos+15, 10, 3);
    rect(xpos+25, ypos-3, 10, 3);
    rect(xpos+25, ypos+15, 10, 3);
  }

  void drive() {// default to the right
    if (left <= 5) {
      xpos+=cSpeed;
      // detect edge
      if (xpos > width) {
        xpos = 0;
      }
    } 
  }
}


