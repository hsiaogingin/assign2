//You should implement your assign2 here.


PImage start1;
PImage start2;
PImage end1;
PImage end2;
PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
int x1=0;//bg
int x2;//enemy
int y2=300;//enemy
int x3=floor(random(0,560));//treasure
int y3=floor(random(0,400));//treasure
int x4=580;//fighter
int y4=240;//fighter
int w=37;//blood, 1%blood=1.9px 20%blood=38px
float speed=5;

final int START=0;
final int RUN=1;
final int END=2;
int state;

boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;



void setup () {
  size(640,480) ; 
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  treasure=loadImage("img/treasure.png");
  hp=loadImage("img/hp.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  state=START;

}

void draw() {
  
  switch(state){
   case START:
   image(start2,0,0);
   if(mouseX>170 && mouseX<470 && mouseY>370 && mouseY<420){
     if(mousePressed){
     state=RUN;
   }else{
    image(start1,0,0);
   } 
  }
  w=37;
  x4=580;
  y4=240;
  
  break;
  
   case RUN:
  image(bg1,x1,0);
  image(bg2,x1-640,0);
  if(x1<=640){
    image(bg1,x1,0);
    image(bg2,x1-640,0);
  }
  if(x1>640){
    x1=-640;
  }
  if(x1<0){
    image(bg1,x1,0);
    image(bg2,x1+640,0);
  }
  x1++;  
  //background
  
  image(treasure,x3,y3);
  //tresure
  
  x2=x2+5;
  x2%=640;
  if(y2<y4){
  y2++;}
  else{y2--;}
  image(enemy,x2,y2);
  //enemy
  
  
  
  image(fighter,x4,y4);
  if(upPressed){
    y4-=speed;
  }
  if(downPressed){
    y4+=speed;
  }
  if(leftPressed){
    x4-=speed;
  }
  if(rightPressed){
    x4+=speed;
  }
  if(x4>580){
    rightPressed=false;
    x4-=speed;
  }
  if(x4<20){
    leftPressed=false;
    x4+=speed;
  }
  if(y4<20){
    upPressed=false;
    y4+=speed;
  }
  if(y4>410){
    downPressed=false;
    y4-=speed;
  }
  //fighter
  
  
  fill(255,0,0);
  rect(23,15,w,23);
  //blood
  
  image(hp,9,10);
  //hp
  
  
  if(x4>=x2-40 && x4<=x2+40 && y4>=y2-50 && y4<=y2+50){
  w=w-30;
  x2=-9;
  y2=floor(random(0,400));
  }
  //enemy touch detection
  
  if(x4>=x3-50 && x4<=x3+30 && y4>=y3-45 && y4<=y3+35){
    w=w+15;
    x3=floor(random(0,560));
    y3=floor(random(0,400)); 
  }
  //treasure touch detection
  
  if(w<=0){
  state=END;
  }
  if(w>=187){
  state=START;
  }
  break;
  
  case END:
   image(end2,0,0);
   if(mouseX>190 && mouseX<450 && mouseY>300 && mouseY<360){
     if(mousePressed){
     state=START;
   }else{
    image(end1,0,0);
   } 
  }

  break;
}
}



void keyPressed(){
 if(key==CODED){
   switch(keyCode){
     case UP:
     upPressed=true;
     break;
     
     case DOWN:
     downPressed=true;
     break;
     
     case LEFT:
     leftPressed=true;
     break;
     
     case RIGHT:
     rightPressed=true ;
     break;
   }
 }
}

void keyReleased(){
 if(key==CODED){
   switch(keyCode){
     case UP:
     upPressed=false;
     break;
     
     case DOWN:
     downPressed=false;
     break;
     
     case LEFT:
     leftPressed=false;
     break;
     
     case RIGHT:
     rightPressed=false ;
     break;
   }
 }
}
