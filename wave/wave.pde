int round = 200;
float step = 0.5;
float angle = 0;
float angleStep = 1;
float lastX = -999;
float y;
float dist = 0;
float seed = random(10);
float noiseRate = 100;

void setup(){
  size(360, 360);
  background(0);
  colorMode(HSB, 360, 256, 256, 100);
}

void draw(){
  background(0);
  stroke(150, 256, 256, 100);
  if(random(100)<20){
    noiseRate = random(300);
  }else{
    noiseRate = 0;
  }
  for(float x=0; x<width; x+=step){
    y = 200 + sin(radians(angle))*150;
    lastX = x;
    x += (noise(seed)-0.5)*noiseRate;
    point((x+dist)%width,y);
    x = lastX;
    angle += angleStep;
    seed += 0.1;
  }
  dist += 10;

}
