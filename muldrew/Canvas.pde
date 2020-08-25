class Canvas {
  // Canvas class


  void gridLines() {
    // Draw grid lines on canvas
    for (int x = 0; x < width; x = x + 2*spacing) {
      for (int y = 0; y < width; y = y + 2*spacing) {
        stroke(60);
        strokeWeight(0.5);
        line(x, 0, x, height);
        line(0, y, width, y);
      }
    }
  }

  void frame() {
    // Draw frame around canvas
    stroke(0);
    fill(0);
    rect(0, 0, width, border*spacing);
    rect(0, height-border*spacing, width, border*spacing);
    rect(0, 0, border*spacing, height);
    rect(width - border*spacing, 0, border*spacing, height);
  }
}
