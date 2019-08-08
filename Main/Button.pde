class Button {
  int x, y, l, w;
  
  
  Button(int x, int y, int l, int w) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.w = w;
  }
  
  void display() {
    rectMode(CENTER);
    fill(255);
    stroke(0);
    
    rect(x,y,l,w);
  }
  
  
  boolean pressed() {
    // pre: This function will be called only when mouse is pressed
    
    // ***Check if mouse is inside the box
    if(mouseX <= x + l/2 && mouseX >= x - l/2 && mouseY <= y + w/2 && mouseY >= y - w/2) {
      return true;  
    } else {
      return false;  
    }
  }
}
