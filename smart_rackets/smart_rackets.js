
var rocket;
var population;
var lifespan = 400;
var lifeP;
var generationP;
var count = 0;
var generation = 0;
var target;
var rx = 100;
var ry = 150;
var rw = 200;
var rh = 10;
var maxforce = 0.1;

function setup() {
  createCanvas(400, 300);
  rocket = new Rocket();
  population = new Population();
  lifeP = createP();
  generationP = createP();
  target = createVector(width/2, 50);
}

function draw() {
  background(0);
  population.run();
  lifeP.html(count);
  generationP.html(generation);

  count++;
  if (count == lifespan || population.checkAllLives()) {
    population.evaluate();
    population.selection();
    count = 0;
    generation++;
  }

  fill(255);
  rect(rx, ry, rw, rh);
  ellipse(target.x, target.y, 16, 16);
}