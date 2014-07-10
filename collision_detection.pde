/*@pjs preload="star.JPG";*/
PImage img;
int starX = 390;
int starspeed=3;
int score;
Ball play;
void setup(){
 size(800,800);
background(255);
img = loadImage("star.JPG");
play = new Ball(color(0,0,255),200, 675,8,-8);
//frameRate(1000000);
}

void draw(){
  background(255);
  noStroke();
  fill(42,136,206);
  rect(220,200,50,300);
  rect(540,200,50,300);
  rect(mouseX-50,700,100,30);
  imageMode(CORNER);
  image(img,starX,340);
    starX+=starspeed;
  if(starX>=520)
  {
    starspeed*=-1;
  }
  else if(starX<=270)
  {
      starspeed*=-1;
  }
  textSize(32);
  textMode(CENTER);
  text("Points: " + score,100,100);


play.display();
  play.move();
}

class Ball{
    color c;
    int xpos;
    int ypos;
    int xspeed;
    int yspeed;
  
  Ball(color tempC, int tempXpos, int tempYpos, int tempXspeed, int tempYspeed){
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;  
  }
  
  void display(){
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,30,30); 
  }
  
  void move(){
    xpos += xspeed;
    ypos += yspeed;
    //side collision
    if(xpos > width - 15){
      xspeed = -1 * xspeed;
    }  
    if(xpos < 15){
      xspeed = -1 * xspeed; 
    }
    // top and bottom collision
    if(ypos < 15){
      yspeed = -1 * yspeed; 
    }
    //rectangles and pedal collision
    if (xpos > 205 && xpos < 220 && ypos < 500 && ypos > 200 && xspeed > 0) {
      xspeed = -1 * xspeed;
    }
    if (xpos > 270 && xpos < 285 && ypos < 500 && ypos > 200 && xspeed < 0) {
      xspeed = -1 * xspeed;
    }
    if (xpos > 220 && xpos < 270 && ypos < 200 && ypos > 185 && yspeed > 0) {
      yspeed = -1 * yspeed;
    }
    if (xpos > 220 && xpos < 270 && ypos < 515 && ypos > 500 && yspeed < 0) {
      yspeed = -1 * yspeed;
    }
    if (xpos > 525 && xpos < 540 && ypos < 500 && ypos > 200 && xspeed > 0) {
      xspeed = -1 * xspeed;
    }
    if (xpos > 590 && xpos < 605 && ypos < 500 && ypos > 200 && xspeed < 0) {
      xspeed = -1 * xspeed;
    }
    if (xpos > 540 && xpos < 590 && ypos < 200 && ypos > 185 && yspeed > 0) {
      yspeed = -1 * yspeed;
    }
    if (xpos > 540 && xpos < 590 && ypos < 515 && ypos > 500 && yspeed < 0) {
      yspeed = -1 * yspeed;
    }
    if (xpos > mouseX-50-15 && xpos < mouseX-50 && ypos < 730 && ypos > 700 && xspeed > 0) {
      xspeed = -1 * xspeed;
    }
    if (xpos > mouseX+50 && xpos < mouseX+50+15 && ypos < 730 && ypos > 700 && xspeed < 0) {
      xspeed = -1 * xspeed;
    }
    if (xpos > mouseX-50 && xpos < mouseX + 50 &&  ypos<730+15 && ypos >700-15 && yspeed >0){
     yspeed = -1 * yspeed;
    }
    if (xpos > mouseX-50 && xpos < mouseX + 50 &&  ypos>730+15 && ypos <700-15 && yspeed <0){
     yspeed = -1 * yspeed;
    }
    if (xpos > starX && xpos < starX +20 && ypos >340 && ypos< 360){
      score++;
      xspeed=xspeed*2;
      yspeed=yspeed*2;
    }
    if (ypos > 800){
      textSize(32);
  textMode(CENTER);
  text("You Lose!",300,600);
    }
  }  
}
