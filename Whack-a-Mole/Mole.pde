class Mole
{
  // position
  float xPos;
  float yPos;

  // artwork
  PImage up;
  PImage down;

  // state
  // 0 = down
  // 1 = up
  int state = 0;

  //score = number of times the mouse hits a mole
  int score = 0;

  // how many frames do we want to stay in each state?
  int timeToStayInState = (int )(Math. random() *5000);

  // how much time have we been in this state?
  int currentTimeInState = 0;

  // constructor
  Mole(float x, float y)
  {
    // store position
    xPos = x;
    yPos = y;

    // load artwork
    up = loadImage("up.png");
    down = loadImage("down.png");
  }

  // display
  void display()
  {
    // state 0 = down
    if (state == 0)
    {
      // draw the down artwork
      imageMode(CENTER);
      image(down, xPos, yPos, 250, 250);

      // increase the amount of time we have been in this state
      currentTimeInState += 1;

      // should we switch to the other state?
      if (currentTimeInState >= timeToStayInState)
      {
        // switch!
        state = 1;

        // reset timer
        currentTimeInState = 0;
      }
    }

    // state 1 = up
    if (state == 1)
    {
      // draw the down artwork
      imageMode(CENTER);
      image(up, xPos, yPos, 250, 250);

      // increase the amount of time we have been in this state
      currentTimeInState += (int)(Math. random() * 5);

      // should we switch to the other state?
      if (currentTimeInState >= timeToStayInState)
      {
        // switch!
        state = 0;

        // reset timer
        currentTimeInState = 0;
      }
    }
 fill(0);
    textSize(50);
    text("Score: " + score, 30, 30);
  }

  void checkHit()
  {
    if (dist(mouseX, mouseY, xPos, yPos) < 50)
      // reduce size
      state = 0;
    score = score +1;
  }
}

