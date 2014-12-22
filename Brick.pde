class Brick{
  int cX;
  int cY;
  int cSize=35;
  boolean broke = false;
  
  
  void display(){
    fill(50,150,100);
    rect(cX,cY,cSize,cSize);
  }

  Brick(int x, int y){
    cX=x;
    cY=y;
  }
}
