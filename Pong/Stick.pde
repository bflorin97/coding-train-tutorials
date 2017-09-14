

class Stick {
  PVector pos;
  PVector vel = new PVector();
  PVector acc = new PVector();
  char key_up = char(UP);
  char key_down = char(DOWN);
  float w = 10;
  float h = 50;
  
  Stick(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void setKeys(char ku, char kd) {
    key_up = ku;
    key_down = kd;
  }
  
  void applyForce(PVector force) {
    acc.add(force);
  }
  
  void collision(Ball b) {
    if (abs(pos.x - b.pos.x) < w + b.w/2 && abs(pos.y - b.pos.y + h/2) < h/2 + b.h/2) {
      b.applyForce(new PVector(-bounce * b.vel.x, 0));
    }
  }
  
  void update() {
    vel.add(acc.mult(dt));
    pos.add(vel);
    acc.mult(0);
    
    if (pos.y < 0) {
      pos.y = 0;
      vel.y = 0;
    } else if (pos.y + 50 > height) {
      pos.y = height - 50; 
      vel.y = 0;
    }
    
    if (keyPressed) {
      if (key == key_up || keyCode == key_up) {
        this.applyForce(new PVector(0, -1)); 
      } else if (key == key_down || keyCode == key_down) {
        this.applyForce(new PVector(0, 1)); 
      }
    }
  }
  
  void show() {
    rect(pos.x, pos.y, w, h);
    stroke(255, 0, 0);
    point(pos.x, pos.y);
    stroke(255);
  }
}