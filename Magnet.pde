class Magnet{
 
  PGraphics magnet;
  int xVal;
  int yVal;
  public Magnet(int x, int y)
  {
    magnet = createGraphics(25,10);
    magnet.beginDraw();
      magnet.background(200);
      magnet.stroke(0);
      magnet.fill(255,0,0);
      magnet.rect(0,0,12,100);
      magnet.fill(0,0,255);
      magnet.rect(12,0,12,10);
    magnet.endDraw(); 
    xVal = x;
    yVal = y;
   
  }
  
  void draw()
  {
    
  }
  
  void update()
  {
    image(magnet, xVal,yVal); 
    xVal = xVal - 2;
  }
  
  
 float getXVal()
 {
   return xVal;
 }
 
 float getYVal()
 {
  return yVal; 
 }
  
}