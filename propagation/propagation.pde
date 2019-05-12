// time is frameCount(1)
float dx = 2;
float dt = 2;
float c = 0.3;
float[] surface = new float[int(600/dx)];
float[] pastSurface = new float[int(600/dx)];

void setup(){
  size(600, 400);
  background(0);
  colorMode(HSB, 360, 256, 256, 100);
  stroke(255);
  frameRate(1000/dt);
  for(int i=0; i<int(width/dx); i++){
    if(i<=int(width/dx)/2){
      surface[i] = 100;
    }else{
      surface[i] = 300;
    }
  }
}

void draw(){
  background(0);

  for(int i=1; i<int(width/dx); i++){
    line(i*dx,surface[i-1],i*dx,surface[i]);
  }
  propagate();
}

void propagate(){
  arrayCopy(surface,pastSurface);
  surface[0] = pastSurface[0] - c*(dt/dx)*(pastSurface[0]-pastSurface[int(width/dx)-1]);
  for(int i=1; i<width/dx; i++){
    surface[i] = pastSurface[i] - c*(dt/dx)*(pastSurface[i]-pastSurface[i-1]);
  }
}
