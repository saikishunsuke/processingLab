int verticies = 30;
float[] x = new float[verticies];
float[] y = new float[verticies];
float angle = 0;
float angleStep= TWO_PI/verticies;
int radius = 10;
float ns = 0.1;


void setup(){
  size(400, 400);
  background(255);
  noFill();
  stroke(0, 30);
  strokeWeight(0.01);
  for(int i=0; i<verticies; i++){
    x[i] = cos(angle)*radius;
    y[i] = sin(angle)*radius;
    angle += angleStep;
  }
}

void draw(){
  // background(255);
  translate(width/2,height/2);
  beginShape();
  curveVertex(x[verticies-1],y[verticies-1]);
  for(int i=0; i<verticies; i++){
    curveVertex(x[i],y[i]);
  }
  curveVertex(x[0],y[0]);
  curveVertex(x[1],y[1]);
  endShape();
  angle = 0;
  for(int i=0; i<verticies; i++){
    float length = map(noise(ns), 0, 1, -2.5, 2.5);
    x[i] -= cos(angle)*length;
    y[i] -= sin(angle)*length;
    angle += angleStep;
    ns += random(1);
  }
}
