
PFont f;
Ball ball;
Stick player1;
Stick player2;
float space = 10;
float speed = 2;
float dt = 0.1;
float bounce = 20;

void setup() {
  size(600, 300);
  f = createFont("Arial", 16, true);
  ball = new Ball(width/2, height/2, speed);
  player1 = new Stick(space, height/2);
  player2 = new Stick(width - space * 2, height/2);
  player2.setKeys('w','s');
}

int sgn(float x) {
  if (x > 0) {
    return 1; 
  } else if (x < 0) {
    return -1; 
  } else {
    return 0; 
  }
}

void draw() {
  background(51, 200);
  fill(255);
  stroke(255);

  speed += 0.5;

  ball.update();
  ball.show();

  player1.collision(ball);
  player1.update();
  player1.show();
  
  player2.collision(ball);
  player2.update();
  player2.show();
  
  if (ball.vel.x == 0 && ball.vel.y == 0) {
    textFont(f, 15);
    fill(255);
    stroke(255);
    float d1 = dist(ball.pos.x, ball.pos.y, player1.pos.x, player1.pos.y);
    float d2 = dist(ball.pos.x, ball.pos.y, player2.pos.x, player2.pos.y);
    text("Player " + (d1 > d2 ? 1 : 2) + " won !", width/2 - 50, height/2 - 50);
  }
}