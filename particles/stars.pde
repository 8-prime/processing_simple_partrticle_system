class Stars {
  int width;
  int height;
  int numStars;
  float speed;
  ArrayList<Star> stars;

  Stars(int w, int h, int numStars, float speed) {
    this.width = w;
    this.height = h;
    this.numStars = numStars;
    this.speed = speed;
    stars = new ArrayList<Star>();
  }


  //wrapper method that can be called to do everything to do with stars in the background
  void drawStars() {
    //generate new stars
    genStars();
    //check for stars no longer on screen
    removeOldStars();
    //display stars
    displayStars();
  }


  void genStars() {
    for (int i = 0; i < numStars; i++) {
      stars.add(new Star(width, random(3, height), speed));
    }
  }

  void removeOldStars() {
    for (int i = 0; i < stars.size(); i++) {
      if (stars.get(i).notInScreen()) {
        stars.remove(i);
      }
    }
  }

  void displayStars() {
    for (Star s : stars) {
      s.moveStar();
      s.draw();
    }
  }
}


class Star {
  float x;
  float y;
  float speed;

  Star(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  boolean notInScreen() {
    return x + speed < 0;
  }

  void moveStar() {
    x -= speed;
  }

  void draw() {
    strokeWeight(2);
    stroke(200);
    line(x, y, x+speed, y);
  }
}
