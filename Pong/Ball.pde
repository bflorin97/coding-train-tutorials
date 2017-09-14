

class Ball {
  PVector pos;
  PVector vel = new PVector(-1, -1);
  PVector acc = new PVector();
  float speed;
  float w = 10;
  float h = 10;

  Ball(int x, int y, float s) {
    pos = new PVector(x, y);
    speed = s;
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {    
    vel.add(acc.mult(dt));
    pos.add(vel.copy().mult(speed));
    acc.mult(0);

    if (pos.x < 0 || pos.x > width) {
      vel.mult(0);
    }
    if (pos.y < 0 || pos.y > height) {
      vel.y *= -1;
    }
  }

  void show() {
    ellipse(pos.x, pos.y, w, h);
    stroke(255, 0, 0);
    point(pos.x, pos.y);
    stroke(255);
  }
}