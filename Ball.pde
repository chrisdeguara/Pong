class Ball
{
  float x,y,vx,vy;
  static final int SIZE = 25;
  boolean ballMoving = false;
  
  //Call reset method to set ball in the middle of screen and generate random xy and vy
  public Ball()
  {
    //On first instance randomise where the ball will start moving
    reset((int)random(1,2));
  }
  
  //Overloaded constructor when the parameters are inserted manually rather than randomised
  public Ball(int x, int y, int vx, int vy)
  {
    this.x = x; 
    this.y = y; 
    this.vx = vx; 
    this.vy = vy;
  }
  
  public void reset(int currentScorer)
  {
    x = width/2;
    y = height/2;
    if (currentScorer == 1)
    {
      vx = (int)random(5)+15;
    }
    else
    {
      vx = (int)random(-5)-15;
    }
    //Randomise 50% chance of going upwards or downwards
    if (random(1) > 0.5)
    {
      vy = (int)random(5)+5 ;
    }
    else
    {
      vy = (int)random(-5)-5;
    }
  }
  
  public void update()
  {
    if (ballMoving == true)
    {
      checkCollision(); 
      checkScore();
    }
  }
  
  public void draw()
  {
    ellipse(x,y,SIZE,SIZE);
    ballMoving = true;
    if (firstTime == true)
    {
      firstTime = false;
    }
  }
  
  void keyPressed()
  {
    println("fasfas");
  }
  
  public void newScore()
  {
    if (x < 0)
    {
      //Player 2 scored
      s.newScore(2);
    }
    else if (x > width) 
    {
      //Player 1 scored
      s.newScore(1);
    }
    
    //Set the paddles to default location
    leftPaddle.reset();
    rightPaddle.reset();
    ballMoving = false;
  }
  
  //Check if ball collides with a paddle
  public void checkCollision()
  {
    //Get the top and bottom y coordinates of the paddles. The negative and positive 10 are use to make it less sharp
    int leftYTop = leftPaddle.y - 10;
    int leftYBottom = leftPaddle.y + Paddle.HEIGHT+10;
    
    int rightYTop = rightPaddle.y - 10;
    int rightYBottom = rightPaddle.y + Paddle.HEIGHT+10;
    
    //Check if ball hits the paddle
    if ((x <= Paddle.WIDTH) && (y > leftYTop && y < leftYBottom))
    {
      //Left player hit the ball
      vx = -vx;
    }
    else if ((x >= width-Paddle.WIDTH) && (y > rightYTop && y < rightYBottom))
    {
     //Right player hit the ball
      vx = -vx;
    }
  }
  
  //Check if a player scored
  public void checkScore()
  {
    //check who is the current scorer, in order to transfer first ball to loser
    int currentScorer;
    if (x > width || x < 0) 
    {
      if (x > width)
      {
        currentScorer = 1;
      }
      else
      {
        currentScorer = 2;
      }
      newScore();
      reset(currentScorer);
    }
    if (y > height || y < 0)
    {
      vy = -vy;
    }
   
    x += vx;
    y += vy;
  }
}
