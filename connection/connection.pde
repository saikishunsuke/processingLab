float[] surface = new float[400];
float[] rightSurface = new float[400];
float[] pastRightSurface = new float[400];
float[] leftSurface = new float[400];
float[] pastLeftSurface = new float[400];
float angle = 0;

void setup(){
  size(400, 400);
  noFill();
  stroke(255);
  for(int i=0; i<400; i++){
    surface[i] = 0;
  }
}

void draw(){
  background(0);
  translate(0, 200);
  for(int i=0; i<400; i++){
    point(i, surface[i]);
  }
  arrayCopy(rightSurface, pastRightSurface);
  arrayCopy(leftSurface, pastLeftSurface);
  rightSurface[0] = cos(angle)*100;
  leftSurface[399] = sin(angle)*100;
  for(int i=1; i<399; i++){
    rightSurface[i] = pastRightSurface[i-1];
    leftSurface[i] = pastLeftSurface[i+1];
    surface[i] = rightSurface[i] + leftSurface[i];
  }
  angle += 0.1;
}
