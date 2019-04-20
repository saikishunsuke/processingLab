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

public class noise extends PApplet {

float y;
float lastX = -999;
float lastY;
int step = 10;
float seed = random(10);

public void setup(){
  
  background(0);
  colorMode(HSB, 360, 256, 256, 100);

  // noLoop();
}

public void draw(){
  stroke(frameCount*2%360, 256, 256, 80);
  for(int x=0; x<width; x+=step){
    y = noise(seed)*400;
    if (lastX > -999){
      line(x, y, lastX, lastY);
    }
    lastX = x;
    lastY = y;
    seed += 0.1f;
  }
  lastX = -999;
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "noise" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
