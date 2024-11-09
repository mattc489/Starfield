class Particle {
  double myX, myY, myAngle, mySpeed;
  int myColor;

  // Constructor for Particle
  Particle() {
    myX = 340;
    myY = 240;
    myAngle = Math.random() * 2 * Math.PI;
    mySpeed = Math.random() * 10;
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }

  // Show the particle (draw it)
  void show() {
    fill(myColor);
    ellipse((int) myX + 70, (int) myY + 50, 5, 5); // Draw small particles
  }

  // Move the particle based on its speed and angle
  void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
  }
}

// OddballParticle class that extends Particle
class OddballParticle extends Particle {
  float shakeAmount = 5.0; // How much the oddball shakes
  float shakeSpeed = 0.05; // Speed of shaking

  // Constructor for OddballParticle
  OddballParticle() {
    super(); // Call the parent constructor (Particle)
    myColor = color(255, 0, 0);  // Give OddballParticle a fixed red color
    mySpeed = Math.random() * 5;  // Oddball particles have slower speed
  }

  // Override the show method to make the oddball particle look like a giant ellipse
  @Override
  void show() {
    // Make the oddball particle shake in the center of the screen
    myX = 300 + shakeAmount * (float)Math.sin(shakeSpeed * millis());  // Shake in the X direction
    myY = 250 + shakeAmount * (float)Math.cos(shakeSpeed * millis());  // Shake in the Y direction
    
    fill(myColor);
    // Draw a giant ellipse, making it much larger than normal particles
    ellipse((int) myX + 70, (int) myY + 50, 50, 30); // Larger ellipse (50x30 pixels)
  }

  // Override move method (optional for shake, but we could leave it as-is for the sake of movement)
  @Override
  void move() {
    // Oddball doesn't need to move randomly, we control it via shaking instead.
  }
}

Particle[] bob = new Particle[1000];

void setup() {
  size(600, 600);
  
  // Create an array of particles
  for (int i = 0; i < bob.length; i++) {
    if (i == 0) {
      bob[i] = new OddballParticle(); // First element is an OddballParticle
    } else {
      bob[i] = new Particle(); // The rest are normal Particles
    }
  }
}

void draw() {
  background(0, 0, 0); // Black background
  
  // Loop through all particles and move/show them
  for (int i = 0; i < bob.length; i++) {
    bob[i].move();  // Move the particle
    bob[i].show();  // Show the particle
  }
}
