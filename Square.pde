class Square{
  private int squareX; 
  private int squareY;
  private int bulletX;
  private int bulletY;
  private int speed; 
  private int triaX;
  private int triaY;
  private boolean onTop;
  private int speedBullet;
  
  Square(int x){
    this.squareX=x; 
    this.bulletX=x;
    this.triaX=x; 
    this.speed=5 ;
    this.speedBullet=25;
    onTop=false;
  }
  
  void spike(int y){
    this.triaY=y; 
    stroke(150);
    fill(0);
    this.triaX-=speed;
    triangle(triaX,triaY,triaX+50,triaY,triaX+25,triaY-50);
  }
  
  void square(int y){  //display a square
    squareY=y; //coordinate-y of obstacle
    rectMode(CENTER);
    strokeWeight(2);
    stroke(150);
    fill(0);
    rect(squareX, squareY, 50, 50); 
    squareX -= speed;
    noFill();
  }
  
  void bullet(int y){ //display a bullet
    bulletY=y;
    rectMode(CENTER);
    strokeWeight(2);
    stroke(150,150,0);
    fill(255,150,0);
    triangle(this.bulletX,bulletY-5, this.bulletX,bulletY+5 ,this.bulletX-60,bulletY );
    rect(this.bulletX,y, 10,10); 
    this.bulletX-=this.speedBullet;
  }
  void checkOnTop(){
    onTop=true;
  }
  
//get coordinate x-y of spike
  int getspikeX1(){
    return triaX;
  }
  int getspikeX2(){
    return triaX+50;
  }
  
  int getspikeY1(){ //return top of spike
    return triaY-25;
  }
  
  int getspikeY2(){ //return bottom of spike
    return triaY+25;
  }
  
//get coordinate x-y of bullet
  int getbulletX1(){  //return front of the bullet
    return bulletX-30;
  }
  int getbulletX2(){//return the back of the bullet
    return bulletX+25;
  }
  
  int getbulletY1(){  //top of bullet
     return  bulletY-5;
  } 
  int getbulletY2(){ //bottom of bullet
    return bulletY+5;
  }
  int getbulletY(){
    return bulletY;
  }
   
//get the coordinate x-y of square
  int getsquareX1(){  //return the front of square
    return squareX;
  }
   int getsquareX2(){  //return  the back of square
    return squareX+50;
  }
  
  int getsquareY1(){ //return the top of square
    return squareY+75;
  }
  
  int getsquareY2(){ //return the bottom of square
    return squareY+25;
  }
  
}
