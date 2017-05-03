class Score
{
  int player1, player2;
  
  public Score(int player1, int player2)
  {
    this.player1 = player1;
    this.player2 = player2;
  }
  
  //Pass player who scored and increment respective score
  public void newScore(int player)
  {
    if (player == 1)
    {
      player1++;
    }
    else if (player == 2)
    {
      player2++;
    }
  }
}
