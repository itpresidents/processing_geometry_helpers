int shadowXOffset = 3;
int shadowYOffset = 3;

void setup() {
  size(600, 600);
  noStroke();
}


void draw() {
  background(255);
  
  pushMatrix();
  translate(mouseX, mouseY);
  for(int i = 0; i < 20000; i++) {
   float r = map(i, 0, 20000, 0, 32);
   float mappedR = map(r, 24, 32, 1, 1.5); 
   float o = 128*cos(mappedR);
   float theta = radians(i);
   
   fill(0, 0, 0, o);
   ellipse(r*cos(theta) + shadowXOffset, r*sin(theta) + shadowYOffset, 1, 1); 
    
    }
  popMatrix();  

  fill(55);
  ellipse(mouseX, mouseY, 64, 64);
  

}
