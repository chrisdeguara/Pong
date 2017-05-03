Ball b;
Paddle leftPaddle;
Paddle rightPaddle;
Score s;
PFont font;
boolean leftPaddleUp = false;
boolean leftPaddleDown = false;
boolean rightPaddleUp = false;
boolean rightPaddleDown = false;
boolean firstTime = true;

void setup()
{
  size(1200,650);
  smooth();
  b = new Ball();
  //Initialise the score at 0-0
  s = new Score(0, 0);
  leftPaddle = new Paddle(10, height/2);
  rightPaddle = new Paddle(width-10, height/2);
  font = loadFont("Aharoni-Bold-48.vlw");
}

void draw()
{
  background(0);

  //Show score
  color(255);
  textFont(font);
  textSize(25);
  text("Player 1: " + s.player1 + " Player 2: " + s.player2, width/2.6,30);
  
  if (b.ballMoving == false && firstTime == true)
  {
     text("Press Space!", width/2.3,height/3); 
  }
  else if (b.ballMoving == false && firstTime == false)
  {
    text("You Scored! Press Space", width/2.6,height/3); 
  }
 
  //Draw and update ball 
  if (b.ballMoving == true)
  {
    b.draw();
    b.update();
  }
  else
  {
    ellipse(width/2,height/2,Ball.SIZE,Ball.SIZE);
  }
   
  //Draw paddles
  leftPaddle.draw();
  rightPaddle.draw();
  
  //Enable moving of paddles
  movePaddles();
}

//Handle paddles
void keyPressed()
{
  //use booleans and move in update
  if (keyCode == DOWN)
  {
    rightPaddleDown = true;
  }
  else if (keyCode == UP)
  {
    rightPaddleUp = true;
  }
  else if (keyCode == 'S')
  {
    leftPaddleDown = true;
  }
  else if (keyCode == 'W')
  {
    leftPaddleUp = true;
  }
  else if (keyCode == ' ')
  {
    b.draw();
    b.ballMoving = true;
  }
}

void keyReleased()
{
  if (keyCode == DOWN)
  {
    rightPaddleDown = false;
  }
  else if (keyCode == UP)
  {
    rightPaddleUp = false;
  }
  else if (keyCode == 'S')
  {
    leftPaddleDown = false;
  }
  else if (keyCode == 'W')
  {
    leftPaddleUp = false;
  }
}

//Whenever the respective boolean is true move the paddle
void movePaddles()
{
  if (rightPaddleDown == true)
  {
    rightPaddle.moveDown();
  }
  if (rightPaddleUp == true)
  {
    rightPaddle.moveUp();
  }
  if (leftPaddleDown == true)
  {
    leftPaddle.moveDown();
  }
  if (leftPaddleUp == true)
  {
    leftPaddle.moveUp();
  }
}
