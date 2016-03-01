Diskette diskette;

float rot = 0.0;
float x = 382;
float y = 580;
boolean jump = false;
boolean up = false;
int gravity;

boolean start;
int worldX;

Magnet magnetList[] = new Magnet[10];

Platform platformList[] = new Platform[10];

void setup()
{
 size(1024,764); 
 background(#EBEBEB);
 diskette = new Diskette(475,625);

gravity = 625;
 
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
 
 x = width;
 y = 650;
 for(int i = 0; i < platformList.length; i++)
 {
    platformList[i] = new Platform (x,y);
    x += (int)random(130,180);
    y += (int)random(-30,90);
 }
 
}

void draw()
{
 //here is my background
 background(0,255,0);

  if(start)
 {
  
 //for(int i = 0; i < magnetList.length; i++)
 //{
 //  magnetList[i].update();
   
 //}
 gravity = 675;
 for(int i = 0; i <platformList.length; i++)
 {
   platformList[i].update();
   if(platformList[i].getXCoor() <diskette.getX() && platformList[i].getXCoor() + 20 > diskette.getX())
   {
    gravity = platformList[i].getYCoor() - 80; 
   }
   
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
  else
  {
   diskette.gravity(gravity); //brings Diskette down if not jumping 
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
    for(int i = 0; i <platformList.length; i++)
 {
   platformList[i].setXCoor(platformList[i].getXCoor() - 1);
   
 }
 }
 else if(keyCode==LEFT)
 {
  diskette.beStill(false); 
   for(int i = 0; i <platformList.length; i++)
 {
   platformList[i].setXCoor(platformList[i].getXCoor() + 1);
   
 }
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