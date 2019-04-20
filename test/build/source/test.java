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
  public void setup() {

colorMode(HSB, 360, 256, 256);
background(0);
// smooth();
translate(100, 400);

for (int i = 0; i < 36; i++) {
  scale(1.1f);
  rotate(PI/18);
  stroke(10 * i, 255, 255, 102);
  line(0, 0, 20, 0);
}
    noLoop();
  }

  public void settings() { size (500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
