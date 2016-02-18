class Magnet{
 
  PGraphics magnet;
  int xVal;
  int yVal;
  public Magnet(int x, int y)
  {
    magnet = createGraphics(50,20);
    magnet.beginDraw();
      magnet.background(200);
      magnet.stroke(0);
      magnet.fill(255,0,0);
      magnet.rect(0,0,25,20);
      magnet.fill(0,0,255);
      magnet.rect(25,0,25,20);
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
  }
  
}