public class EnemyShip extends position
{
  int delay=0;

  EnemyShip(int tempXpos, int tempYpos)
  {
    xpos=tempXpos;
    ypos=tempYpos;
  }

  void display()
  {
    stroke (25, 120, 255);
    fill(0, 120, 0);
    ellipseMode (CENTER);
    ellipse(xpos, ypos, 30, 30);
    ellipse(xpos+15, ypos, 3, 30);
    ellipse(xpos+20, ypos-15, 15, 3);
    ellipse(xpos+20, ypos+15, 15, 3);
    stroke (255);
    fill(200);
    arc(xpos-5, ypos, 15, 15, -PI/2, 3*PI/2);
  }

  void move()
  {
    xpos-=rounds;
  }
  void fire()
  {
    delay++;
    if (delay>200&&xpos<scrWidth&&xpos>0)
    {
      eShots.add(new EnemyShoot(xpos, ypos));
      elaserPlayer.play();
      elaserPlayer.rewind();
      delay=0;
    }
  }
}

