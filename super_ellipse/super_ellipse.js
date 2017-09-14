
var slidera;
var sliderb;
var sliderm;
var slidern1;
var slidern2;
var slidern3;



function setup() {
  createCanvas(400, 400);
  slidera = createSlider(0.001, 1000, 100, 1);
  sliderb = createSlider(0.001, 1000, 100, 1);
  sliderm = createSlider(0, 10, 0, 0.001);
  slidern1 = createSlider(0, 5, 1, 0.001);
  slidern2 = createSlider(0, 5, 1, 0.001);
  slidern3 = createSlider(0, 5, 1, 0.001);
}

function draw() {
  background(51);
  translate(width / 2, height / 2);

  //var n1 = slidern1.value();
  //var n2 = slidern2.value();
  //var n3 = slidern3.value();
  
  var a = slidera.value();
  var b = sliderb.value();
  var m = sliderm.value();
  var n1 = slidern1.value();
  var n2 = slidern2.value();
  var n3 = slidern3.value();
  
  
  stroke(255);
  
  beginShape();
  noFill();
  for (var angle = 0; angle < TWO_PI; angle += 0.1) {
    // SUPER ELLIPSE EQ :
    //var na = 2 / n;
    //var x = pow(abs(cos(angle)), na) * a * sgn(cos(angle));
    //var y = pow(abs(sin(angle)), na) * b * sgn(sin(angle));
    
    // SUPER SHAPE EQ : 
    var revR = pow(pow(abs(1/a * cos(m/4 * angle)), 1/n2) + pow(abs(1/b * sin(m/4 * angle)),1/n3), 1/n1);
    var r = 1 / revR;
    
    x = r * cos(angle);
    y = r * sin(angle);
    
    vertex(x, y);
  }
  endShape(CLOSE);
}

function sgn(x) {
  if (x > 0) {
    return 1;
  } else if (x < 0) {
    return -1;
  } else return 0;
}
