ArrayList<Particle> m; //The Particles themselves
 
int count = 100; //How many particles to spawn
 
float spdLimit = 200; //The limit of each particle's speed in pixels per second
 
final static int SUNSET = 1;
final static int ICE = 2;
final static int FIRE = 3;
 
final static int THEME = SUNSET;
 
void setup() { 
  size(640, 480);
  colorMode(HSB, 360, 100, 100);
  m = new ArrayList<Particle>();
  for (int i = 0; i<count; i++) {
    m.add(new Particle());
  }
  mouseX = width/2;
  mouseY = height/2;
}
 
void draw() {
  noStroke();
  fill(0, 40);
  rect(-1, -1, width + 1, height + 1);
  fill(50, 50, 255);
  for (Particle a : m) {
    a.update();
    a.draw();
  }
}
 
class Particle {
 
  PVector prev, pos, mouse = new PVector(), spd, acc;
  color col;
  float turnFactor = random(3, 10);
 
  public Particle() {
    pos = new PVector(random(width), random(height));
    prev = new PVector(pos.x, pos.y);
    spd = new PVector(random(2), random(2));
    acc = new PVector();
 
    switch(THEME) {
        case SUNSET:
            col = color(random(320, 420) % 360, 90, 100);
            break;
        case ICE:
            col = color(random(155, 210), random(40, 100), 100);
            break;
        case FIRE:
            col = color(random(45), 90, 100);
            break;
        default:
            col = color(random(360), 90, 100);
            break;
    }
 
  }
 
  void update() {
    prev = new PVector(pos.x, pos.y);
    if (pos.x > width || pos.x < 0) {
      spd.x *= -0.9;
    }
    if (pos.y < 0 || pos.y > height ) {
      spd.y *= -0.9;
    }
    mouse.set(mouseX, mouseY);
    PVector attraction = new PVector(mouse.x, mouse.y);
    attraction.sub(pos);
    acc.set(attraction);
    acc.normalize();
    acc.div(turnFactor);
    spd.add(acc);
    spd.limit(spdLimit * (1f/60));
    pos.add(spd);
  }
 
  void draw() {
 
    //noStroke();
    //fill(col);
    //ellipse(pos.x, pos.y, size, size);
    //ellipse(pos.x, pos.y, size, size);
    stroke(col);
    strokeWeight(1);
    line(prev.x, prev.y, pos.x, pos.y);
  }
}