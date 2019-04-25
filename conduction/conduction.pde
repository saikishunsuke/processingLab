float dx = 1;
float dt = 1;
float alpha = 0.5;
float[] surface = new float[int(600/dx)];
float[] pastSurface = new float[int(600/dx)];
int last = int(600/dx)-1;

void setup(){
  size(600, 400);
  background(0);
  colorMode(HSB, 360, 256, 256, 100);
  stroke(255);
  frameRate(1000/dt);
  for(int i=1; i<int(width/dx)-1; i++){
    surface[i] = min(10+pow(i-width/2, 2)*5/width, height-10);
  }
  surface[0] = height;
  surface[last] = 50;
}

void draw(){
  background(0);
  for(int i=1; i<int(width/dx); i++){
    stroke(int(surface[i]/width*360), 256, 256, 100);
    line(i*dx,surface[i-1],i*dx,surface[i]);
  }
  conduct();
}

void conduct(){
  arrayCopy(surface,pastSurface);
  for(int i=1; i<width/dx-1; i++){
    surface[i] = pastSurface[i] + alpha*(dt/dx/dx)*(pastSurface[i+1]-2*pastSurface[i]+pastSurface[i-1]);
  }
}
