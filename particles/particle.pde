class Particle{
   float velX;//Velocity on the X axis
   float velY;//Velocity on the Y axis
   float x;//X Position
   float y;//Y POsition
   float size;//Size of the particle
   color col;//Color of the particle
   
   Particle(float x,float y){
       this.velX = random(-5,5);//Random speed on the X axis for spread of particles
       this.velY = random(-10,-30);//Random speed on the Y axis 
       this.x = x;
       this.y = y;
       this.size = random(5,10);//Random size of the particle
       col = color(random(0,255),random(0,255),random(0,255))//random color
   }
   
   void update(float gravity){
       this.x += velX;//Move on the X axis in a constant manner
       velY += gravity;//Affecting the velocity on the Y axis with the gravity to have particles fall
       this.y += velY;//Move on the Y axis according to its velocity
       size -= 0.05;//Reduce size of particle to give effect of the particle moving away
   }
   
   //If particle is out of the screen return true
   boolean isOutOfScreen(int w, int h){
     return x < 0 - size/2 || y < 0 - size/2 || x > w + size/2 || y > h + size/2;
   }
   
   //Draw the particle
   void draw(){
       fill(col);
       ellipse(x,y,size,size);
   }
}
