class Shadow {
  PVector [] points, shadow;
  PVector source;
  float w, h, r, a, alt;
  PImage img;
  PVector[] corners;

  Shadow(PImage _texture, PVector[] _corners, PVector [] _points, float _w, float _h, float _r, float _a, float _alt, PVector _source) {
    img = _texture;
    corners = _corners;
    
    points = _points;
    shadow = new PVector[points.length];
    a = _a;
    alt = _alt;
    w = _w;
    h = _h;
    r = _r;
    source = _source;
    
    // Project the shadow
    project(_points);
  }

  // Update the relative light source position
  // Re-project the shadow
  void update(PVector[] _points, PVector _source) {
    source = _source;
    project(_points);
  } 

  // Draw the shadow with texture mapping
  void display() {
    noStroke();
    tint(0, 67);
    beginShape();
    texture(img);
    for (int p = 0; p < shadow.length; p++) {
      vertex(shadow[p].x, shadow[p].y, corners[p].x, corners[p].y);
    } 
    endShape();

  }
  
  // Project each corner of the object onto the "ground"
  void project(PVector[] _points) {

    for (int p = 0; p < _points.length; p++) {
      
      // Find the angle of the corner being project relative to the sun
      PVector projection = _points[p].get();
      projection.sub(source);
      float angle = projection.heading2D();
      
      // Calculate the distance ofprojection 
      // Based on height of the point from the "ground" as defined by the alt
      float _alt = abs(_points[p].y - alt); 
      float yOffset = _alt*sin(angle);
      float radius = yOffset/sin(angle);

      shadow[p] = _points[p].get();
      shadow[p].add(new PVector(radius*cos(angle), radius*sin(angle)));
            
      //println("Source: " + source + "\t" + "Point: " + p + "\t" +  "Angle: " + degrees(angle) + "\t" + "Offset: " + offset);
    }
  }  
}

