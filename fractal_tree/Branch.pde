

class Branch {
  
  float len;
  float offsetAngle;
  boolean isFinished = false;
  PVector start, end;
  
  public Branch(PVector s, PVector e, float a, float l) {
    len = l; 
    offsetAngle = a;
    
    start = s;
    end = e;
  }
  
  public void draw() {
    if (!isFinished) {
      line(start.x, start.y, end.x, end.y);
    } else {
      line(start.x, start.y, end.x, end.y);
    }
  }
}