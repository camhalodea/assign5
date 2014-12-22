Ball ball;
Bar bar;
Brick [] brickList;

//Game Status
final int GAME_START   =0;
final int GAME_PLAYING =1;
final int GAME_WIN     =2;
final int GAME_LOSE    =3;
int status;
int brickCount=50;

void setup() {
  status=GAME_START;
  
  size(640,480);
  background(0,0,0);
  rectMode(CENTER);
  
  bar = new Bar(width/2);
  ball = new Ball(bar.barX, height-33, 3);

  brickList = new Brick [50];
  
  reset();
  //brickMaker(50,10);
}

void draw() {
  background(0);
  noStroke();
  
  switch(status) {

  case GAME_START:
    printText();
    break;

  case GAME_PLAYING:
    background(0);
    ball.move();
    ball.display();
    bar.move();
    bar.display();
    drawBrick();
    drawLife();
    checkBrickHit();
    ballDie();
    checkWinLose();
    break;

  case GAME_WIN:
    printText();
    break;

  case GAME_LOSE:
    printText();
    break;
  }
  
}

void brickMaker(int num, int numInRow) {
  int spacing= 40;
  for(int i=0; i<num;i++){
    int row= int((float)i / (float)numInRow);
    int col= i % numInRow;
    int x = 145 + (spacing*col);
    int y = 50 + (spacing*row);
    brickList[i]= new Brick(x, y);
  }
}

void drawBrick() {
  for (int i=0; i<brickList.length; i++) {
    Brick brick = brickList[i];
    if (brick!=null && !brick.broke) { 
      brick.display(); 
    }
  }
}

void drawLife() {
  fill(230, 74, 96);
  text("LIFE:", 36, 465);
  for(int i=0; i< ball.life; i++){
    fill(230, 74, 96);
    ellipse(78+25*i,459, 15, 15);
  }
}

void checkBrickHit() {
  //for (int i=0; i<bList.length; i++) {
    for (int j=0; j<brickList.length; j++) {
      Brick brick = brickList[j];
      if (brickList != null && !brick.broke // Check Array isn't empty and brick still exist
      && Math.abs( ball.ballX - brickList[j].cX ) < brickList[j].cSize/2 + ball.bSize //what's wrong with brickList.cX?
      && Math.abs( ball.ballY - brickList[j].cY ) < brickList[j].cSize/2 + ball.bSize ) {
          removeBrick(brickList[j]);
          brickCount--;
          checkWinLose();
      }
    }
  //}
}

void removeBrick(Brick obj){
  obj.broke = true;
  obj.cX = 2000;
  obj.cY = 2000;
}

void removeBall(Ball obj){
  obj.die = true;
  obj.ballX = 1000;
  obj.ballY = 1000;
}

void ballDie(){
  if( ball.ballY >= height-ball.bSize/2){
    ball.life--;
    bar.barX=width/2;
    ball.ballX=bar.barX;
    ball.ballY=height-33;
    ball.bxSpeed=0;
    ball.bySpeed=0;
  }
}

void checkWinLose() {
  if ( ball.life <= 0 ) {
    status = GAME_LOSE;
  }
  if ( brickCount <= 0 ) {
    status = GAME_WIN;
  } 
}

void keyPressed(){
  statusCtrl();
}

void statusCtrl(){
  if (key == ENTER) {
    switch(status) {
      case GAME_START:
        status = GAME_PLAYING;
        reset();
        break;
      case GAME_WIN:
         status = GAME_PLAYING;
         reset();
         break;
      case GAME_LOSE:
         status = GAME_PLAYING;
         reset();
         break;
    }
  }
}  

void mousePressed(){
  if( status == GAME_PLAYING && ball.bxSpeed==0 && ball.bySpeed==0){
      if(mouseButton== RIGHT){
        ball.bxSpeed = random(-3,3);
        ball.bySpeed = -3;
      }
  }
}

void reset(){
  for(int i =0; i<brickList.length-1; i++){
    brickList[i]= null;
  }

  brickMaker(50,10);
  bar.barX=width/2;
  ball.ballX=bar.barX;
  ball.ballY=height-33;
  ball.life=3;
  brickCount=50;
  ball.bxSpeed=0;
  ball.bySpeed=0;
}
  

void printText(){
  fill(95,194,226);
  textAlign(CENTER);
  if(status==GAME_START){
    textSize(60);
    text("ARKANOID", width/2, 240);
    textSize(20);
    text("Press ENTER to Start",width/2, 280);
  }else if(status==GAME_WIN){
    textSize(40);
    text("WINNER", width/2, 300);
    textSize(20);
    text("You eliminate all the bricks!",width/2,340);
  }else if(status==GAME_LOSE){
    textSize(40);
    text("You Lose!", width/2, 240);
    textSize(20);
    text("Sorry you drop too much",width/2, 280);
  }
}

