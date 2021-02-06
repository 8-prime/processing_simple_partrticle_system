

float gravity = .1;
int parts_per_cycle = 7;
ArrayList<Particle> parts = new ArrayList<Particle>();//List to keep track of all the particles

void setup() {
  noCursor();//Hide the cursor
  size(2560, 1440);
}


void draw() {
  background(0);
  //add parts_per_cycle amount of particles at mouse position
  for (int i = 0; i < parts_per_cycle; i++) {
    parts.add(new Particle(mouseX, mouseY));
  }
  //for all particles update position and remove if no longer in canvas, otherwise draw particle
  for (int i = 0; i < parts.size(); i++) {
    Particle p = parts.get(i);
    p.update(gravity);
    if (p.isOutOfScreen(width, height)) {
      parts.remove(i);
    }else{
      p.draw();  
    }
  }
}
