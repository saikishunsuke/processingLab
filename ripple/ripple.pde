class Ripple {
  float nowRound, x, y;

  Ripple(float _x, float _y){
    x = _x;
    y = _y;
    nowRound = 0;
  }
  void display(){
    stroke(y%255, 100, 100, 100-nowRound/3);
    ellipse(x, y, nowRound, nowRound);
  }
  void update(){
    nowRound += 2;
  }
}

ArrayList<Ripple> rounds = new ArrayList<Ripple>();

void setup(){
  size(400, 400);
  colorMode(HSB, 255, 100, 100, 100);
  noFill();
}

void draw(){
  background(0);
  for(int i=0; i<rounds.size(); i++){
    Ripple rip = rounds.get(i);
    rip.display();
    rip.update();
    if(rip.nowRound > 300){
      rounds.remove(i);
    }
  }
}

void mousePressed(){
  rounds.add(new Ripple(mouseX, mouseY));
}

void mouseDragged(){
  if(int(random(10)) == 0){
    rounds.add(new Ripple(random(width), random(height)));
  }
}
