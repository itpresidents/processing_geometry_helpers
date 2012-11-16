class Source {

  PVector location;
  float size;


  Source (PVector _location, float _size) {
    location = _location;

    size = _size;
  }

  // Draw sun
  void display() {
    fill(255, 200, 0);
    ellipse(location.x, location.y, size, size);
  }

  // Update location of sun
  void update(PVector _location) {
    if (mouseX >= location.x - size/2 && mouseX <= location.x + size/2 && mouseY >= location.y - size/2 && mouseY <= location.y + size/2)
      location = _location;
  }
}

