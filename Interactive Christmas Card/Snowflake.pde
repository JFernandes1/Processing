class Snowflake
{
  //position
  float x, y;

  float angle = 0;

  // perlin noise index
  float perlinIndex;

  // size
  float mySize = random(10, 50);

  Snowflake()
  {
    x = random(50, width-50);
    y = random(-500, 0);

    perlinIndex = random(0, 100000);
  }

  void move()
  {
    y += 2;
    if (y > height)
    {
      y = random(-200, 0);
      x = random(50, width-50);
    }
  }

  void display()
  {
    float r = noise(perlinIndex);
    float xMovement = map(r, 0, 1, -2, 2);
    x += xMovement;
    x = constrain(x, 0, width-50);
    y += 1;
    if (y > height)
    {
      y = -50;
    }
    perlinIndex += 0.01;

    pushMatrix();
    translate(x, y);
    rotate( radians(angle) );
    image(SnowflakeImage, 0, 0, mySize, mySize);
    popMatrix();
    angle += 1.5;
  }
  void checkHit(float hx, float hy)
  {
    if (dist(hx, hy, x, y) < 50)
    {
      y = random(-200, 0);
      x = random(50, width-50);
    }
  }
}

