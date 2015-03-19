class Blocker {

  float rad;
  float angle;
  float angleLast;
  float angleWidth;
  float bonusPadding;
  float speed;
  float activeSpeed;
  color clr;

  Blocker () {
    rad = 250;
    angle = PI/2 + PI;
    angleLast = angle;
    angleWidth = PI/4;
    speed = 0;
    activeSpeed = 0;
    clr = color(255, 120, 0);
    bonusPadding = 0;
  }

  void display() {

    stroke(30);
    noFill();
    strokeWeight(5);
    ellipse(0, 0, 505, 505);
    strokeWeight(1);

    noStroke();
    fill(clr);

    float minRad = angle;
    float maxRad = angle+angleWidth;

    float r;

    beginShape();
    int steps = 30;
    for (int i=0; i<=steps; i++) {
      r = minRad + float(i)/float(steps)*angleWidth;
      vertex(cos(r)*rad, sin(r)*rad);
    }
    for ( int i=steps; i>=0; i--) {
      r = minRad + float(i)/float(steps)*angleWidth;
      vertex(cos(r)*(rad+5), sin(r)*(rad+5));
    }
    endShape(CLOSE);  

    fill(50, 100, 200);
    ellipse(cos(minRad-bonusPadding*2)*(rad+2.5), sin(minRad-bonusPadding*2)*(rad+2.5), 5, 5);
    ellipse(cos(maxRad+bonusPadding*2)*(rad+2.5), sin(maxRad+bonusPadding*2)*(rad+2.5), 5, 5);
  }

  void reset() {
    angleWidth = PI/4;
  }

  void update() {
    activeSpeed += (speed - activeSpeed) * .3;
    //activeSpeed = speed;

    //angle += activeSpeed;

    angleLast = angle;
    angle = map(mouseX, 0, width, PI, TWO_PI);

    float angleDif = abs(angleLast-angle);
    float bonusPaddingTarg = 0;
    if (angleDif > 0) bonusPaddingTarg = .07;
    bonusPadding += (bonusPaddingTarg - bonusPadding) * .2;

    if (angle > TWO_PI - angleWidth) angle = TWO_PI - angleWidth;
    if (angle < PI) angle = PI;
  }

  void reduceBlocker() {
    angleWidth -= .01; 
    angle += .005;
    //println("move speed:"+speed);
  }
};

