var fireworks = [];
var gravity;
var total;

function setup() {
  createCanvas(400, 300);
  colorMode(HSB);
  total = 150;
  
  gravity = createVector(0, 0.2);
  stroke(255);
  strokeWeight(4);
}

function draw() {
  colorMode(RGB);
  background(0, 25);
  
  if (random(1) < 0.05) {
   fireworks.push(new Firework()); 
  }
  
  for (var i = fireworks.length - 1; i >= 0; i--) {
    fireworks[i].update();
    fireworks[i].show();
    if (fireworks[i].done()) {
       fireworks.splice(i, 1); 
    }
  }
}