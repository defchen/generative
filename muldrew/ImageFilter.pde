
class ImageFilter {
  // Image filter class
  
  
  int numFilters = int(random(0, 10));

  void applyFilters() {
    // For N in numFilters, apply various filters randomly with the given parameters
    
    // Randomly switch between erode and dilate filters
    for (int idx = 0; idx < numFilters; idx++) {
      if (random(1) < 0.5) {
        filter(ERODE);
      } else {
        filter(DILATE);
      }

      // Posterize filter
      if (random(1) < 0.25) {
        filter(POSTERIZE, 250);
      }
    }
  }
}
