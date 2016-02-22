class Diskette
{
 PImage standing; 
 PImage[] walking;
 int xPos;
 int yPos;
 boolean still;
 int step;
 
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
  
 }
 
 
 void draw()
 {
   if(still)
   {
     image(standing, xPos,yPos); 
   }
   else
   {
    image(walking[step],xPos,yPos); 
   }
 }
 
 void move(int x)
 {
   still = false;
   
  if(x == 1)
  {
   xPos += 4;
  }
  else
  {
   xPos -= 4; 
  }
  step++;
  if(step == 4)
  {
   step = 0; 
  }
 }
 
 void beStill()
 {
  still = true; 
 }
 
 
}