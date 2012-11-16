class Polygon {
  PVector location;
  PVector [] points;
  float a, w, h, r;
  Shadow s;
  PImage img;
  PVector[] corners;

  Polygon(PVector _location, PVector [] _points, float _w, float _h, float _a, float _alt, PImage _texture, PVector _source) {
    location = _location;
    points = _points;
    a = _a;
    w = _w;
    h = _h;
    r = sqrt(sq(w) + sq(h))/2;
    turn();
    
    // Texturize the polygon with image
    // Define corners of image for texture mapping
    img = _texture;
    PVector[] _corners = {
      new PVector(0, 0),
      new PVector(0, img.height),
      new PVector(img.width, img.height),
      new PVector(img.width, 0),
    };

    corners = _corners; 
    
    // Create shadow for object
    s = new Shadow(img, corners, points, w, h, r, a, _alt, _source);
  }
  
  // Update the position and rotation of the object
  void update(PVector _location, boolean clockwise, PVector source) {
    if (mouseX >= location.x - w/2 && mouseX <= location.x + w/2 && mouseY >= location.y - h/2 && mouseY <= location.y + h/2) {
      location = _location;
      
      // Press any key to rotate
      if(keyPressed) {
        if (clockwise) 
          a += .05;
        else 
          a -= .05;
      }
      turn();
    }
    
    // Update the shadow
    s.update(points, source);
  }

  // Rotate the object, re-calculate coordinates manually so they can be passed onto shadow
  void turn() {
    for (int p = 0; p < points.length; p++) {
      float angle = points[p].heading2D();
      points[p] = new PVector(r*cos(angle + a), r*sin(angle + a));
    }
  }

  // Draw the object with texture mapping
  void display() {
    pushMatrix();
    noStroke();
    translate(location.x, location.y);

    pushMatrix();
    s.display();

    beginShape();
    noTint();
    texture(img);
    for (int p = 0; p < points.length; p++) {
      vertex(points[p].x, points[p].y, corners[p].x, corners[p].y);
    } 
    endShape(CLOSE);
    popMatrix();

    popMatrix();
  }
}

