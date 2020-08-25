class Tree {
  // Tree object class 
  
  // Shape parameters
  float len;
  float branchLen;
  float angle;

  boolean orientation;
  float mult;

  color drawColor;

  // Constructor --> inputs length and whether it points up or down
  Tree(float len_, boolean orientation_) {
    len = len_;
    orientation = orientation_;

    branch(len);
  }
  
  // Recursive branch function
  // Each tree is made up of many braches 
  void branch(float len) {
    
    // Branch pointing up or down
    if (orientation) {
      mult = 1;
      drawColor = topColor;
    } else {
      mult = -1;
      drawColor = bottomColor;
    }

    // Branch color
    stroke(drawColor, 51);
    strokeWeight(0.04*len);
    strokeWeight(1);

    // Draw branch and translate to the end of the branch to draw the next branch
    line(0, 0, 0, mult*len);
    translate(0, mult*len);


    // Stop condition
    if (len > 4) {
      
      // Randomly sample angle of branch and recursively call it until it becomes too short
      angle = noise(xoff)*PI/4;
      xoff = xoff + 0.1;
      push();
      rotate(angle);
      
      // Randomly decide not to draw some branches to give it a more natural look (or set to 1 to draw all branches)
      if (random(1) < 0.75) {
        branchLen = random(len*0.5, len*0.75);
        branch(branchLen);
      }
      pop();
      
      push();
      angle = noise(xoff)*PI/4;
      xoff = xoff + 0.1;
      rotate(-angle);
      if (random(1) < 0.75) {
        branchLen = random(len*0.5, len*0.75);
        branch(branchLen);
      }
      pop();
    }
  }
}
