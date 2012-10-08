// Number of Rays
int numRays;

// Center of the Sun
float centerX, centerY;

// Size of the Sun in terms of 
// distance from center of sun to edge of sun
float radius;

// Starting angle of first ray
float rStart;

void setup() {
 size(600, 600); 
 rStart = 0; 
 numRays = 100;
 radius = 600;
 centerX = width/2;
 centerY = height/2;
}

void draw() {
 background(0);
 stroke(255);
 
 //Loop through all the angles for each sun ray
 //Where the "angle" is TWO_PI divided by the number of rays
 for (float r = 0; r < TWO_PI; r+=TWO_PI/numRays) {
  //Calculate x and y-positions of the end of each ray
  //by multiplying the radius of the sun with cos and sin of the angle
  float xPos =  centerX + radius*cos(r);
  float yPos = centerY + radius*sin(r);
  line(centerX, centerY, xPos, yPos); 
 }
 
 
}
