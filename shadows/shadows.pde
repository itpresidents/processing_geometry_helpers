Polygon p;
Source sun;
PImage sky;

void setup() {
  size(800, 600, P2D);
  rectMode(CENTER);
  
  // Background image
  sky = loadImage("sky.jpg");
  
  // Light source
  sun = new Source(new PVector(width/5, height/5), 100);
  
  // Create one object in the sky for now
  PVector location = new PVector(width/2, height/2);
  float a = 0;
  float alt = 50;
  PImage gummy = loadImage("gummy_1.jpg");
  PImage msk = loadImage("gummy_mask.jpg");
  float w = gummy.width;
  float h = gummy.height;

  gummy.mask(msk);

  p = new Polygon(location, createPoly(w, h), w, h, a, alt, gummy, calcRelativeSource(location));
}


void draw() {
  image(sky, 0, 0);
  stroke(0);
  p.display();
  sun.display();
}

// Define polygon for object
PVector[] createPoly(float w, float h) {
  PVector [] points = {
    new PVector(-w/2, -h/2 ), 
    new PVector(-w/2, h/2 ), 
    new PVector(w/2, h/2 ), 
    new PVector(w/2, -h/2),
  };    
  return points;
}

// Calc  position of the light source relative to object
PVector calcRelativeSource(PVector location) {
  PVector relativeSource = sun.location.get();
  relativeSource.sub(location);
  return relativeSource;
}

void mouseDragged() {
  
  // Move the light source
  sun.update(new PVector(mouseX, mouseY));
  
  // Rotate and move the object
  boolean clockwise = false;  
  if (mouseX > pmouseX)
    clockwise = true;
  else
    clockwise = false;

  p.update(new PVector(mouseX, mouseY), clockwise, calcRelativeSource(p.location.get()));
}

