

class Particle extends Physics{
  color c;
  float size = 6;
  
  Particle(float x, float y, color c) {
    this.c = c;
    pos = new PVector(x, y);
  }
  
  void show() {
    fill(c);
    strokeWeight(1);
    stroke(100);
    ellipse(pos.x, pos.y, size, size);
  }
}