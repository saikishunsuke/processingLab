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

public class wave extends PApplet {

int round = 200;
float step = 0.5f;
float angle = 0;
float angleStep = 1;
float lastX = -999;
float y;
float dist = 0;
float seed = random(10);
float noiseRate = 100;

public void setup(){
  
  background(0);
  colorMode(HSB, 360, 256, 256, 100);
}

public void draw(){
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
    x += (noise(seed)-0.5f)*noiseRate;
    point((x+dist)%width,y);
    x = lastX;
    angle += angleStep;
    seed += 0.1f;
  }
  dist += 10;

}
  public void settings() {  size(360, 360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "wave" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
