void setup() {
 size(400,400);
 noFill();
 strokeWeight(3);
 
 stroke(0);
 point(90,160);
 
 stroke(255,0,0);
 ellipse(90,160, 260, 260);
 
 stroke(0);
 point(260,240);
 
 stroke(0,255,0);
 ellipse(260,240, 190, 190);
 
 strokeWeight(1);
 stroke(0);
 line(90, 160, 260, 240);

 PVector[] intersections = circleCircleIntersection(90, 160, 130, 260, 240, 95);
 
 for(int i=0; i< intersections.length; i++) {
   println(intersections[i]);
   point(intersections[i].x,intersections[i].y); 
 }
}

PVector[] circleCircleIntersection(float x0, float y0, float r0,
                                   float x1, float y1, float r1) {
  
  PVector[] empty = new PVector[0];
                                     
  float centersDistance = dist(x0, y0, x1, y1);
  // The circles don't overlap
  if (centersDistance > r0 + r1) {
    return empty;
  } 
  // One circle is entirely inside the other, no intersection
  else if (centersDistance < abs(r0 - r1)) {
    return empty; 
  }
  // Infinite solutions
  else if (centersDistance == 0 && r0 == r1) {
    return empty;
  }
  else {
    float d = centersDistance;
    float a = (pow(r0,2) - pow(r1,2) + pow(centersDistance, 2)) / (2 * centersDistance);
    float h = sqrt(pow(r0,2) - pow(a, 2));
    
    PVector p0 = new PVector(x0,y0);
    PVector p1 = new PVector(x1,y1);
    PVector p2 = PVector.add(p0, PVector.mult( PVector.sub(p1, p0),  a / d));
    println(p2.x + ", " + p2.y);
    strokeWeight(3);
    point(p2.x, p2.y);
    // If h is 0 there is only one point of intersection
    if( h == 0 ) {
      PVector[] one = {PVector.add(p0, PVector.mult(PVector.sub(p1, p0), a/d))};

      return one;
    }
    else {
      PVector p3 = new PVector(p2.x + h * (p1.y - p0.y) / d, p2.y - h * (p1.x - p0.x) / d);
      PVector p4 = new PVector(p2.x - h* (p1.y - p0.y) / d, p2.y + h * (p1.x - p0.x) / d);
      PVector[] intersections = {p3, p4};
      return intersections;
    }
  }
}
