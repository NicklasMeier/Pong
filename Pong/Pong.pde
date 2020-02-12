void setup() {

  size(800, 800);

}
int initialSpeedX=-2;
int initialSpeedY=5;
int initialBallY=400;
int initialBallX=400;
int rectWidth=5;
int rect1X=800-rectWidth;
int rect2X=0;
int rect2Y=height/2;
int rect1Y=height/2;
int ballX=initialBallX; 
int ballY=initialBallY;
int speedY=initialSpeedY;
int speedX= initialSpeedX;
int scoreYou=0;
int scoreEnemy=0;



void draw(){
  background(255);

if (keyPressed) {
  if (key==CODED){
    if (keyCode == UP) {
      rect2Y-=3;
    }
    if (keyCode == DOWN) {
      rect2Y+=3;
    }
  }
  if (key == 'w'||key == 'W') {
    rect1Y-=3;
  }
  if (key == 's'||key == 'S') {
    rect1Y+=3;
  }
}

  rect(rect1X,rect1Y,rectWidth,70);
  rect(rect2X,rect2Y,rectWidth,70);
  ellipse(ballX,ballY,10,10);
  ballY+=speedY;
  ballX+=speedX;
  if( ballX<rect2X+rectWidth){
    if(ballY>rect2Y && ballY<rect2Y+70){
      speedX=speedX*(-1);
    }
  }
  
  if(ballX>rect1X){
    if(ballY>rect1Y && ballY<rect1Y+70){
      speedX=speedX*(-1);
    }
  }
  
  if(ballY>800||ballY<0){
    speedY=speedY*(-1);    
  }
  
  if(ballX>800){
    restart("you");

  }
  
  if(ballX<2){
   restart("enemy");

  }
  
  printScore();}
  
{}
void success(){
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Game Over",width/2,height/2);
  text("click mouse to start",width/2,height/4);
  fill(255);
  
  }

void printScore(){
  fill(0);
  textSize(15);
  textAlign(LEFT);
  text("scoreYou:"+scoreYou,0,height);
  textAlign(RIGHT);
  text("scoreEnemy:"+scoreEnemy,width,height);
  fill(255);
}

void restart(String side){
      success();
    speedX=0;
    speedY=0;
    
  if(mousePressed==true){
     ballX=(int)random(100, width-100);
     ballY=(int)random(100, height-100);
     speedX=(int)random(-3,3);
     speedY=(int)random(-3,3);
   while(speedX==0){
     speedX=(int)random(-3,3);
   }
   
   while(speedY==0){
     speedY=(int)random(-3,3);
   }
   
   if(side=="enemy"){
    scoreEnemy+=2;
  }
   if(side=="you"){ 
    scoreYou+=2;
   }
  }
}
