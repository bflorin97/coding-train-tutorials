
ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();
ArrayList<Particle> food = new ArrayList<Particle>(); 
ArrayList<Particle> poison = new ArrayList<Particle>();

int nrfood = 100;
int nrpoison = 30;
int nrvehicle = 20;
float[] nutrition = new float[] {10, -90};
float mutation = 0.2;
float reproduce = 0.001;
Vehicle best = null;

void setup() {
  size(600, 600);
  colorMode(RGB);

  for (int i = 0; i < nrvehicle; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }

  best = vehicles.get(0);
}

void createParticles(ArrayList<Particle> list, int n, color c, float w) {
  for (int i = 0; i < n; i++) {
    list.add(new Particle(random(width), random(height), c));
  }
}

void draw() {
  background(51);

  fill(127);
  stroke(200);
  strokeWeight(2);
  ellipse(mouseX, mouseY, 24, 24);

  createParticles(food, nrfood - food.size(), color(0, 255, 0), 1);
  createParticles(poison, nrpoison - poison.size(), color(255, 0, 0), 10);

  ArrayList<Vehicle> removed = new ArrayList<Vehicle>();
  ArrayList<Vehicle> added = new ArrayList<Vehicle>();
  float score = 0;
  Vehicle mv = null;

  if (vehicles.size() == 0) {
    best.health = best.dna[4];
    vehicles.add(best);
  }

  for (Vehicle v : vehicles) {
    v.update();
    v.show();
    v.eat(food, 0);
    v.eat(poison, 1);
    
    if (v.dead()) {
      removed.add(v);
    }
    if (vehicles.size() < 5) {
      if (random(1) < reproduce) {
        added.add(v.clone());
      }
    }
    if (v.getScore() > score) {
      score = v.getScore(); 
      mv = v;
    }
  }

  strokeWeight(4);
  stroke(255);
  noFill();
  if (mv != null) {
    if (best.getScore() < mv.getScore()) {
      best = mv;
    }
    //rect(mv.pos.x - 15, mv.pos.y-15, 30, 30);
  }

  println("Max score :" + score);
  vehicles.addAll(added);
  vehicles.removeAll(removed);

  for (Particle p : food) {
    p.show();
  }

  for (Particle p : poison) {
    p.show();
  }
}

void mouseClicked() {
  vehicles.removeAll(vehicles); 
}