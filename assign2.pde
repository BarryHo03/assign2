PImage bg1, bg2, end1, end2, enemy, fighter, hp, start1, start2, treasure;
float b,e,g,h,n,x,y,z,w;
float speedF=5;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

final int GAME_START = 0;
final int GAME_RUN= 1;
final int GAME_OVER= 2;

int gameState = GAME_START;


void setup () {
  size(640, 480) ;
  bg1=loadImage("img/bg1.png");
  bg2=loadImage("img/bg2.png");
  enemy=loadImage("img/enemy.png");
  fighter=loadImage("img/fighter.png");
  hp=loadImage("img/hp.png");
  treasure=loadImage("img/treasure.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  e=random(15,460);
  z=random(0,600);
  w=random(20,440);
  b=640;
  g=0;
  h=195;
  x=600;
  y=200;

}

void draw() { 
  switch(gameState){
    case GAME_START:
      image(start2,0,0);
      if(mouseY >370 && mouseY<420 && mouseX>210 && mouseX<450){
      image(start1,0,0);
        if(mousePressed){
          gameState=GAME_RUN;
        }
    }
    break;
    case GAME_OVER:
    image(end2,0,0);
    if(mouseY >310 && mouseY<350 && mouseX>200 && mouseX<440){
        if(mousePressed){
          gameState=GAME_RUN;
          h=195;
          x=600;
          y=200;
        }else{
        image(end1,0,0);
        }
    }
    break;
    case GAME_RUN:
    //bg
    image(bg1,b-640,0);
    b++;
    b%=1280;
    
    image(bg2,g-640,0);
    g++;
    g%=1280;
    
    //hp 
    noStroke();
    fill(255,0,0);
    rect(10,0,h,20);
    image(hp,0,0);
    
    //enemy & its movement
    image(enemy,n,e);
    n+=4;
    n%=640;
    if(e<=y){
    e+=2;
    }
    if(e>=y){
    e-=2;
    }
    if(n==0){
    e=random(15,460);
    }
    
    
    //hp lose & enemy reset
    if(x<=n+50 && x>=n-50 && y>=e-50 && y<=e+55){
    h-=39;
    n=0;
    e=random(15,460);
    }
    
    //fighter
    image(fighter,x,y);
    
    //treasure
    image(treasure,z,w); 
    
    //refill hp
    if(x<=z+40 && x>=z-50 && y>=w-50 && y<=w+40){
    h+=19.5;
    z=random(0,600);
    w=random(20,440);
    }
    
    if(h>195){
    h=195;
    }
      
    //fighter control
    if(upPressed){
      y-=speedF;
     }
    if(downPressed){
      y+=speedF;
    }
    if(rightPressed){
      x+=speedF;
    }
    if(leftPressed){
      x-=speedF;
    }
    if(x>width-50){
    x=width-50;
    }
    if(x<0){
    x=0;
    }
    if(y>height-50){
    y=height-50;
    }
    if(y<0){
    y=0;
    } 
    if(h<=0){
    gameState=GAME_OVER;
    }
    break;   
  }  
}
void keyPressed(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }      
  }
}
void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
