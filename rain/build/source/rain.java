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

public class rain extends PApplet {

int rainRate = 10;
float[] rainRow = new float[rainRate];
float[][] rains = new float[10000][rainRow.length];
float rainX;

public void setup(){
        
        background(0);
        fill(255);
        // noLoop();
}

public void draw(){
        translate(0,frameCount*10);
        for(int i=0; i<rainRate; i++) {
                rainX = random(width);
                rainRow[i] = rainX;
        }
        rains[frameCount-1] = rainRow;

        for(int i=0; i<rains.length; i++) {
                for(int j=0; j<rains[i].length; j++) {
                        ellipse(rains[i][j],100,10,10);
                }
        }
}
  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "rain" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
