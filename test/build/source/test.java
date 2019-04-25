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

public class test extends PApplet {

float x = 200;
float y = 200;
float nsx = 0.001f;
float nsy = random(1);
float angle = 0;

public void setup(){
  
  background(0);
  // fill(255);
  // frameRate(30);
  colorMode(HSB, 360, 255, 255, 100);
  noStroke();
  noFill();
}

public void draw(){
  // fill(y%360, 255, 255, 80);
  pushMatrix();
  translate(100+noise(nsx)*200,100+noise(nsy)*200);
  rotate(radians(frameCount/2%360));
  stroke(frameCount/3%360, 200, 200, 50);
  // ellipse(x,y,50,50);
  rect(0, 0, 100, 100);
  // x = noise(nsx)*width;
  // y = noise(nsy)*height;
  x = cos(angle)*width/3;
  y = sin(angle)*height/3;
  // y += 0.1;
  nsx += 0.002f;
  nsy += 0.002f;
  angle += 0.008f;
  popMatrix();
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
