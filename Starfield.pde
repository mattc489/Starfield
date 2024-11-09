class Particle {
  double myX, myY, myAngle, mySpeed;
  int myColor;
 Particle() {
    myX = 340;
    myY = 240;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10;
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }
void show() {
    fill(myColor);
    ellipse((int) myX + 70, (int) myY + 50, 5, 5); /
  }
void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  }
}
class OddballParticle extends Particle {
  float shakeAmount = 5.0;
  float shakeSpeed = 0.05;

  OddballParticle() {
    super();
    myColor = color(255, 0, 0);
    mySpeed = Math.random() * 5;
  }
  @Override
    void show() {
    myX = 300 + shakeAmount * (float)Math.sin(shakeSpeed * millis());
    myY = 250 + shakeAmount * (float)Math.cos(shakeSpeed * millis());
    fill(myColor);
    ellipse((int) myX + 70, (int) myY + 50, 50, 30);
  }
}
Particle[] bob = new Particle[1000];
void setup() {
  size(600, 600);
  for (int i = 0; i < bob.length; i++) {
    if (i == 0) {
      bob[i] = new OddballParticle();
    } 
else {
      bob[i] = new Particle();
    }
  }
}

void draw() {
  background(0, 0, 0);
  for (int i = 0; i < bob.length; i++) {
    bob[i].move();
    bob[i].show();
  }
}
