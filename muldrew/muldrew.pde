// Muldrew 
// Generative art piece inspired by the cover for the Shabason / Gunning album "Muldrew", designed by Alan Briand.

// Variables
Block b1;
Canvas canvas;
NoiseFilter nf;
ImageFilter imgF;
PImage img;

int spacing = 5;
int border = 8;

int blockWidth = 5*spacing;
int maxBlocks = 10;

void setup() {
  // Set up sketch
  size(1200, 1200);
  background(70);
  noLoop();
}

void draw() {
  // Set up canvas 
  canvas = new Canvas();
  canvas.frame();


  // Add chains
  if (random(1) < 0.5) {
    // Chains are oriented horizontally
    for (int x = (border*spacing + 2*blockWidth); x < width - (2*border*spacing - maxBlocks*blockWidth - 2*blockWidth); x = x + (maxBlocks*blockWidth + 5*blockWidth)) {
      for (int y = (border*spacing + 2*blockWidth); y < height - (2*border*spacing + 2*blockWidth); y = y + int(2*blockWidth)) {

        if (random(1) > 0.5) {
          int chainLength = int(random(1, 10));
          
          if (random(1) < 0.5) {
            // Start on left
            for (int b = 0; b < chainLength; b++) {
              b1 = new Block(x + b*blockWidth, y, blockWidth);
              b1.render();
            }
          } else {
            // Start on right
            for (int b = 0; b < chainLength; b++) {
              b1 = new Block(x + maxBlocks*blockWidth - b*blockWidth, y, blockWidth);
              b1.render();
            }
          }
        }
      }
    }
  } else {
    // Chains are oriented vertically
    for (int y = (border*spacing + 2*blockWidth); y < height - (2*border*spacing - maxBlocks*blockWidth - 2*blockWidth); y = y + (maxBlocks*blockWidth + 5*blockWidth)) {
      for (int x = (border*spacing + 2*blockWidth); x < width - (2*border*spacing + 2*blockWidth); x = x + int(2*blockWidth)) {

        if (random(1) > 0.5) {
          int chainLength = int(random(1, 10));

          if (random(1) < 0.5) {
            // Start on top
            for (int b = 0; b < chainLength; b++) {
              b1 = new Block(x, y+b*blockWidth, blockWidth);
              b1.render();
            }
          } else {
            // Start on bottom
            for (int b = 0; b < chainLength; b++) {
              b1 = new Block(x, y+maxBlocks*blockWidth - b*blockWidth, blockWidth);
              b1.render();
            }
          }
        }
      }
    }
  }

  // Add noise
  loadPixels();
  nf = new NoiseFilter();
  nf.scanlines();
  nf.perlin();
  updatePixels();

  // Save temporary output
  save("muldrew.png");
  img = loadImage("muldrew.png");
  image(img, 0, 0);

  // Apply image filters
  imgF = new ImageFilter();
  imgF.applyFilters();

  // Save output
  save("muldrew.png");
}
