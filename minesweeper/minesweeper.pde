
PFont f;
float len;
float w;
float h;
int cols;
int rows;
Cell[][] grid;
boolean gameOver = false;
boolean isWin = false;

void setup() {
  size(600, 600);
  f = createFont("Arial", 16, true);
  len = 20;
  cols = 20;
  rows = 20;
  w = len;
  h = len;


  grid = new Cell[rows][cols];
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      CellType t = random(1) < 0.9 ? CellType.NUMBER : CellType.MINE;
      grid[i][j] = new Cell(i, j, len, t);
    }
  }

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j].setNeighbors();
    }
  }
}

void draw() {
  background(255, 200);

  stroke(0);
  isWin = true;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (!grid[i][j].isRevealed) {
        isWin = false;
      }
      grid[i][j].show();
      if (grid[i][j].isRevealed && grid[i][j].type == CellType.MINE) {
        activateAll();
      }
    }
  }

  if (gameOver) {
    textFont(f, 15);
    fill(0);
    stroke(0);
    text("Game Over !", width/2 - 50, height - 100);
  } else if (isWin) {
    textFont(f, 15);
    fill(0, 255, 0);
    stroke(0);
    text("You did it !", width/2 - 50, height - 100);
  }
}

void activateAll() {
  gameOver = true;
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      grid[i][j].isRevealed = true;
    }
  }
}

void drawNumber(float x, float y, int value) {
  textFont(f, 15);
  fill(0);
  stroke(0);
  text(value, x-5, y+5);
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    int x = floor(mouseX / w);
    int y = floor(mouseY / h);

    if (x < cols && y < rows) {
      grid[y][x].block();
    }
  }
  if (mouseButton == LEFT) {
    int x = floor(mouseX / w);
    int y = floor(mouseY / h);

    if (x < cols && y < rows) {
      grid[y][x].activate();
    }
  }
}