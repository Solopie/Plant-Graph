// ***Global variables
ArrayList<Entity> entities = new ArrayList<Entity>();
boolean createEntityMode = false;
boolean editMode = true;
// Buttons
Button buttonCreateEntity = new Button(50, 25, 100, 50);

void setup() {
  background(255);
  smooth();
  size(500, 500);
}



void draw() {
  background(255);
  // Default settings incase they have been changed
  rectMode(CORNER);
  fill(255);
  stroke(0);

  for (Entity cur : entities) {
    cur.display();
  }

  // Detect collisions
  for (Entity cur : entities) {
    for (Entity cur2 : entities) {
      if (cur != cur2) {
        if (cur.collision(cur2) && cur.getAllowCollision() == false && cur2.getAllowCollision() == false) {
          // When collision occurs
          System.out.println(cur.entityId + " is colliding with " + cur2.entityId);
        }
      }
    }
  }

  // Create entity button
  buttonCreateEntity.display();
  buttonCreateEntity.displayText("Create entity", 14);
  
  // Display what mode we are currently on
  if(createEntityMode) {
    fill(0);
    textAlign(RIGHT);
    textSize(14);
    text("Create Entity Mode", width - 10, 20);
  } else if(editMode) {
    fill(0);
    textAlign(RIGHT);
    textSize(14);
    text("Edit Mode", width - 10, 20);
  } else {
    fill(0);
    textAlign(RIGHT);
    textSize(14);
    text("Error: No mode is active", width - 10, 50);
    System.out.println("Error: No mode is active");  
  }
  
  //System.out.println(entities.size());
  
}

void mousePressed() {
  if (createEntityMode) {
    // ***Create entity mode
    // Exit Create entity mode
    if (buttonCreateEntity.pressed()) {
      createEntityMode = false;
      editMode = true;
    } else {
      // Create entity on where we clicked
      // When we create an entity go back to edit mode
      entities.add(new Entity(entities.size() + 1, "Test Entity: " + Integer.toString(entities.size() + 1), entities.size() + 1));
      createEntityMode = false;
      editMode = true;
    }
  } else if (editMode) {
    // *** Edit mode
    // Check to activate createEntityMode
    if (buttonCreateEntity.pressed()) {
      createEntityMode = true;
    }
  } else {
    // *** Not any mode
    System.out.println("Error: No mode is active");
  }
}
