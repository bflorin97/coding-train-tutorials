

ArrayList<Branch> branches;
float n;
float scale = 0.7;
float len = 150;
float angle = PI/5;

void setup() {
  size(800, 600);
  branches = new ArrayList<Branch>();
  branches.add(new Branch(new PVector(0, 0), new PVector(0, -len), 0, len));
  n = 1;
}

void draw() {
  background(10, 10, 10);
  translate(width/2, height);

  for (Branch b : branches) {
    if (b.isFinished) {
      stroke(63, 3, 3);
    } else {
      stroke(0, 255, 0); 
    }
    b.draw();
  }
  
  println(branches.size());
}

Branch createBranch(Branch b, float angle) {
  PVector dir = PVector.sub(b.end, b.start);
  dir.rotate(angle);
  dir.mult(scale);
  return new Branch(b.end, PVector.add(b.end, dir), b.offsetAngle + PI/4, b.len * scale);
}

void mousePressed() {
  n++;
  ArrayList<Branch> children = new ArrayList<Branch>();

  for (Branch b : branches) {
    if (!b.isFinished) {
      b.isFinished = true;
      children.add(createBranch(b, angle));
      children.add(createBranch(b, -angle));
    }
  }
  
  branches.addAll(children);
}