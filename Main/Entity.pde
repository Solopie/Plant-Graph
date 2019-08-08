class Entity {
  
  int entityId;
  float x,y,l,w;
  String data;
  // Priority determines what goes on top of what (0 priority means priority 
  // has not been set
  int priority;
  boolean hidden;
  boolean allowCollision;
  
  Entity(int entityId, String data, int priority) {
    this.entityId = entityId;
    this.data = data;
    this.x = mouseX;
    this.y = mouseY;
    this.l = 50;
    this.w = 50;
    this.priority = priority;
    this.hidden = false;
    this.allowCollision = false;
    // calculatePosition();
  }
  
  boolean getAllowCollision() {
    return allowCollision;  
  }
  
  void display() {
    rectMode(CENTER);
    fill(255);
    rect(x,y,l,w);
    // Display priority in center of rectangle
    textAlign(CENTER);
    textSize(16);
    fill(0);
    text(priority, x, y);
  }
  
  // Find optimal position in accordance to rules applied
  void calculatePosition() {
    // Will determine where the entity will be automatically placed  
    // When we implement rules this will reposition the entity
    
    //this.x = width/2;
    //this.y = height/2;
  }
  
  // When entity is colliding then move next to
  boolean collision(Entity other) {
    if((this.x + this.l/2 >= other.x - other.l/2) && (this.y + this.w/2 >= other.y - other.w/2)) {
      // When current object is inside the left of other object and bottom is inside
      return true;
    }else if((this.x + this.l/2 >= other.x - other.l/2) && (this.y - this.w/2 <= other.y + other.w/2)) {
      // When current object is inside the left of other object and top is inside
      return true;
    } else if((this.x - this.l/2 <= other.x + other.l/2) && (this.y + this.w/2 >= other.y - other.w/2)) {
      // When cur object is inside the right of the other object and bottom is inside
      return true;  
    } else if((this.x - this.l/2 <= other.x + other.l/2) && (this.y - this.w/2 <= other.y + other.w/2)) {
      // When cur object is inside the right of the other object and top is inside
      return true;  
    } else if((this.y + this.w/2 > other.y - other.w/2) && (this.x + this.l/2 >= other.x - other.l/2)) {
      // When cur object is inside the bottom of the object and left is inside
      return true;
    } else if((this.y + this.w/2 > other.y - other.w/2) && (this.x - this.l/2 <= other.x + other.l/2)) {
      // When cur object is inside the bottom of the object and right is inside
      return true;
    } else if((this.y - this.w/2 < other.y + other.w/2) && (this.x + this.l/2 >= other.x - other.l/2)) {
      // When cur object is insde the top of the object and left is inside
      return true;
    } else if((this.y - this.w/2 < other.y + other.w/2) && (this.x - this.l/2 <= other.x + other.l/2)) {
      // When cur object is insde the top of the object and right is inside
      return true;
    } else if(this.x == other.x && this.y == other.y) {
      return true;
    } else {
      return false;  
    }
    
  }
  
  
  
}
