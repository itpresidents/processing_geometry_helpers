int shadowXOffset = 5;
int shadowYOffset = 5;

void setup() {
  size(600, 600);
  noStroke();
}


void draw() {
  background(255);
  
  pushMatrix();
  translate(mouseX, mouseY);
  for(int i = 0; i < 20000; i++) {
   float r = map(i, 0, 20000, 24, 64);
   float mappedR = map(r, 24, 64, 0, 1.5); 
   float o = 255*cos(mappedR);
   float theta = radians(i);
   
   fill(0, 0, 0, o);
   ellipse(r*cos(theta) + shadowXOffset, r*sin(theta) + shadowYOffset, 1, 1); 
    
    }
  popMatrix();  

  fill(55);
  ellipse(mouseX, mouseY, 128, 128);
  

}
