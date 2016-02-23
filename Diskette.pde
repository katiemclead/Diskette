class Diskette
{
 PImage standing; 
 PImage[] walking;
 int xPos;
 int yPos;
 boolean still;
 int step;
 int counter;

 
 //jumping variables
  boolean up;
  boolean down;
 
 public Diskette(int x, int y)
 {
  xPos = x;
  yPos = y;
  standing = loadImage("StandingStill.png");
  walking = new PImage[4];
  walking[0] = loadImage("Walking1.png");
  walking[1] = loadImage("Walking2.png");
  walking[2] = loadImage("Walking3.png");
  walking[3] = loadImage("Walking4.png");
  still = true;
  step = 0;

  
  //jumping variables
  up = false;
  down = false;
  counter = 0;
 }
 
 
 void draw()
 {
   if(still)
   {
     image(standing, xPos,yPos); 
   }
   else
   {
    image(walking[step%4],xPos,yPos); 
    step++;
    if(step==20)
    step = 0;
   }
 }
 
 void jump()
 {
   
   //check to see if I'm already jumping
   if(!up && !down)
   {
     up = true;
     counter = 0;
   }
   
   //check to see if I'm on my way up and keep going up
   if(up)
   {
     yPos--;
     counter++;
     
     //check to see if counter is at max
     if(counter == 100)
     {
      up = false;
      down = true;
     }
   }
   else  //on the way down
   {
      yPos++;
     counter--;
     
     //check to see if counter is at max
     if(counter == 0)
     {
      down = false;
     }
   }
 }
 
 boolean getJump()
 {
  return up || down; 
 }
  
 void beStill(boolean state)
 {
   if(state)
  still = true; 
  else
  still = false;
 }
 
 
 int getX()
 {
  return xPos ;
 }
 
  int getY()
 {
  return yPos ;
 }
}