class alert{
  alert(int index){
    alertNO = index;
  }

int alertNO = 0;
PFont LargeFont = loadFont("MicrosoftYaHeiUILight-45.vlw");

void alertSummoned(){
  select = false;
  //load images alert
  if(alertNO == 2){
    fill(177, 251, 152);
    strokeWeight(2);
    stroke(0, 255);
    rectMode(CENTER);
    rect(400, 400, 600, 500);
    rect(620, 600, 100, 50);
    
    fill(0);
    
    textFont(LargeFont);
    textSize(45);
    textAlign(CENTER);
    text("Importing Images", 400, 200);
    textSize(35);
    text("To use images instead of shapes,", 400, 250);
    textAlign(LEFT);
    textSize(30);
    text("1. Download your choice of png files", 120, 320);
    text("2. Name each image after the group you", 120, 370);
    text("want it to represent e.g. 'group0.png' ", 150, 420);
    text("3. place these images with the other", 120, 470);
    text("program files", 150, 520);
    text("4. click accept", 120, 570);
    textSize(25);
    text("(to revert to shapes click 'Shape Display')", 120, 630);
    textAlign(CENTER);
    text("Accept", 620, 610);
    //fun with text!
    
    textFont(MainFont);
    
    
  }
  //save complete alert
  if(alertNO == 1){
    rectMode(CENTER);
    fill(177, 251, 152);
    rect(400, 300, 600, 300);
    
    textFont(LargeFont);
    textSize(55);
    textAlign(CENTER);
    fill(0);
    text("Save Compete!", 400, 300);
    textSize(40);
    text("click to continue", 400, 400);
    
    textFont(MainFont);
  }
  
  //start-up alert -> load save or original file
  if(alertNO == 3){
    rectMode(CENTER);
    fill(177, 251, 152);
    rect(400, 300, 600, 300);
    rect(250, 350, 250, 60);
    rect(550, 350, 250, 60);
    fill(0);
    textFont(LargeFont);
    textSize(45);
    textAlign(CENTER);
    text("File Load", 400, 250);
    textSize(35);
    text("Load Original", 250, 365);
    text("Load Save", 550, 365);
    textSize(35);    
    textFont(MainFont);
  }
  
  //instructions/help message
  if(alertNO == 4){
    fill(177, 251, 152);
    strokeWeight(2);
    stroke(0, 255);
    rectMode(CENTER);
    rect(400, 400, 650, 400);
    rect(620, 550, 100, 50);
    
    fill(0);
    
    textFont(LargeFont);
    textSize(45);
    textAlign(CENTER);
    text("Controls", 400, 250);
    textSize(35);
    textAlign(LEFT);
    textSize(30);
    text("Click a shape to select or de-select it.", 95, 290);
    text("Move the mouse to move the selected shape/s.", 95, 330);
    text("Change the size of a selected shape with the ", 95, 370);
    text("'up / down' arrow keys.", 95, 410);
    text("Hold shift to select multiple shapes at once.", 95, 450);
    text("Release shift to affect selected shapes.", 95, 490);
    textSize(25);

    textAlign(CENTER);
    text("Ok", 620, 560);
   
    textFont(MainFont);
    
  }

}

}
