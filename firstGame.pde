  
//import processing.sound.*;

//SoundFile theme;

//declaring main
Player main; 

//declaring obstacles
Obstacle[] obstacle= new Obstacle[400]; 
Square[] square=new Square[800];
Bump[] bump=new Bump[400];

//declare global variables
int timer=0;

void setup(){
  size(1440,800);
  main=new Player(150,575,50); //coordinate x and y of the player and player's size
  for (int i=0; i<obstacle.length; i++){
    obstacle[i]= new Obstacle(50,50);  //width and height  
  }
  
  for (int i=0; i<obstacle.length; i++){
    square[i]= new Square(1440);//coordinate-x  
    bump[i]= new Bump(1440); 
  } 
  
  //theme= new SoundFile(this,"theme.mp3");
  //theme.play();
}
void draw(){
  //background 
  backGround();   
 
  //obstacles 
  showOstacle(); //based on timer to display obstacle 
  crash(); //collision with obstacles
  bumping();
  //player
  main.display();
  main.up();
  
  //timer
  timer();
  
  //test high and ground 
  line(0,600,width,600);
}

void backGround(){
  background(255);
}


void keyPressed(){
  if (key==' '){
    main.jump(); 
  }
}
void timer(){
  timer+=1;
  //println(timer); 
}
void bumping(){
    for (int i=0; i<400; i++){
     if(main.getX()>bump[i].getrecX1() && main.getX()-10<=bump[i].getrecX2()){
       if(main.getY()-47>=bump[i].getrecY2() && main.getY()-47<bump[i].getrecY1()){
          main.isJumping=true;
          main.up=true;
       }
     }
    }
}

void crash(){
  //crash with pacman
  for (int i=0;  i<400; i++){
    if (main.getX()>=obstacle[i].getpacmanX1() && main.getX()<=obstacle[i].getpacmanX2()){
      if( main.getY()>=obstacle[i].getpacmanY2() && main.getY()<=obstacle[i].getpacmanY1()){
        println("dead");
        delay(500);
        reset();
      }      
    }
  } 
  
  //crash with square
  for (int i=0; i<400; i++){
     if(main.getX()>square[i].getsquareX1() && main.getX()<square[i].getsquareX2()){
       if(main.getY()>=square[i].getsquareY2() && main.getY()<square[i].getsquareY1()+49){
         println("dead"); 
         reset();
       } 
       if(main.getY()<square[i].getsquareY1()){   
         main.startPosY=square[i].getsquareY1()-125;
       }          
     }
     if (main.getX()>square[i].getsquareX2() && square[i].onTop==false){
       main.startPosY=575;
       square[i].checkOnTop();
     }     
  } 
  
  //crash with bullet
  for (int i=0; i<400; i++){
    if(main.getX2()<=square[i].getbulletX1() && main.getX1()>=square[i].getbulletX1()){ 
      if((main.getY()-50)>=square[i].getbulletY()  && square[i].getbulletY()>=(main.gettop()-18)){
        println("dead");
        delay(1000);
        reset();
      } 
   } 
  }
  //crash with spike
  for (int i=0; i<400; i++){
     if(main.getX()>=square[i].getspikeX1() && main.getX()<=square[i].getspikeX2()){
       if((main.getY()-49)>=square[i].getspikeY1() && (main.getY()-49)<=square[i].getspikeY2()){
         println("dead"); 
         reset();
       } 
     }
  }
}

void reset(){
  timer=0; //reset timer
  setup();
}

void showOstacle(){
  //groundlevel for square and bullet: + 1-level height for square is: 
  //groundlevel for pacman: 0
  //groundlevel for spike and bullet: 510

  if (timer>50){
  bump[1].rec(598); 
  }
  if (timer>110){
  bump[2].rec(598); 
  }
  //if (timer>130){
  //square[2].spike(510); 
  //}
  //if (timer>100){
  //square[1].square(485); 
  //}
  //if (timer>260){
  //square[5].square(435); 
  //}
   
  //if (timer>300){
  //square[6].square(385);
  //}
   
  //if (timer>250){
  //square[7].spike(510); 
  //}
  //if (timer>265){
  //square[7].spike(510); 
  //}
  //if (timer>280){
  //square[8].spike(510); 
  //}
  if (timer>100){
  obstacle[1].pacman(0); 
  }
  
  if (timer>264){
  square[1].bullet(450);
  }
   
 }
