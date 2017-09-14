Blob[] blobs;

int total = 5;

void setup() {
  size(640, 360);
  colorMode(HSB);
  blobs = new Blob[total];
  for (int i = 0; i < blobs.length; i++) {
    blobs[i] = new Blob(random(width), random(height));
  }
}

void draw() {
  background(0);

  loadPixels();

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0;
      for (Blob b : blobs) {
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += b.r / d * 100;
      }

      pixels[index] = color(sum % 255, 255, 200);
    }
  }
  updatePixels();
  for (Blob b : blobs) {
    b.update();
    //b.draw();
  }
}