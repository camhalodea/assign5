class Ball{
  float ballX;
  float ballY;
  float bxSpeed;
  float bySpeed;
  float bSize;
  int life;
  boolean die = false;
  
  void move(){//dont understand why it bounce in two ways
    ballX+=bxSpeed;
    ballY+=bySpeed;
    if ( ballX< bSize/2 || ballX+bSize/2 >width ){
      bxSpeed *= -1;
    }
    if (ballY<bSize/2 || ballY >height-bSize/2){
      bySpeed *= -1;
    }
    
    float bottom = ballY+bSize/2;
    float bl = bar.barY - 10/2;
    float bLeft = bar.barX-bar.len/2;
    float bRight = bar.barX+bar.len/2;
    if (bottom > bl && ballX>bLeft && ballX<bRight){
        ballY = bl-bSize/2;
        bySpeed *= -1;
    }
  }
  void display(){
    fill(250,100,40);
    ellipse(ballX,ballY,bSize,bSize);
  }

  Ball(float x, float y, int l){
    this.ballX = x;
    this.ballY = y;
    bSize = 20;
    life=l;
  }
  
}
