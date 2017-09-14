

float angle = 0;

void setup() {
  size(600, 600);
  colorMode(HSB, 1);
}

void draw() {
  background(255);
  
  
  float ca = map(mouseX, 0, width, -1, 1); //-0.70176;
  float cb = map(mouseY, 0, height, -1, 1); //-0.3842;
  
  //float ca = -0.8; //cos(angle * PI);
  //float cb = 0.156; //sin(angle);
  angle += 0.03;
  
  float w = 5;
  float h = (w * height) / width;
  
  float xmin = -w/2;
  float ymin = -h/2;
  
  loadPixels();
  int maxiterations = 100;
  float xmax = xmin + w;
  float ymax = ymin + h;
  
  float dx = (xmax - xmin) / width;
  float dy = (ymax - ymin) / height;
  
  float y = ymin;
  for (int j = 0; j < height; j++) {
    float x = xmin;
    for (int i = 0; i < height; i++) {
      float a = x;
      float b = y;
      int n = 0;
      
      while (n++ < maxiterations) {
        float aa = a*a;
        float bb = b*b;
        float tab = 2*a*b;
        
        if(aa * aa + bb * bb > 4) {
          break; 
        }
        
        a = aa - bb + ca;
        b = tab + cb;
      }
      
      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      } else {
        float hu = sqrt(float(n) / maxiterations);
        pixels[i+j*width] = color(hu, 255, 255); 
      }
      x += dx;
    }
    y += dy;  
  }
  
  updatePixels();
  println(frameRate);
}