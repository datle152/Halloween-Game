class Obstacle{
 
  private int widthRec;
  private int heightRec; 
  private int speed; 
  private int x;
  private int groundlevel; 
  private int squareWid;
  private int squareHei;
  
    Obstacle(int widthRec, int heightRec){
    this.widthRec=widthRec;
    this.heightRec=heightRec; 
    this.x=width; //ostacle starts at the edege of right screen
    this.speed=9;
    this.groundlevel= main.groundlevel;
    this.squareWid=widthRec;
    this.squareHei=heightRec;
  }
  
  void pacman(int y){ //elevate the hight of obstacle by increasing y
    pushMatrix();
    translate(0, 20);
    fill(#7C7352);
    arc(this.x,this.groundlevel-this.heightRec/2-y-20,widthRec+10,heightRec+10,radians(-135), radians(135), PIE);
    fill(#CEBD64);
    //rect(this.x, this.groundlevel-this.heightRec/2-y-20,this.widthRec,this.heightRec);
    this.x-= this.speed;
    //spots
    ellipse(this.x+15,groundlevel-this.heightRec/2-y-15-20,15,15);
    ellipse(this.x+15,groundlevel-this.heightRec/2-y+15-20,10,10);
    ellipse(this.x+2,groundlevel-this.heightRec/2-20-20,10,10);
    noFill();
    popMatrix();
  }
  
  
 int getpacmanX1(){  //at the front of pacman
    int a =x;
    a-=speed;
    return a;
  } 
  int getpacmanX2(){  //at the back of pacman
    int a=x;
    a-=speed;
    return a+widthRec;
  } 
  int getpacmanY1(){ //on the top of pacman
    return this.groundlevel+heightRec;
  }
  int getpacmanY2(){ //at the bottom of pacman
    return this.groundlevel;
  }

}
