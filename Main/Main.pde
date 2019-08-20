// ***Global variables
ArrayList<Entity> entities = new ArrayList<Entity>();
boolean createEntityMode = false;
boolean editMode = true;
boolean movingEntityMode = false;
Entity entityBeingMoved;
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
  //for (Entity cur : entities) {
  //  for (Entity cur2 : entities) {
  //    if (cur != cur2) {
  //      if (cur.collision(cur2) && cur.getAllowCollision() == false && cur2.getAllowCollision() == false) {
  //        // When collision occurs
  //        System.out.println(cur.entityId + " is colliding with " + cur2.entityId);
  //      }
  //    }
  //  }
  //}

  // Create entity button
  buttonCreateEntity.display();
  buttonCreateEntity.displayText("Create entity", 14);

  // Display what mode we are currently on
  if (createEntityMode) {
    fill(0);
    textAlign(RIGHT);
    textSize(14);
    text("Create Entity Mode", width - 10, 20);
  } else if (editMode) {
    fill(0);
    textAlign(RIGHT);
    textSize(14);
    if(movingEntityMode) {
      text("Edit: Moving Entity Mode", width - 10, 20);
    } else {
      text("Edit Mode", width - 10, 20);
    }
    
    
  } else {
    fill(0);
    textAlign(RIGHT);
    textSize(14);
    text("Error: No mode is active", width - 10, 50);
    System.out.println("Error: No mode is active");
  }
  
  // Moving the entity
  if(movingEntityMode) {
    entityBeingMoved.setLocation(mouseX,mouseY); 
  }

  //System.out.println(entities.size());
}

void mouseClicked() {
  System.out.println("New Click Log");
  if (createEntityMode) {
    // ***Create entity mode
    // Exit Create entity mode
    if (buttonCreateEntity.pressed()) {
      createEntityMode = false;
      editMode = true;
      
      System.out.println("Create Entity mode turned off");
    } else {
      // Create entity on where we clicked
      // When we create an entity go back to edit mode
      entities.add(new Entity(entities.size() + 1, "Test Entity: " + Integer.toString(entities.size() + 1), entities.size() + 1));
      createEntityMode = false;
      editMode = true;
      
      System.out.println("Entity Created");
    }
  } else if (editMode) {
    // *** Edit mode

    // If we are not currently moving an entity
    if (!movingEntityMode) {
      // Check to activate createEntityMode
      if (buttonCreateEntity.pressed()) {
        createEntityMode = true;
        System.out.println("Create Entity Mode set");
      } else {
        // If the create entity button isn't pressed then we are trying to move
        // a entity or we clicked on nothing.
        // To move an entity we detect what entity to control and move the x and
        // y to the mouseX and mouseY

        // Loop through entities to check which entities has been clicked
        // Make a list of clicked entities

        ArrayList<Entity> clickedEntities = new ArrayList<Entity>();
        // Check if we have actually clicked on an entity
        boolean entityClicked = false;
        for (Entity temp : entities) {
          if (temp.isClicked()) {
            System.out.println("Yeet: " + Integer.toString(temp.priority));
            clickedEntities.add(temp);
            // Turn moveMode on for the entity
            // temp.setMoveMode(true);
            entityClicked = true;
          }
        }
        
        System.out.println("Clicked Entries:");
        for(int i = 0 ; i < clickedEntities.size(); i++) {
          System.out.println(clickedEntities.get(i).toString());
        }

        // Check if entity has been clicked to make sure that ther eis more
        if (entityClicked) {
          // Loop through clickedEntities and find the highestPriority
          // Whilst finding the highest priority entity we set entityBeingMoved

          // Set the first item of the clickedEntities as default.
          // Condition: There is always 1 or more objects in the list since we checked
          // if an entity has been clicked with entityClicked
          entityBeingMoved = clickedEntities.get(0);

          for (Entity temp : clickedEntities) {
            if (temp.isHigherPriority(entityBeingMoved)) {
              entityBeingMoved = temp;
            }
          }
          
          // Set moveMode tor be true for entity being moved
          entityBeingMoved.setMoveMode(true);
          
          // Indicate we are moving an entity
          movingEntityMode = true;

          // Now we turn off the moveMode for all clickedEntities except for the
          // entityBeingMoved
          //for (Entity temp : clickedEntities) {
          //  if (temp != entityBeingMoved) {
          //    temp.setMoveMode(false);
          //  }
          //}

          // The moveMode for the highest priority entity will stay on and now
          // moving the mouse will move the chosen entity.
          
          System.out.println("Highest Priority Entity set");
        }
      }
      // else: If entity hasn't been clicked we do nothing
    } else {
      // We are moving an entity (movingEntityMode is true)

      // We have clicked again so we must deactivate the moveMode of the
      // entity being moved and turn off movingEntityMode

      // Turn off moveMode for the entityBeingMoved
      entityBeingMoved.setMoveMode(false);
      // Reset the entityBeingMoved
      entityBeingMoved = null;
      // Turn off movingEntityMode
      movingEntityMode = false;
      
      System.out.println("Moving Entity Mode turned off");
    }
  } else {
    // *** Not any mode
    System.out.println("Error: No mode is active");
  }
}
