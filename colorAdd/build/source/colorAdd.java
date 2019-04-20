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

public class colorAdd extends PApplet {

public void setup(){
  
  background(0);
  blendMode(ADD);
}

public void draw(){
  fill(255, 0, 0);
  ellipse(200,150,80,80);
  fill(0, 255, 0);
  ellipse(180,200,80,80);
  fill(0, 0, 255);
  ellipse(220,200,80,80);
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "colorAdd" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
