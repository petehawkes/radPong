class Circle {

  float rad;
  float angle;
  float speed;
  color clr;
  boolean hit;
  float pi_padding;
  int score;
  float minRange, maxRange;


  Circle () {
    rad = 0;
    clr = color(255);
    hit = false;
    pi_padding = PI/20;
    angle = random(PI+pi_padding, TWO_PI-pi_padding);
    speed = 2;
    score = 0;
    minRange = angle + -PI/4+(speed/20);
    maxRange = angle + PI/4-(speed/20);
  }

  void display() {

    pushMatrix();
    translate(cos(angle)*rad, sin(angle)*rad);
    noStroke();
    fill(clr);
    ellipse(0, 0, 5, 5); 
    
    popMatrix();
    
    for (int i=0; i<200; i+=10) {
      fill(150);
        ellipse(cos(minRange)*i, sin(minRange)*i, 1, 1);
        ellipse(cos(maxRange)*i, sin(maxRange)*i, 1, 1); 
    }
    
  }

  void update() {

    rad += speed;
    if (rad < 0) {
      hit();
    }
    
  }
  
  void hit() {
      rad = 0;
      speed *= -1;
      speed += .2;
      
      
      angle = random(minRange, maxRange);
      
      while (angle > TWO_PI - pi_padding) angle = random(minRange, maxRange);
      while (angle < PI + pi_padding) angle = random(minRange, maxRange);
      score++;
      
      minRange = angle + -PI/3+(speed/20);
      maxRange = angle + PI/3-(speed/20);
      println("score:"+score); 
  }
  
  void reset() {
     speed = 2;
     score = 0;
     hit();
  }
  
};


