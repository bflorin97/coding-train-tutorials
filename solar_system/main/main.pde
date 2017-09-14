import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

Planet sun;
PeasyCam cam;
PImage sunTexture;
PImage[] textures;

void setup() {
  size(800, 600, P3D);
  
  sunTexture = loadImage("sun.jpg");
  textures = new PImage[9];
  textures[0] = loadImage("earth.jpg");
  textures[1] = loadImage("mars.jpg");
  textures[2] = loadImage("neptune.jpg");
  textures[3] = loadImage("jupitermap.jpg");
  textures[4] = loadImage("mercurymap.jpg");
  textures[5] = loadImage("plutomap1k.jpg");
  textures[6] = loadImage("saturnmap.jpg");
  textures[7] = loadImage("uranusmap.jpg");
  textures[8] = loadImage("venusmap.jpg");
  
  cam = new PeasyCam(this, 1500);
  sun = new Planet(50, 0, sunTexture);
  sun.spawn(1);
  background(0);
}

void draw() {
  background(0);
  lights();
  //pointLight(255, 255, 255, 0, 0, 0);
  sun.update();
  sun.show();
}

void keyPressed() {
  if (keyCode == 32) {
    background(0);
     sun.moons[0].dt = sun.moons[0].dt == 0 ? 0.01 : 0;
  }
}