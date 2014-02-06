import ddf.minim.*;
Minim minim;
AudioPlayer laserPlayer;
AudioPlayer elaserPlayer;
AudioPlayer explosPlayer;
AudioPlayer gameOverPlayer;
int scrHeight=500;
int scrWidth=800;
int play=1;
int points=0;
int rounds=1;
stars [] starMap;
ArrayList pShots=new ArrayList();
ArrayList eShots=new ArrayList();
PlayerShip player;
EnemyShip [] wave;
PFont f;  



void setup()
{
  minim = new Minim(this);
  explosPlayer = minim.loadFile("boom.wav");
  laserPlayer = minim.loadFile("laser.wav");
  elaserPlayer = minim.loadFile("elaser.wav");
  gameOverPlayer = minim.loadFile("gameOver.wav");
  noCursor();
  f = createFont("Arial", 30, true);
  /*
  if (frame != null)
   {
   frame.setResizable(true);
   }
   */
  size(scrWidth, scrHeight);
  player=new PlayerShip(50, 600);
  starMap=new stars[100];
  for (int i =0; i <100;i++)
  {
    starMap[i]=new stars(int(random(scrWidth+200)), int(random(scrHeight)), 6);
  }
  wave= new EnemyShip[50];
  for (int i =0; i <50;i++)
  {
    wave[i]=new EnemyShip(scrWidth+(int(random((100))+100*i)), (int(random(scrHeight))));
  }
}


void draw()
{

  if (mousePressed && (mouseButton == RIGHT))
  {
    play *= -1;
  }
  if (play==1)
  {
    background (0);
    for (int i =0; i <100;i++)
    {
      starMap[i].move();
      starMap[i].display();
    }
    for (int i =0; i <50;i++)
    {
      wave[i].move();
      wave[i].display();
      wave[i].fire();
      if (dist(wave[i].xpos, wave[i].ypos, player.xpos, player.ypos)<30)
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
    }
    if (wave[49].xpos<(-30-scrWidth))
    {
      for (int j =0; j <50;j++)
      {
        wave[j].xpos=(2*scrWidth+(int(random(100)+100*j)));
        wave[j].ypos=(int(random(scrHeight)));
      }
      rounds++;
    }
    player.move();
    player.display();
    player.fire();
    for (int i = 0; i < pShots.size(); i++) 
    {
      PlayerShoot pShot = (PlayerShoot) pShots.get(i);
      int die=pShot.move(); 
      pShot.display();
      if (die==1)
      {
        pShots.remove(i);
      }
    } 
    for (int i = 0; i < eShots.size(); i++) 
    {
      EnemyShoot eShot = (EnemyShoot) eShots.get(i);
      int die=eShot.move(); 
      eShot.display();
      if (die==1)
      {
        eShots.remove(i);
      }
    }
    textFont(f, 30);
    fill(128);
    textAlign(LEFT);
    text("Points: "+points, scrWidth/2+100, 55);
    textAlign(RIGHT);
    text("Wave "+rounds, scrWidth/2-100, 55);
  }
}

