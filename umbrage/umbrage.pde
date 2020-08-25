// Colors 
color bottomColor = color(255-11);
color topColor = color(11);

// Starting tree positions and orientation
float startLen;
float startX, startY;
boolean orientation;
float mult;

// Noise parameters
float startOff = 0.0;
float xoff = 0.0;
float rotAngle;

// Number of tree objects
int numTrees;
Tree tree;


// Setup
void setup() {
  size(1000, 1000);
  background(bottomColor);
  fill(topColor);
  rect(0, 0, width, height/2);
}


void draw() {

  noLoop();
  
  numTrees = 1000;


  // Draw downward facing trees
  for (int n=0; n<numTrees; n++) {
     orientation = true;

    
    // Starting horizontal tree position, orientation, and trunk length
    startX = noise(startOff)*width;
    startOff = startOff + 1.0;
    startY = height/2;
    startLen = random(height/6);
    rotAngle = random(-PI/16, PI /16);
    
    push();
    translate(startX, startY);
    rotate(rotAngle);
    tree = new Tree(startLen, orientation);
    rotate(rotAngle);
    pop();
  }
  
  // Draw upward facing trees
  for (int n=0; n<numTrees; n++) {
     orientation = false;

    // Starting horizontal tree position, orientation, and trunk length
    startX = noise(startOff)*width;
    startOff = startOff + 1.0;
    startY = height/2;
    startLen = random(height/6);
    rotAngle = random(-PI/16, PI /16);
    
    push();
    translate(startX, startY);
    rotate(rotAngle);
    tree = new Tree(startLen, orientation);
    rotate(rotAngle);
    pop();
  }
  
  // Save output
  //save("umbrage.jpg");
}
