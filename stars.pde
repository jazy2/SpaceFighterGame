public class stars extends position
{
  int speed;


  stars(int tempXpos, int tempYpos, int tempSpeed)
  {
    xpos=tempXpos;
    ypos=tempYpos;
    speed=tempSpeed*rounds;
  }

  void display()
  {
    stroke (255);
    ellipseMode (CENTER);
    ellipse(xpos, ypos, 0+rounds*2, 1);
  }

  void move()
  {
    xpos=xpos-speed;
    if (xpos<0)
    {
      xpos=width;
      ypos =int(random(scrHeight+200));
    }
  }
}

