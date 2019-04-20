// pending

int rainRate = 10;
float[] rainRow = new float[rainRate];
float[][] rains = new float[10000][rainRow.length];
float rainX;

void setup(){
        size(400, 400);
        background(0);
        fill(255);
}

void draw(){
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
