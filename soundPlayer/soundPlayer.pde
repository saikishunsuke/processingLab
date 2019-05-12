import ddf.minim.*;
Minim minim;
AudioPlayer player;
float defaultRound = 50;
float nowRoundLeft = defaultRound;
float nowRoundRight = defaultRound;
float maxRound = 400;
boolean isExpandingLeft = false;
boolean isShrinkingLeft = false;
boolean isExpandingRight = false;
boolean isShrinkingRight = false;


void setup(){
  size(600, 400);
  minim = new Minim(this);
  player = minim.loadFile("hoodstar.mp3");
  player.play();
  player.loop();
  stroke(255);
}

void draw(){
  background(0);
  for(int i=0; i<player.bufferSize() - i; i++){
    point(i,50+player.left.get(i)*50);
    point(i,200+player.right.get(i)*50);
  }
}

void doom(){
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
}
