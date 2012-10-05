float x,y, sz;

void setup() {
  size(800, 600);
  x = 0;
  y = height/2;
  sz = 10;
  
}


void draw() {
  background(0);  
  ellipse(x, y, sz, sz);
  //Every frame move 1/100th of the distance between where you are and the right-end of the screen
  float speed = (width - x)/100;
  x += speed;
  println(speed);
}
