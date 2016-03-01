class Platform
{
  //instance variables, top left hand corner of platform
 int xCoor;
 int yCoor;
 
 //constructor
 public Platform(int x, int y){
  xCoor = x;
  yCoor = y;
 }
 
 void draw()
 {
  
 }
 
 void update()
 {
   fill(0,0,255);
   rect(xCoor,yCoor, 100,50);
 }
 
 void setXCoor(int x)
 {
   xCoor = x;
 }
 
 int getXCoor()
 {
  return xCoor; 
 }
 
 int getYCoor()
 {
  return yCoor; 
 }
}