PImage diskette;
Magnet m;
float rot = 0.0;
float x = 50;
float y = 680;
boolean jump = false;
boolean up = false;
int counter = 0;

ArrayList<Integer> platformX = new ArrayList<Integer>();
ArrayList<Integer> platformY = new ArrayList<Integer>();
ArrayList<Integer> platformWidth = new ArrayList<Integer>();


Fire fireList[] = new Fire[50];

void setup()
{
 size(1024,864); 
 background(#EBEBEB);
 diskette = loadImage("Diskette.png");
 
 //platform 1
 platformX.add(150);
 platformY.add(625);
 platformWidth.add(100);
 
 //platform 2
 platformX.add(250);
 platformY.add(500);
 platformWidth.add(250);
 
 m = new Magnet(50,50);
 
 int x = 1500;
 int y = 700;
 
 for(int i = 0; i < fireList.length; i++)
 {
    fireList[i] = new Fire (x,y);
    x += 20;
    y += (int)random(-20,20);
 }
 
 
}

void draw()
{
  background(#EBEBEB);
 
 
 for(int i = 0; i < fireList.length; i++)
 {
    fireList[i].update();
   
 }
  
   m.update(); 
  fill(#CD5C5C);
  rect(0,750,1023,114);
  platforms();
  updateDiskette();
  
} 
void platforms()
{
  for(int i = 0; i<platformX.size(); i++)
  {
   rect(platformX.get(i),platformY.get(i),platformWidth.get(i),40); 
  }
 
}
void updateDiskette()
{
  if(jump)
  {
    if(up)
    {
      x+=1.5*(counter+5);
      y-=3*counter*counter;
      counter++;
      if (counter==0)
        {
         up=false; 
        }
    }
    else //if(!onPlatform())
    {
      x+=1.5*(counter+5);
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