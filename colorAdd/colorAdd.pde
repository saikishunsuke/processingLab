void setup(){
        size(400, 400);
        background(0);
        blendMode(ADD);
}

void draw(){
        fill(255, 0, 0);
        ellipse(200,150,80,80);
        fill(0, 255, 0);
        ellipse(180,200,80,80);
        fill(0, 0, 255);
        ellipse(220,200,80,80);
}
