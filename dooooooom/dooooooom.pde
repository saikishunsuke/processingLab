float defaultRound = 50;
float nowRound = defaultRound;
float maxRound = 400;
boolean isExpanding = false;
boolean isShrinking = false;


void setup(){
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
}

void draw(){
  background(0);
  translate(width/2, height/2);
  stroke(nowRound*2%360, 100, 100, 80);

  if(isExpanding){
    nowRound += (maxRound-nowRound)/3;
    if((abs(nowRound-maxRound)<15)){
      isExpanding = false;
      isShrinking = true;
    }
  }else if(isShrinking){
    nowRound -= (nowRound-defaultRound)/3;
    if((abs(nowRound-defaultRound)<1)){
      isShrinking = false;
    }
  }
  ellipse(0,0,nowRound,nowRound);
}

void mousePressed(){
  isExpanding = true;
}
