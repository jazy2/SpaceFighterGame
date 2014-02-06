public class EnemyShoot extends position
{
  EnemyShoot(int tempXpos, int tempYpos)
  {
    xpos=tempXpos;
    ypos=tempYpos;
  }

  void display()
  {
    stroke (255, 255, 0);
    ellipseMode (CENTER);
    ellipse(xpos, ypos, 15, 6);
    stroke (255, 0, 0);
    ellipse(xpos+8,ypos,2,8);
  }

  int move()
  {
    xpos-=6+rounds;
    if (xpos<0)
    {
      return 1;
    }
    if (((xpos>player.xpos-20)&&(xpos<player.xpos+20))&&((ypos>player.ypos-20)&&(ypos<player.ypos+20)))
    {
      explosPlayer.play();
      explosPlayer.rewind(); 
      textFont(f, 90);  
      textAlign(CENTER);
      text("GAME OVER", scrWidth/2, scrHeight/2);
      gameOverPlayer.play();
      gameOverPlayer.rewind();
      play *= -1;
    }
    return 0;
  }
}

