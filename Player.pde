class Player{
  private int posX; //position x of the main
  private int posY; // position y of the main
  private int size; // player size
  private int startPosY; 
  private int groundlevel; 
  
  private int gravity=8; 
  private int jumpcounter=0;
  private int jumpLimit=70;
  private boolean InAir=false;
  private boolean isJumping;
  private boolean up;
  private float anglejump=0;
  
  
  
  public Player(int posX, int posY, int size){
    this.posX=posX;
    this.posY=posY;
    this.size=size;
    this.startPosY=posY;
    this.groundlevel=posY+this.size/2; 
    this.isJumping=false;
    this.up=false;
  }
  
  void display(){
    pushMatrix();
    noStroke();
    rectMode(CENTER);
    translate(this.posX,this.posY);
    stroke(22, 85, 60);
    fill(#6CBCDB);
    rotate(anglejump);
    rect(0, 0, size, size); 
    noFill();
    popMatrix();
  }
  
  void jump(){
    if (InAir==false){
      isJumping=true; //trigger player jump
    }
  }
  void up(){
    if(this.posY< this.startPosY){
      this.posY+=this.gravity; 
      InAir=true; 
    }else{
      InAir=false;//main go back to ground level, change to false 
    }
    
    if (isJumping){
      if (up==false){
        this.posY+=-13; //((-13) >gravity to jump up 
        jumpcounter+=3;
      } else if (up==true){  //hit the bumping obstacle and change the jump high
        this.posY+=-17;
        jumpcounter+=3;
      }
      
    } 
    if (jumpcounter>jumpLimit){
      up=false;
      isJumping=false; // when main reach to certain high, change to false to force the main go back
      jumpcounter=0; //reset a counter
    }   
    //spin the main
    if (InAir==false){
      anglejump=0;
    }else{
      anglejump+=PI/90;
    }
  }
  
  
  //method to get the coordinate of the player
  int getX(){
    int a=this.posX+this.size/2 ;   
    return a;
  }
  
  int getY(){ //bottom of main
    int a=posY+79  ;
    a-=gravity;
    return a;
  }
  
  int gettop(){ //top of the main
    int a=posY+79  ;
    a-=gravity;
    return a-75 ;
  }
  
  int getX1(){ //front of the player
    return posX+size/2;
  }
  
  int getX2(){ // back of the player
    return posX-size/2;
  }
  
  
  
  
}
