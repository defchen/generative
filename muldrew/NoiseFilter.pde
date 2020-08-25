class NoiseFilter {
  // Noise filter class


  float noiseScale = random(5.0, 25.0);
  float noiseScaleGrid = random(1.0, 5.0);
  float increment = 0.02;

  void scanlines() {
    // Add scanlines to (random) columns and rows
    for (int x = border*spacing; x < width - border*spacing; x = x + spacing) {
      if (random(1) < 0.25) {

        for (int col = x; col < x + spacing + spacing; col++) {
          for (int y = border*spacing; y < height - border*spacing; y++) {

            int loc = col+y*width;

            float grey = brightness(pixels[loc]) - random(1)*noiseScaleGrid;

            pixels[loc] = color(grey);
          }
        }
      }
    }

    for (int y = border*spacing; y < height - border*spacing; y = y + spacing) {
      if (random(1) < 0.25) {

        for (int row = y; row < y + spacing + spacing; row++) {
          for (int x = border*spacing; x < width - border*spacing; x++) {

            int loc = x+row*width;

            float grey = brightness(pixels[loc]) - random(1)*noiseScaleGrid;

            pixels[loc] = color(grey);
          }
        }
      }
    }
  }

  void perlin() {
    // Add perlin 2D noise to the sketch by sampling from Processing's noise() function with an incremented x/y offset
    float xoff = 0.0; // Start xoff at 0

    for (int x = border*spacing; x < width - border*spacing; x++) {
      xoff += increment;
      float yoff = 0.0;   // For every xoff, start yoff at 0

      for (int y = border*spacing; y < height - border*spacing; y++) {
        yoff += increment;
        int loc = x+y*width;

        float noiseVal = noise(xoff, yoff);
        float grey = brightness(pixels[loc]) + noiseVal*noiseScale;

        pixels[loc] = color(grey);
      }
    }
  }
}
