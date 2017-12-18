
class Vehicle extends Physics {

  float health;
  float[] dna = new float[8];
  /*
   [0] - atraction for food
   [1] - atraction for poison
   [2] - field of view
   [3] - eatsize
   [4] - maxHealt
   [5] - size
   [6] - lifecost
   [7] - dt
   */

  Vehicle(float x, float y) {
    pos.set(x, y);
    vel.set(1, -1);
    dna[0] = 1;
    dna[1] = 20;
    dna[2] = 100;
    dna[3] = 20;
    dna[4] = 100;
    dna[5] = 7;
    dna[6] = 0.1;
    dna[7] = 0.02;
    // score = 4.66

    //dna[0] = random(1, 20);
    //dna[1] = random(1, 20);
    //dna[2] = random(50, 100);
    //dna[3] = random(15, 25);
    //dna[4] = random(80, 120);
    //dna[5] = random(5, 9);
    //dna[6] = random(0.05, 0.15);
    //dna[7] = random(0.01, 0.1);

    health = dna[4];
    dt = dna[7];
  }

  float getScore() {
    float score = 
      (20 - dna[0]) / 20
      +dna[1] / 20
      +(dna[2] - 50) / 50
      +(dna[3] - 15) / 10
      +(dna[4] - 80) / 40
      +(dna[5] - 5) / 9
      +(dna[6] - 0.05) / 0.1
      +(dna[7] - 0.01) / 0.9;

    return score;
  }

  Vehicle clone() {
    Vehicle v = new Vehicle(pos.x, pos.y);
    v.vel = vel.copy().mult(-1);
    for (int i = 0; i < v.dna.length; i++) {
      v.dna[i] = dna[i] + (random(1) < mutation ? random(-1, 1) * dna[i] : 0);
    }
    return v;
  }

  void eat(ArrayList<Particle> list, int index) {
    float min = width;
    Particle pmin = null;

    ArrayList<Particle> toremove = new ArrayList<Particle>();
    for (Particle p : list) {
      float d = dist(pos.x, pos.y, p.pos.x, p.pos.y);
      if (d < dna[3]) {
        toremove.add(p);
        health += nutrition[index];
      } else if (d < min && d < dna[2]) {
        min = d; 
        pmin = p;
      }
    }

    list.removeAll(toremove);

    if (pmin != null) {
      applyForce(seek(pmin.pos).div(dna[index]));
      stroke(255);
      //line(pos.x, pos.y, pmin.pos.x, pmin.pos.y);
    }
  }

  PVector seek(PVector target) {
    PVector desire = target.copy().sub(pos).normalize().mult(maxspeed);
    PVector steering = desire.sub(vel).limit(maxspeed);
    return steering;
  }

  boolean dead() {
    return health < 0;
  }

  void update() {
    super.update(); 
    health -= dna[6];
    if (health > dna[4]) {
      health = dna[4];
    }
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y);

    
    stroke(255);
    text(health, -25, 30);

    fill(lerpColor(color(255, 0, 0), color(0, 255, 0), health/dna[4]));
    rect(-25, -40, map(health/dna[4], 0, 1, 0, 50), 5);

    rotate(vel.heading() + PI/2);

    stroke(200);
    fill(200);
    strokeWeight(2);
    beginShape();
    vertex(0, -dna[5] * 2);
    vertex(-dna[5], dna[5] * 2);
    vertex(dna[5], dna[5] * 2);
    endShape();

    //noFill();
    //stroke(125, 125, 0);
    //ellipse(0, 0, dna[2] * 2, dna[2] * 2);

    //noFill();
    //stroke(0, 0, 255);
    //ellipse(0, 0, dna[3] * 2, dna[3] * 2);

    //float l = (20 - dna[0]) * 7;
    //noFill();
    //strokeWeight(3);
    //stroke(0, 255, 0);
    //ellipse(0, 0, l, l);

    //l = (20 - dna[1]) * 7;
    //noFill();
    //strokeWeight(3);
    //stroke(255, 0, 0);
    //ellipse(0, 0, l, l);

    //noFill();
    //stroke(255);
    //strokeWeight(1);
    //ellipse(0, 0, 70, 70);

    popMatrix();
  }
}