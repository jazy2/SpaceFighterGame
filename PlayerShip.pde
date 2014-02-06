public class PlayerShip extends position
{
  int delay=0;

  PlayerShip(int tempXpos, int tempYpos)
  {
    xpos=tempXpos;
    ypos=tempYpos;
  }

  void display()
  {
    stroke (255, 120, 0);
    fill(255, 120, 0);
    ellipseMode (CENTER);
    ellipse(xpos, ypos, 30, 30);
    stroke (0, 120, 0);
    fill(255, 120, 0);
    ellipse(xpos+10, ypos+10, 20, 2);
    ellipse(xpos+10, ypos-10, 20, 2);
    stroke (0, 0, 200);
    fill(200);
    arc(xpos+5, ypos, 15, 15, -PI/2, PI/2);
    //ellipse(xpos, ypos, 10, 10);
  }

  void move()
  {
    xpos=mouseX;
    if (mouseX<0)
    {
      xpos=0;
    }
    if (mouseX>scrWidth)
    {
      xpos=scrWidth;
    }
    ypos=mouseY;
    if (mouseY<0)
    {
      ypos=0;
    }
    if (mouseY>scrHeight)
    {
      ypos=scrHeight;
    }
  }
  void fire()
  {
    delay++;
    if (mousePressed && (mouseButton == LEFT))
    {    
      if (delay>10)
      {
        pShots.add(new PlayerShoot(xpos, ypos));
        laserPlayer.play();
        laserPlayer.rewind();

        delay=0;
      }
    }
  }
}

