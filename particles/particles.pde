

float gravity = 0;
int parts_per_cycle = 7;
ArrayList<Particle> parts = new ArrayList<Particle>();//List to keep track of all the particles
Rocket player;
Stars zoomies;


void setup() {
  noCursor();//Hide the cursor
  size(1200, 800);
  player = new Rocket(300, 400, 7);
  zoomies = new Stars(width, height, 2, 15);
}


void draw() {
  background(0);
  zoomies.drawStars();
  handleParticles();
  player.move();
  player.draw();
}

void keyPressed() {
  if (key == 'w') {
    player.up();
  }
  if (key == 's') {
    player.down();
  }
}

void keyReleased() {
  player.stop();
}


//handles spawning and display of the particles
void handleParticles() {
  //add parts_per_cycle amount of particles at mouse position
  for (int i = 0; i < parts_per_cycle; i++) {
    parts.add(new Particle(player.getX(), player.getY()));
  }
  //for all particles update position and remove if no longer in canvas, otherwise draw particle
  for (int i = 0; i < parts.size(); i++) {
    Particle p = parts.get(i);
    p.update(gravity);
    if (p.isOutOfScreen(width, height)) {
      parts.remove(i);
    } else {
      p.draw();
    }
  }
}
