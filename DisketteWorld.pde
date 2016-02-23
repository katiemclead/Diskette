Diskette diskette;

float rot = 0.0;
float x = 382;
float y = 580;
boolean jump = false;
boolean up = false;


boolean start;
int worldX;

Magnet magnetList[] = new Magnet[10];

void setup()
{
 size(1024,764); 
 background(#EBEBEB);
 diskette = new Diskette(475,625);


 
 int x = 900;
 int y = 675 ;
 start = false;
 worldX = 0;
 
 
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
  updateDiskette();
 }
   
 
  
} 

void updateDiskette()
{

  diskette.draw();
  
  
 
  if(jump)
  {
   diskette.jump(); 
  }
  jump = diskette.getJump();

  
  
   for(int i = 0; i < magnetList.length; i++)
  {
   if(magnetList[i].getXVal() > diskette.getX() && magnetList[i].getXVal() < diskette.getX() + 90 && magnetList[i].getYVal() > diskette.getY() && magnetList[i].getYVal() < diskette.getY() + 90 )
   {
    start = false;
   }
  }
}


void keyPressed()
{
 if (keyCode==RIGHT)
 {
   diskette.beStill(false);
 }
 else if(keyCode==LEFT)
 {
  diskette.beStill(false); 
 }
 if(key==' '&&!jump)
 {
  jump = true;

  }
 
}

void keyReleased()
{
 diskette.beStill(true); 
}

void mouseClicked()
{
 start = true; 
}