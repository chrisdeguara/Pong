class Paddle
{
  int x,y;
  static final int WIDTH = 20;
  static final int HEIGHT = 100;
  
  public Paddle(int x, int y)
  {
    this.x = x-(WIDTH/2);
    this.y = y-(HEIGHT/2);
  }
  
  public void draw()
  {
    fill(255);
    rect(x,y,WIDTH,HEIGHT);
  }
  
  //Move paddle upwards
  public void moveUp()
  {
    if (y > 0)
    {
      y-=15;
    }
  }
  
  //Move paddle downwads
  public void moveDown()
  {
    if (y < height-HEIGHT)
    {
      y+=15;
    }
  }
  
  public void reset()
  {
    y = height/2-HEIGHT/2;
  }
}
