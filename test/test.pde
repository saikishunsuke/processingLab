float x = 200;
float y = 200;
float nsx = 0.001;
float nsy = random(1);
float angle = 0;

void setup(){
  size(400, 400);
  background(0);
  // fill(255);
  // frameRate(30);
  colorMode(HSB, 360, 255, 255, 100);
  noStroke();
  noFill();
}

void draw(){
  // fill(y%360, 255, 255, 80);
  pushMatrix();
  translate(100+noise(nsx)*200,100+noise(nsy)*200);
  rotate(radians(frameCount/2%360));
  stroke(frameCount/3%360, 200, 200, 50);
  // ellipse(x,y,50,50);
  rect(0, 0, 100, 100);
  // x = noise(nsx)*width;
  // y = noise(nsy)*height;
  x = cos(angle)*width/3;
  y = sin(angle)*height/3;
  // y += 0.1;
  nsx += 0.002;
  nsy += 0.002;
  angle += 0.008;
  popMatrix();
}
