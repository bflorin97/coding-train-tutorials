

class Cell {
  CellType type;
  int i;
  int j;
  float w;
  boolean isRevealed = false;
  boolean isBlocked = false;
  int neighbors = 0;

  Cell(int ii, int jj, float ww, CellType t) {
    i = ii;
    j = jj;
    w = ww;
    type = t;
  }

  void setNeighbors() {
    for (int i = -1; i <= 1; i ++) {
      for (int j = -1; j <= 1; j ++) {
        int x = this.i + i;
        int y = this.j + j;

        if (isAvailable(x, y)) {
          if (grid[x][y].type == CellType.MINE) {
            neighbors++;
          }
        }
      }
    }
  }

  boolean isAvailable(int x, int y) {
    return x >= 0 && x < cols && y >= 0 && y < rows;
  }

  void block() {
    if (!isRevealed) {
      isBlocked = isBlocked ? false : true;
    }
  }

  void activate() {

    if (isBlocked) {
      return;
    }
    isRevealed = true;

    for (int i = -1; i <= 1; i ++) {
      for (int j = -1; j <= 1; j ++) {
        int x = this.i + i;
        int y = this.j + j;

        if (isAvailable(x, y) && !grid[x][y].isRevealed &&
          grid[this.i][this.j].neighbors == 0) {
          grid[x][y].activate();
        }
      }
    }
  }

  void show() {
    float x = j * w;
    float y = i * h;
    if (isRevealed) {
      if (type == CellType.NUMBER) {
        fill(200);
        rect(x, y, w, w);
        if (neighbors > 0) {
          drawNumber(x + w/2, y + w/2, neighbors);
        }
        fill(255);
      } else {
        fill(200, 50, 50);
        rect(x, y, w, w);
        fill(255);
      }
    } else if (isBlocked) {
      fill(100);
      rect(x, y, w, w);
    } else {
      fill(255);
      rect(x, y, w, w);
    }
    
    if (gameOver && type == CellType.MINE) {
      pushMatrix();
      translate(this.w/2, this.w/2);
      if (isBlocked) {
        fill(0, 255, 0); 
      } else {
        fill(255, 0, 0);
      }
      ellipse(x, y, this.w/2, this.w/2);
      popMatrix();
    }
  }
}