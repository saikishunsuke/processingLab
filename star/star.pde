int pointNum = 3;
float step = 2*PI/pointNum;
int round = 300;
float angle = -HALF_PI;
float[][] points = new float[pointNum][2];
float appearSpeed = 1;
float appearAngle = 0;
int fc = 1;


void setup(){
  size(600, 600);
  background(0);
  colorMode(HSB, 360, 255, 255, 100);
  for(int i=0; i<pointNum; i++){
    points[i][0] = round*cos(angle);
    points[i][1] = round*sin(angle);
    angle += step;
  }
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2,height/2);
  noFill();
  for(int i=0; i<pointNum; i++){
    stroke((frameCount*2)%360, 100, 255, 80);
    point(points[i][0], points[i][1]);
    for(int j=0; j<pointNum-1; j++){
      line(points[i][0], points[i][1], points[(i+j)%pointNum][0], points[(i+j)%pointNum][1]);
    }
    angle += step;
  }
  ellipse(0, 0, round, round);
  ellipse(0, 0, 2*round, 2*round);
  fill(0, 0, 0, 100);
  noStroke();
  arc(0,0,2*round+5,2*round+5,-HALF_PI,20*PI/fc-HALF_PI-1, PIE);
  popMatrix();
  fc++;
}

void mousePressed(){
  pointNum += 1;
  angle = HALF_PI;
  step = 2*PI/pointNum;
  fc = 1;
  background(0);
  points = new float[pointNum][2];
  for(int i=0; i<pointNum; i++){
    points[i][0] = round*cos(angle);
    points[i][1] = round*sin(angle);
    angle += step;
  }
  print(pointNum);
}
