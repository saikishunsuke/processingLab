int pointNum = 3;
float step = 2*PI/pointNum;
int round = 300;
float angle = 0;
float[][] points = new float[pointNum][2];


void setup(){
  size(600, 600);
  background(0);
  colorMode(HSB, 2*PI, 255, 255, 100);
  for(int i=0; i<pointNum; i++){
    points[i][0] = round*cos(angle);
    points[i][1] = round*sin(angle);
    angle += step;
  }
  frameRate(10);
  noFill();
}

void draw(){
  pushMatrix();
  background(0);
  translate(width/2,height/2);
  // translate(random(width),random(height));
  // rotate(random(PI));
  for(int i=0; i<pointNum; i++){
    stroke((frameCount/5)%(2*PI), 100, 255, 80);
    point(points[i][0], points[i][1]);
    for(int j=0; j<pointNum-1; j++){
      line(points[i][0], points[i][1], points[(i+j)%pointNum][0], points[(i+j)%pointNum][1]);
    }
    angle += step;
  }
  ellipse(0, 0, round, round);
  ellipse(0, 0, 2*round, 2*round);
  popMatrix();
}

void mousePressed(){
  pointNum += 1;
  angle = 0;
  step = 2*PI/pointNum;
  background(0);
  points = new float[pointNum][2];
  for(int i=0; i<pointNum; i++){
    points[i][0] = round*cos(angle);
    points[i][1] = round*sin(angle);
    angle += step;
  }
  print(pointNum);
}
