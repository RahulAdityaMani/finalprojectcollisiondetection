/*@pjs preload="star.jpg";*/
PImage img;
Ball play;
void setup(){
 size(800,800);
background(255);
img = loadImage("star.JPG");
play = new Ball(color(0,0,255),200, 675,2,-2);
frameRate(10000);
}

void draw(){
  background(255);
  noStroke();
  fill(42,136,206);
  rect(220,200,50,300);
  rect(540,200,50,300);
  rect(mouseX-50,700,100,30);
  fill(255,255,0);
  rect (390,340,20,20);
  imageMode(CORNER);
  image(img,390,340);
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
  }
}
