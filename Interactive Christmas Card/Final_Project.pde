import processing.video.*;
import fisica.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Capture video;
FWorld world;

//sound
Minim minim;
AudioPlayer song;

//Snowflakes
PImage SnowflakeImage;
ArrayList<Snowflake> theSnowflakes = new ArrayList<Snowflake>();
PImage snowflake1;
PImage snowflake2;
PImage snowflake3;

PImage banner;

int state = 0;

void setup()
{
  size(640, 480);

  String[] cameras = Capture.list();

  //I was using the additional webcam, but I've added the usual code anyway!

  video = new Capture(this, cameras[13]);
  video.start();

  //video = new Capture(this, 640, 480);
  //video.start();

  banner = loadImage("ChristmasBanner.png");
  banner.resize(600, 500);

  SnowflakeImage = loadImage("snowball.png");
  for (int i = 0; i < 50; i++)
  {
    theSnowflakes.add( new Snowflake() );
  }

  //FISICA
  Fisica.init(this);
  world = new FWorld();
  world.setEdges();

  // load our image
  snowflake1 = loadImage("snowflake.png");
  snowflake2 = loadImage("snowflake2.png");
  snowflake3 = loadImage("snowflake3.png");  

  snowflake1.resize(50, 50);
  snowflake2.resize(40, 40);
  snowflake3.resize(60, 60);
  
    minim = new Minim(this);
  song = minim.loadFile("jingleBells.mp3");
  song.play();
}


void draw()
{

  if (state == 0) {
    background(255);
    imageMode(CENTER);
    image(banner, 300, 250);
    if (mousePressed)
      state = 1;
  } else if (state == 1) {

    if (video.available())
    {
      video.read();
      video.loadPixels();
    }

    for (int x = 0; x < video.width; x++)
    {
      for (int y = 0; y < video.height; y++)
      {
        int location = x + y*video.width;  
        float b = brightness(video.pixels[location]);
        video.pixels[location] = color(b, b, b);
      }
    }

    video.updatePixels();
    imageMode(CORNER);
    image(video, 0, 0);



    for (int i = 0; i < theSnowflakes.size (); i++)
    {
      Snowflake temp = theSnowflakes.get(i);
      temp.move();
      temp.display();
    }

    //FISICA
    world.step();
    world.draw();
  }
}


void mousePressed()
//randomly select which snowflake to draw
{
  float chance = random(0, 100);
  if (chance < 33)
  {
    FBox myBox = new FBox(random(10, 30), random(10, 30) );
    myBox.setPosition(mouseX, mouseY);
    myBox.setRotation(random(TWO_PI));
    //myBox.setVelocity(0, 0);
    myBox.attachImage(snowflake1);
    world.add(myBox);
  } else if (chance < 66)
  {
    FBox myBox = new FBox(random(10, 30), random(10, 30) );
    myBox.setPosition(mouseX, mouseY);
    myBox.setRotation(random(TWO_PI));
    //myBox.setVelocity(0, 0);
    myBox.attachImage(snowflake2);
    world.add(myBox);
  } else
  {
    FBox myBox = new FBox(random(10, 30), random(10, 30) );
    myBox.setPosition(mouseX, mouseY);
    myBox.setRotation(random(TWO_PI));
    //myBox.setVelocity(0, 0);
    myBox.attachImage(snowflake3);
    world.add(myBox);
  }
}

