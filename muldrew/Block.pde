class Block{
  // Block class
  
  
  int x;
  int y;
  int w;
  color c;
 
  Block(int tempX, int tempY, int tempWidth) {
    // Block position and size
    x = tempX;
    y = tempY;
    w = tempWidth;
   
   // Randomly assign block color
    float crand = random(1);
   
    if (crand < 0.5) {
      c = 20;
    } else {
      c = 235;
    }
  }

  void render() {
    // Draw the block on the screen at position with given color and a little transparency
    stroke(c,c,c,245);
    fill(c,c,c,245);
    rect(x,y,w,w);
  }
  
 
}
