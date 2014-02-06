public class PlayerShoot extends position
{
  PlayerShoot(int tempXpos, int tempYpos)
  {
    xpos=tempXpos;
    ypos=tempYpos;
  }

  void display()
  {
    stroke (0, 255, 255);
    ellipseMode (CENTER);
    ellipse(xpos, ypos-10, 6, 2);
    ellipse(xpos, ypos+10, 6, 2);
  }

  int move()
  {
    xpos+=10;
    if (xpos>scrWidth)
    {
      return 1;
    }


    for (int i=0; i <50;i++)
    {
      if (((xpos<wave[i].xpos+25)&&(xpos>wave[i].xpos-25))&&((ypos>wave[i].ypos-25)&&(ypos<wave[i].ypos+25)))
      {
        explosPlayer.play();
        explosPlayer.rewind();        
        wave[i].xpos=-30;
        points+=50*rounds;
        return 1;
      }
    }
    return 0;
  }
}
