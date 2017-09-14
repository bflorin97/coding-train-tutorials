
class Planet {

  float distance;
  float radius;
  float angle;
  float orbitSpeed;
  float dt = 0.01;
  //float weight;

  Planet[] moons = null;
  PShape globe;
  PVector dir;

  Planet(float r, float d, PImage p) {
    radius = r;
    distance = d;
    angle = 0;
    orbitSpeed = random(1, 10);
    dir = PVector.random3D();
    //dir = new PVector(0, 1, 0);
    dir.mult(d);
    
    noStroke();
    noFill();
    specular(255);
    globe = createShape(SPHERE, radius);
    globe.setTexture(p);
  }

  void spawn(int total) {
    moons = new Planet[total];
    for (int i = 0; i < total; i++) {
      float r = random(0.5 * radius, 0.7 * radius);
      float d = random(radius + r, (radius + r) * 10);
      //float s = map(d, radius + r, (radius + r) * 10, -0.01, 0.01);
      moons[i] = new Planet(r, d, textures[0]);
    }
  }

  void update() {
    angle += orbitSpeed * dt;
  }

  void show() {
    
    PVector v2 = new PVector(1, 0, 1);
    PVector p = dir.cross(v2);

    pushMatrix();
    
    rotate(angle, p.x, p.y, p.z);
    translate(dir.x, dir.y, dir.z);
    
    stroke(255);
    noSmooth();
    line(0, 0, 0, dir.x, dir.y, dir.z);
    stroke(255, 0, 0);
    line(0, 0, 0, p.x, p.y, p.z);
    stroke(0, 255, 0);
    v2.mult(distance);
    line(0, 0, 0, v2.x, v2.y, v2.z);
    noStroke();
    
    if (moons != null) {
      for (Planet m : moons) {
        m.update();
        m.show();
      }
    }

    sphere(radius);
    shape(globe);
    
    popMatrix();
    
    
    println();
    println();
    println(v2);
    println(dir); 
    println(p);
    println();
    println();
    
    pushMatrix();
    
    rotate(PVector.angleBetween(dir, p), v2.x, v2.y, v2.z);
    println(PVector.angleBetween(dir, p));
    println(PVector.angleBetween(v2, p));
    println(PVector.angleBetween(dir, new PVector(0, 0, 1)));
    rotate(-PVector.angleBetween(dir, p), v2.x, v2.y, v2.z);
    
    
    stroke(255);
    //rotate(PI/2, p.x, p.y, p.z);
    //ellipse(0, 0, distance * 2, distance * 2);
    //rotate(-PI/2, p.x, p.y, p.z);
    noStroke();
    popMatrix();
    
    stroke(255);
    noSmooth();
    line(0, 0, 0, 300, 0, 0);
    stroke(255, 0, 0);
    line(0, 0, 0, 0, 300, 0);
    stroke(0, 255, 0);
    line(0, 0, 0, 0, 0, 300);
    noStroke();
    
    
    
    
  }
}