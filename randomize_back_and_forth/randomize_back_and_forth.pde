float x, y, xspeed, randomMargin;
boolean goingRight;

void setup() {
  size(640, 480); 
  randomMargin = 150;
  x=0;
  y=height/2;
  goingRight = true;
  xspeed=5;
}

void draw() {
  background(0); 
  
  if (x < random(randomMargin)) 
    xspeed = abs(xspeed);
  else if( x > random(width-random(randomMargin), width))
    xspeed = -abs(xspeed); 
  
  x+=xspeed;  
  
  ellipse(x, y, 50, 50);
}

