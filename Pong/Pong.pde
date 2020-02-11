void setup() {

  size(800, 800);

}
int initialSpeedX=2;
int initialSpeedY=5;
int rectWidth=5;
int rect1=800-rectWidth;
int rect2=0;
int ballX= 200; 
int speedY=initialSpeedY;
int speedX= initialSpeedX;
int ballY=200;
int scoreYou=0;
int scoreEnemy=0;

void draw(){
  background(255);
  rect(rect1,mouseY,rectWidth,70);
  rect(rect2,mouseY,rectWidth,70);
  ellipse(ballX,ballY,10,10);
  ballY+=speedY;
  ballX+=speedX;
  if(ballX >rect1  || ballX<rect2+rectWidth){
    if(ballY>mouseY && ballY<mouseY+70){
      speedX=speedX*(-1);
    }
  }
  if(ballY>800||ballY<0){
    speedY=speedY*(-1);    
  }
  
  if(ballX>800){
    success();
    speedX=0;
    speedY=0;
    scoreYou+=2;
    if(keyPressed==true){
     ballX=200;
     ballY=200;
     speedX=initialSpeedX;
     speedY=initialSpeedY;
    } 
  }
  if(ballX<0){
    success();
    speedX=0;
    speedY=0;
    scoreEnemy+=2;
    if(keyPressed==true){
     ballX=200;
     ballY=200;
     speedX=initialSpeedX;
     speedY=initialSpeedY;
    } 
  }
  
  printScore();
  
}
void success(){
  fill(0);
  textAlign(CENTER);
  text("Game Over",width/2,height/2);
  text("press any key to restart",width/2,height/4);
  fill(255);
}

void printScore(){
  fill(0);
  textAlign(LEFT);
  text("score:"+scoreYou,0,height);
  textAlign(RIGHT);
  text("score:"+scoreEnemy,width,height);
  fill(255);
}
