class Rocket {
  float x;
  float y;
  float vY;
  PImage img;
  float speed;

  Rocket(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.vY = 0;
    this.speed = speed;
    img = loadImage("t_rocket.png");
    img.resize(img.width/10, img.height/10);
  }


  void draw() {
    image(img, x-70, y-(img.height/2));
  }

  void move() {
    if (y < 0 || y > height) {
      vY = -vY;
    }
    y += vY;
  }  

  void up() {
    vY = -speed;
  }

  void down() {
    vY = speed;
  }

  void stop() {
    vY = 0;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
}
