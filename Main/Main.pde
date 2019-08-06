// Global variables
ArrayList<Entity> entities = new ArrayList<Entity>();

void setup() {
  background(255);
  smooth();
  size(500,500);
  
  
}



void draw() {
  background(255);
  
  
  for(Entity cur: entities) {
    cur.display();
  }
  
  // Detect collisions
  for(Entity cur: entities) {
    for(Entity cur2: entities) {
      if(cur != cur2) {
        if(cur.collision(cur2) && cur.getAllowCollision() == false && cur2.getAllowCollision() == false) {
          // When collision occurs
          System.out.println("Hello");  
        }
      }
      
    }
  }
  System.out.println(entities.size());
}

void mousePressed() {
  entities.add(new Entity(entities.size() + 1, "Test Entity: " + Integer.toString(entities.size() + 1), entities.size() + 1));
  
}
