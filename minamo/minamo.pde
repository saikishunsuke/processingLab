//多方向への伝播を記述するすべを学ぶ pend

float dx = 1;
float dt = 1;
float c = 1;
float angle = 0;

float[] surface = new float[int(600/dx)];
float[] pastSurface = new float[int(600/dx)];

void setup(){
  size(600, 400);
  background(0);
  noFill();
  stroke(255);
  for(int i=0; i<width/dx; i++){
    surface[i] = 100;
  }
  // surface[int(width/dx/2)] = 100;
}

void draw(){
  background(0);
  translate(0,200);
  // surface[int(width/dx/2)] = 100 * sin(angle);
  for(int i=1; i<width/dx; i++){
    line(i-1*dx, surface[i-1], i*dx, surface[i]);
  }
  propagate();
  angle += 1;
}

void propagate(){
  arrayCopy(surface,pastSurface);
  surface[0] = pastSurface[1] - c*(dt/dx)*(pastSurface[0]-pastSurface[int(width/dx)-1]);
  // surface[0] = pastSurface[1];
  // surface[int(width/dx)-1] = pastSurface[int(width/dx)-2];

  for(int i=1; i<width/dx-1; i++){
    surface[i] = pastSurface[i] - c*(dt/dx)*(pastSurface[i]-pastSurface[i-1]);
    surface[i] += pastSurface[i] - c*(dt/dx)*(pastSurface[i]-pastSurface[i+1]);s
    // surface[i] = (pastSurface[i-1] + pastSurface[i+1])/2;
  }
}
