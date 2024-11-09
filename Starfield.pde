class Particle{ 
  double myX,myY,myAngle,mySpeed;
  int myColor;
  
 Particle() {
  myX = 340;
  myY = 240;
  myAngle = Math.random()*2*Math.PI;
  mySpeed = Math.random()*10;
  myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
 }//end of particle constructor
 
 void show(){
   fill(myColor);
   ellipse((int) myX + 70,(int)myY + 50, 5,5);
  }// end of show
  
  void move() {
  myX = myX + Math.cos(myAngle)  * mySpeed;
  myY = myY + Math.sin(myAngle)  * mySpeed;

  
  }// end of move
} // end of particle class

 Particle [] bob = new Particle[1000];
  void setup() {
  size( 600,600);
  for (int i = 0; i < bob.length; i++)
    bob[i] = new Particle();
  }
  void draw() {
  background( 0,0,0);
  for (int i = 0; i < bob.length; i++){
         bob[i].show(); 
         bob[i].move(); 
  }
}
