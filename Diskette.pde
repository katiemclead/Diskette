PImage diskette;
Magnet m;
float rot = 0.0;
float x = 50;
float y = 680;
boolean jump = false;
boolean up = false;
int counter = 0;



Magnet magnetList[] = new Magnet[10];

void setup()
{
 size(1024,864); 
 background(#EBEBEB);
 diskette = loadImage("Diskette.png");
 
  
  
 int x = 900;
 int y = 725;
 
 for(int i = 0; i < magnetList.length; i++)
 {
    magnetList[i] = new Magnet (x,y);
    x += 200;
    y += (int)random(-20,20);
 }
 
 
}

void draw()
{
  background(#EBEBEB);
 
 
 for(int i = 0; i < magnetList.length; i++)
 {
    magnetList[i].update();
   
 }
  
  
  fill(#CD5C5C);
  rect(0,750,1023,114);
  updateDiskette();
  
} 

void updateDiskette()
{
  if(jump)
  {
    if(up)
    {
      y-=3*counter*counter;
      counter++;
      if (counter==0)
        {
         up=false; 
        }
    }
    else //if(!onPlatform())
    {
      y+=3*counter*counter;
      counter++;
      if(counter==6)
      {
       jump = false; 
      }
    }
  }
  // gravity();
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
  counter = -5;
 }
}