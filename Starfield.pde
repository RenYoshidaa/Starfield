Particle[] particles; 
int numParticles = 500;
 
void setup() {
  size(800, 600);
background(0);
particles = new Particle[numParticles];

  for (int i = 0; i < particles.length; i++) {
    if (i == 0) {
      particles[i] = new OddballParticle(width/2, height/2);
    } else {
      particles[i] = new Particle(width/2, height/2);
    }
  }
}

void draw() {
  fill(0, 30);
rect(0, 0, width, height);
  for (int i = 0; i < particles.length; i++) {
    particles[i].move();
    particles[i].show();
  }
}

class Particle {
  double x, y, angle, speed;
  color c;

  Particle(double x_, double y_) {
    x = x_;
    y = y_;
    angle = (Math.random()*TWO_PI);
    speed = (Math.random()*4)+1;
int r = (int)(Math.random() * 256);
    int g = (int)(Math.random() * 256);
    int b = (int)(Math.random() * 256);
    c = color(r, g, b);  }

  void move() {
    x += cos((float)angle) * speed;
    y += sin((float)angle) * speed;

    if (x < 0) x += width;
    if (x > width) x -= width;
    if (y < 0) y += height;
    if (y > height) y -= height;
  }

  void show() {
    noStroke();
    fill(c);
    ellipse((float)x, (float)y, 5, 5);
  }
}
class OddballParticle extends Particle {
  OddballParticle(double x_, double y_) {
    super(x_, y_);
    c = color(255,255,255); 
    speed = 5; 
  }

  void move() {
    angle += random(-0.3, 0.3);
    x += cos((float)angle) * speed;
    y += sin((float)angle) * speed;

    if (x < 0 || x > width) angle = PI - angle;
    if (y < 0 || y > height) angle = -angle;
  }

  void show() {
    noStroke();
    fill(c, 100);
    ellipse((float)x, (float)y, 15, 15);
  }
}
