/* 
   Radial Pong Prototype
   Pete Hawkes
   2012
*/

boolean drawing;

Circle circle;
Blocker blocker;

void setup() {
  size(540, 960);
  smooth();
  noStroke();
  circle = new Circle();
  blocker = new Blocker();
}


void draw() {

  background(0);

  circle.update();
  blocker.update();
  hitCheck();

  pushMatrix();
  translate(width/2, height/2);
  drawUnderBoard();
  circle.display();  
  blocker.display();
  drawOverBoard();
  popMatrix();
}

void drawOverBoard() {

  // cover
  noStroke();
  fill(0, 100);
  rect(-width/2, 0, width, height/2);

  // line
  stroke(100);
  line(-width/2, 0, width/2, 0);
}

void drawUnderBoard() {
  // home
  noStroke();
  fill(255, 0, 0);
  ellipse(0, 0, 10, 10);
}


void hitCheck() {
  //
  //println(circle.rad +":"+(blocker.rad + circle.speed));
  float bonusPadding = blocker.speed*2;

  float maxRange = blocker.rad + circle.speed*2;
  if (blocker.rad + 5 > maxRange) maxRange = blocker.rad + 5;
  if (circle.rad > blocker.rad && circle.rad < maxRange) {
    // in range, check for angle
    if (circle.angle > blocker.angle - blocker.bonusPadding && circle.angle < blocker.angle + blocker.angleWidth + blocker.bonusPadding) {
      if (circle.speed > 0 ) { 
        //println("hit: "+ circle.rad);
        circle.speed *= -1;
        circle.rad = blocker.rad;
        blocker.reduceBlocker();
      }
    }
  }
}

void reset() {
  println("RESET");
  circle.reset();
  blocker.reset();
}

void mousePressed() {
  drawing = false;
}

void mouseReleased() {
  drawing = true;
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      //blocker.speed = -(.03 + abs(circle.speed)/200);
      blocker.speed = -.05;
    }
    if (keyCode == RIGHT) {
      blocker.speed = (.03 + abs(circle.speed)/200);
      blocker.speed = .05;
    }
  }
  if (key == ENTER) {
    reset();
  }
}

void keyReleased() {
  blocker.speed = 0;
}

