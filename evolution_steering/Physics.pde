abstract class Physics {
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();
  float weight = 1;
  float maxspeed = 5;
  float dt = 0.04; //turn speed
  float rotation = 0;
  
  void applyForce(PVector force) {
    acc.add(force.div(weight)); 
  }
  
  void update() {
    vel.add(acc.mult(dt));
    
    if(pos.x < 0 || pos.x > width) {
      vel.x *=-1; 
    }
    if(pos.y < 0 || pos.y > height) {
      vel.y *=-1; 
    }
    
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }
  
  abstract void show();
}