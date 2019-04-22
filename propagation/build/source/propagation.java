import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class propagation extends PApplet {

// time is frameCount(1)
float dx = 1;
float dt = 1;
float c = 0.8f;
float[] surface = new float[PApplet.parseInt(600/dx)];
float[] pastSurface = new float[PApplet.parseInt(600/dx)];

public void setup(){
  
  background(0);
  colorMode(HSB, 360, 256, 256, 100);
  stroke(255);
  frameRate(1000/dt);
  for(int i=0; i<PApplet.parseInt(width/dx); i++){
    if(i<=PApplet.parseInt(width/dx)/2){
      surface[i] = 100;
    }else{
      surface[i] = 300;
    }
  }
}

public void draw(){
  background(0);

  for(int i=1; i<PApplet.parseInt(width/dx); i++){
    line(i*dx,surface[i-1],i*dx,surface[i]);
  }
  propagate();
}

public void propagate(){
  arrayCopy(surface,pastSurface);
  surface[0] = pastSurface[0] - c*(dt/dx)*(pastSurface[0]-pastSurface[PApplet.parseInt(width/dx)-1]);
  for(int i=1; i<width/dx; i++){
    surface[i] = pastSurface[i] - c*(dt/dx)*(pastSurface[i]-pastSurface[i-1]);
  }
}
  public void settings() {  size(600, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "propagation" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
