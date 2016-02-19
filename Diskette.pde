PImage diskette;
PImage world1;
Magnet m;
float rot = 0.0;
float x = 382;
float y = 580;
boolean jump = false;
boolean up = false;
int counter = 0;
int worldX;

boolean start;

Magnet magnetList[] = new Magnet[10];

void setup()
{
 size(1024,764); 
 background(#EBEBEB);
 diskette = loadImage("Diskette.png");
 world1 = loadImage("DisketteWorld.png");
  
  start = false;
  
 int x = 900;
 int y = 625 ;
 worldX = 0;
 
 for(int i = 0; i < magnetList.length; i++)
 {
    magnetList[i] = new Magnet (x,y);
    x += 200;
    y += (int)random(-10,10);
 }
 
 
}

void draw()
{
  //here is my background!
 image(world1,0,0,width, height,worldX,0,width,height);
 //worldX+=5;

 if(start)
 {
 for(int i = 0; i < magnetList.length; i++)
 {
    magnetList[i].update();
   
 }
 }
  
  fill(#CD5C5C);
  rect(0,650,1023,114);
  updateDiskette();
  
} 

void updateDiskette()
{
  for(int i = 0; i < magnetList.length; i++)
 {
    if(magnetList[i].getXVal() < x + 50 && magnetList[i].getXVal() > x  && magnetList[i].getYVal() > y && magnetList[i].getYVal() < y + 50)
    {
     print("collision!"); 
    }
   
 }
  if(jump)
  {
    if(up)
    {
      y-=3;
      counter++;
      if (counter==0)
        {
         up=false; 
         counter = -40;
        }
    }
    else //if(!onPlatform())
    {
      y+=3;
      counter++;
      if(counter==0)
      {
       jump = false; 
      }
    }
  }
  
  image(diskette,x,y);  
}
void keyPressed()
{
 if (keyCode==RIGHT)
 {
   x+=4;
 }
 else if(keyCode==LEFT)
 {
  x-=4; 
 }
 else if(key==' '&&!jump)
 {
  jump = true;
  up = true;
  counter = -40;
 }
 
}

void mouseClicked()
{
 start = true; 
}