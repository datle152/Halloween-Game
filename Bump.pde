class Bump{
  private int recX; 
  private int recY;
  private int speed; 
  private float r,g,b; 
  
  Bump(int x){
    this.recX=x; 
    this.speed=5 ;
  }
  
  void rec(int y){
    this.recY=y;
    r=random(0,255);
    g=random(0,255);
    b=random(0,255);
    fill(r,g,b);
    noStroke();
    rect(this.recX,this.recY,40,5);
    this.recX-=speed;
  }
  
//method to get coordinate of rec

int getrecX1(){ //return the front of rec
  return recX;
}

int getrecX2(){
  return recX+50;
}

int getrecY1(){
  return recY+20;
}

int getrecY2(){
  return recY;
}

}
