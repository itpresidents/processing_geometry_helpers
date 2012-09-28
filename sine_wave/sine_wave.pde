/*
* Animation that demonstrates the relationship between a sin wave
* and the changing height of moving around the circumference of a circle
*/


float circleX, circleY, circleSpeed, d, r, t, tSpeed;


void setup() {
  size(int(TWO_PI*100), 400);
  circleX = 0;
  circleY = height/2;
  circleSpeed = (width/TWO_PI)*.01;
  d = 100;
  r = d/2;
  t = 0;
  tSpeed = (width/TWO_PI)*.0001;
}

void draw() {
  background(255);

  noStroke();
  fill(128);
  for (float f = 0; f < t; f+=abs(tSpeed)) {
    ellipse(f*100, circleY + r*sin(f), 1, 1);
  }

  stroke(225);
  line(0, circleY, width, circleY);

  float xPos = circleX + r*cos(t);
  float yPos = circleY + r*sin(t);


  noStroke();
  // Center
  fill(255, 0, 0);
  ellipse(circleX, circleY, 10, 10);

  // Y-Position Dot
  fill(0, 255, 0);
  ellipse(circleX, yPos, 10, 10);


  // Circumference Dot
  fill(0, 0, 255);
  ellipse(xPos, yPos, 10, 10);

  stroke(0);
  //Height line
  line(circleX, circleY, circleX, yPos);

  stroke(200);
  //Height line
  line(xPos, yPos, circleX, yPos);
  //Moving Height Line
  line(xPos, yPos, xPos, circleY);

  noFill();
  ellipse(circleX, circleY, d, d);

  // Bounce back and forth
  if (circleX > width || circleX < 0) {
    circleSpeed *= -1;
    tSpeed *= -1;
  }
  
  //Move the circle
  //Move forward through the degrees of the circle for the sin and cos calculations
  circleX += circleSpeed;
  t += tSpeed;
}

