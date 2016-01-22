Mole [] theMoles = new Mole[9];
//cookiemonster [] theCMS = new cookiemonster[9];
PImage cookie;
PImage cookieBitten;

void setup()
{
  size(550, 550);
  theMoles[0] = new Mole(90+25, 75);
  theMoles[1] = new Mole(250+25, 75);
  theMoles[2] = new Mole(410+25, 75);

  theMoles[3] = new Mole(90+25, 235);
  theMoles[4] = new Mole(250+25, 235);
  theMoles[5] = new Mole(410+25, 235);

  theMoles[6] = new Mole(90+25, 395);
  theMoles[7] = new Mole(250+25, 395);
  theMoles[8] = new Mole(410+25, 395);

  /* theCMS[0] = new cookiemonster(90+25, 75);
   theCMS[1] = new cookiemonster(250+25, 75);
   theCMS[2] = new cookiemonster(410+25, 75);
   
   theCMS[3] = new cookiemonster(90+25, 235);
   theCMS[4] = new cookiemonster(250+25, 235);
   theCMS[5] = new cookiemonster(410+25, 235);
   
   theCMS[6] = new cookiemonster(90+25, 395);
   theCMS[7] = new cookiemonster(250+25, 395);
   theCMS[8] = new cookiemonster(410+25, 395);*/
  
  //cursor
  noCursor();
  cookie = loadImage("cookie.png");
  cookieBitten = loadImage("cookieBitten.png");
  
   // set up Minim  
  minim = new Minim(this);

  // load in our audio file
  player = minim.loadFile("boing.mp3");
}

void draw()
{
  background(255);

  theMoles[0].display();
  theMoles[1].display();
  theMoles[2].display();
  theMoles[3].display();
  theMoles[4].display();
  theMoles[5].display();
  theMoles[6].display();
  theMoles[7].display();
  theMoles[8].display();



  if (mousePressed) {
    image(cookieBitten, mouseX, mouseY, 50, 50);
  } else {
    image(cookie, mouseX, mouseY, 50, 50);
  }


  /*theCMS[0].display();
   theCMS[1].display();
   theCMS[2].display();
   theCMS[3].display();
   theCMS[4].display();
   theCMS[5].display();
   theCMS[6].display();
   theCMS[7].display();
   theCMS[8].display();*/


  if (mousePressed) {
    theMoles[0].checkHit();
    theMoles[1].checkHit();
    theMoles[2].checkHit();
    theMoles[3].checkHit();
    theMoles[4].checkHit();
    theMoles[5].checkHit();
    theMoles[6].checkHit();
    theMoles[7].checkHit();
    theMoles[8].checkHit();
  }
}

void sound()
{
  if(mousePressed){
  player.pause();
  player.rewind();
  player.play();
  }
}

