// This sketch does not work well in JSMode: 3000 vehicles/particles at 12 FPS (on my not very fast laptop)
// Much better in  Java however: 20,000 particles at  35+ FPS
// Tweak of Exercise_6_08_FlowField3DNoise,
// from 'The Nature of Code' by Daniel Shiffman.
// flow field, grayscale, ArrayList, sin(), cos()
// Craig Reynolds, vehicle, noise(), particle system
 
FlowField flowfield;
ArrayList<Vehicle> vehicles; // or 'particles' if you like
 
void setup() {
  size(940, 78);
 
  flowfield = new FlowField(25);
  vehicles = new ArrayList<Vehicle>();
  for (int i = 0; i < 3000; i++) { // 20,000 in Java // 3000 in Js /////////////////////
    vehicles.add(new Vehicle(new PVector(random(width),
    random(height)), random(2, 5), random(0.1, .5)));
  }
}
 
void draw() {
  frameRate(40);
  //println(frameRate);
  fill(0, 30);
  noStroke();
  rect(0, 0, width, height);
  fill(255);
   
  flowfield.update();
 
  for (Vehicle v : vehicles) {
    v.follow(flowfield);
    v.run();
  }
}
 
 
 
class FlowField {
  PVector[][] field;
  int cols, rows;
  int resolution; // How large is each "cell" of the flow field
  float zoff = 0.0; // 3rd dimension of noise
 
  FlowField(int r) {
    resolution = r;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    update();
  }
 
  void update() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI);
        // Make a vector from an angle
        field[i][j] = new PVector(cos(theta), sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
    zoff += 0.01;
  }
 
  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }
}
 
 
class Vehicle {
 
  PVector location;
  PVector velocity;
  //PVector acceleration;
  float r;
  float maxforce;  
  float maxspeed;   
 
  Vehicle(PVector l, float ms, float mf) {
    location = l.get();
    r = 3.0;
    maxspeed = ms;
    maxforce = mf;
    //acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
  }
 
  public void run() {
    update();
    borders();
    display();
  }
 
 
  // Implementing Reynolds' flow field following algorithm
  // http://www.red3d.com/cwr/steer/FlowFollow.html
  void follow(FlowField flow) {
    PVector desired = flow.lookup(location);
    desired.mult(maxspeed);
    //PVector steer = PVector.sub(desired, velocity);
    desired.sub(velocity); // desired is now 'steer'
    desired.limit(maxforce);
    //acceleration.add(desired);
    velocity.add(desired);
    //applyForce(desired);
    //steer.limit(maxforce); 
    //applyForce(steer);
  }
 
  //void applyForce(PVector force) {
    //acceleration.add(force);
 // }
 
 
  void update() {
    //velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    //acceleration.mult(0);
  }
 
  void display() {
    // rect seems to be (a lot) more efficient than point or ellipse....
    rect(location.x, location.y, 1, 1);
  }
 
 
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
}