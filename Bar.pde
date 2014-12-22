class Bar{
  float barX;
  float barY;
  float len;
  float bThickness;

  Bar(float x){
    this.barX= x;
    this.barY= height-30;
    this.len=100;
    bThickness=10;
  }
      
  void move(){
    if (mouseX > 0 && mouseX <= width){
      barX=mouseX;
      // Move the ball along with the bar before clicking mouse right (ball not moving)
      if (ball.bxSpeed == 0){
        ball.ballX = barX;
      }
    }
  }
  void display(){
    rectMode(CENTER);
    fill(50,50,50);
    rect(barX,barY,len,bThickness);
  }
}
