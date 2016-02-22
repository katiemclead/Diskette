Diskette diskette;

float rot = 0.0;
float x = 382;
float y = 580;
boolean jump = false;
boolean up = false;
int counter = 0;

boolean start;
int worldX;

Magnet magnetList[] = new Magnet[10];

void setup()
{
 size(1024,764); 
 background(#EBEBEB);
 diskette = new Diskette(475,625);


 
 int x = 900;
 int y = 625 ;
 start = false;
 worldX = 0;
 frameRate(12);

 
 for(int i = 0; i < magnetList.length; i++)
 {
    magnetList[i] = new Magnet (x,y);
    x += (int)random(300,600);
    y += (int)random(-10,10);
 }
 
 
}

void draw()
{
 //here is my background
 background(0,255,0);

  if(start)
 {
  
 for(int i = 0; i < magnetList.length; i++)
 {
   magnetList[i].update();
   
 }
 }
   
  diskette.draw();
  
} 

void updateDiskette()
{

 
  if(jump)
  {
    if(up)
    {
      y-=3;
      counter++;
      if (counter==0)
        {
         up=false; 
         counter = -50;
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
  
  
   for(int i = 0; i < magnetList.length; i++)
  {
   if(magnetList[i].getXVal() > x && magnetList[i].getXVal() < x + 90 && magnetList[i].getYVal() > y && magnetList[i].getYVal() < y + 90 )
   {
    start = false;
   }
  }
}
void keyPressed()
{
 if (keyCode==RIGHT)
 {
   diskette.move(1);
 }
 else if(keyCode==LEFT)
 {
  diskette.move(-1); 
 }
 if(key==' '&&!jump)
 {
  jump = true;
  up = true;
  counter = -50;
 }
 
}

void keyReleased()
{
 diskette.beStill(); 
}

void mouseClicked()
{
 start = true; 
}