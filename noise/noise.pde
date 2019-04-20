float y;
float lastX = -999;
float lastY;
int step = 10;
float seed = random(10);

void setup(){
  size(400, 400);
  background(0);
  colorMode(HSB, 360, 256, 256, 100);

  // noLoop();
}

void draw(){
  stroke(frameCount*2%360, 256, 256, 80);
  for(int x=0; x<width; x+=step){
    y = noise(seed)*400;
    if (lastX > -999){
      line(x, y, lastX, lastY);
    }
    lastX = x;
    lastY = y;
    seed += 0.1;
  }
  lastX = -999;
}
