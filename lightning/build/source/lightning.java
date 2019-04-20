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

public class lightning extends PApplet {

int giza = 3;
int wid = 20;
float fromX;
float fromY;
float lastX = 200;
float lastY = 200;
float[] centerY = new float[giza+1];
float[] centerX = new float[giza+1];
float toX = 200;
float toY = 300;

public void setup(){
  
  background(0);
  colorMode(HSB, 360, 256, 256, 100);
  stroke(50, 200, 256, 50);
  // noLoop();
  frameRate(10);
}

public void draw(){
  background(0);
  for(int i=0; i<width+100; i+=100){
    stroke(0, 0, 100, 100);
    fill(0, 0, 100, 100);
    ellipse(i, 0, 200, 200);
  }
  fromX = random(width);
  fromY = random(height/giza);
  lastX = fromX;
  lastY = fromY;
  for(int i=0; i<giza+1; i++){
    centerX[i] = random(width);
    centerY[i] = random(height/(giza+2)*(i+1), height/(giza+2)*(i+2));
  }
  toX = lastX;
  toY = random(height/(giza+2)*(giza+1), height);
  if(PApplet.parseInt(random(10))%10 == 0){
    stroke(50, 200, 256, 50);
    for(int i=0; i<wid; i++){
      for(int j=0; j<giza; j++){
        if(j==0){
          line(lastX, lastY, centerX[j]+i, centerY[j]+i);
        }else if(j==giza-1){
          line(lastX+i, lastY+i, centerX[j], centerY[j]);
        }else{
          line(lastX+i, lastY+i, centerX[j]+i, centerY[j]+i);
        }
        lastX = centerX[j];
        lastY = centerY[j];
      }
      lastX = fromX;
      lastY = fromY;
    }
  }
}
  public void settings() {  size(400, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lightning" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
