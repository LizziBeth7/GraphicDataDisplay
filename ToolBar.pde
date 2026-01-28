
void ToolBar(){
  //draw the toolbar
  textAlign(CENTER);
  textFont(MainFont);
  fill(177, 251, 152);
  strokeWeight(2);
  stroke(0, 255);
  rectMode(CORNER);
  rect(0, 0, 100, 50);
  rect(100, 0, 100, 50); 
  rect(200, 0, 100, 50); 
  rect(300, 0, 400, 50);
  rect(700, 0, 100, 50);
  
  fill(0);
  textSize(14);
  text("Shape Display", 50, 30);
  text("Shape Outline", 150, 30 );
  text("Image Options", 250, 30);
  text("Press Enter To Save", 500, 30);
  text("Help", 750, 30);
  fill(177, 251, 152);
  
  //if button 1 is pushed display its sub-buttons/options
  if(mouseX<100 && mouseX>0 && mouseY<50 && mouseY>0 || Button1 == true){
  fill(177, 251, 152);
  rect(5, 50, 90, 50);
  rect(5, 100, 90, 50);
  rect(5, 150, 90, 50);
  
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("Fill", 50, 80);
  text("Outline", 50, 130);
  text("Both", 50, 180);
  
  }
  //display the options for button 2 when pushed
  if(mouseX<200 && mouseX>100 && mouseY<50 && mouseY>0 || Button2 == true){
    fill(177, 251, 152);
    rect(105, 50, 90, 50);
    rect(105, 100, 90, 50);
    rect(105, 150, 90, 50);
    rect(105, 200, 90, 50);
    
    fill(0);
    textSize(25);
    textAlign(CENTER);
    text("1 px", 150, 80);
    text("2 px", 150, 130);
    text("3 px", 150, 180);
    text("4 px", 150, 230);
    
  }
  //determine if button 3 is active and show that menu
  if(mouseX<300 && mouseX>200 && mouseY<50 && mouseY>0 || Button3 == true){
    fill(177, 251, 152);
    rect(205, 50, 90, 50);
    rect(205, 100, 90, 50);
    rect(205, 150, 90, 50);
    rect(205, 200, 90, 50);
    rect(205, 250, 90, 50);
    
    fill(0);
    textSize(13);
    textAlign(CENTER);
    text("load images", 250, 80);
    text("+ opacity", 250, 130);
    text("+ transperency", 250, 180);
    text("invert colors", 250, 230);
    text("background", 250, 280);
  }
  
  //if a button is selected, you cannot select the shapes 
  //(so they can't be moved while trying to click menu items)
  if(Button1 == true || Button2 == true || Button3 == true){
    select = false;
  }
  
}

void mousePressed(){
  //check that its not start menu otherwise elements will be empty and cause errors
  if(startMenu == false){
  //run the fuction to see if a shape/s was selected
  ShapeSelect();
  
  //if shift has been released save the values and reset temp varibles
  if(multiple == true && shift == false){
    deSelect();
    multiple = false;
  }
  //reset the size adjustment on click / ensure it is reset when a new shape is clicked
  sizeAdjust = 0;
  
  //save complete message stops showing
  if(alert1 == true){
    alert1 = false;
  }
  
  //determines if a main button is pushed and de-selects all other buttons
  strokeWeight(3);
  if(mouseX<100 && mouseX>0 && mouseY<50 && mouseY>0){
    Button1 = !Button1;
    Button2 = false;
    Button3 = false;
    isImage = false;
    select = true; //select is set to true incase the button was de-selected by clicking 
    //(will be set to false in earlier code if button true)
  }
  if(mouseX<200 && mouseX>100 && mouseY<50 && mouseY>0){
    Button2 = !Button2;
    Button1 = false;
    Button3 = false;
    select = true;
  }
  if(mouseX<300 && mouseX>200 && mouseY<50 && mouseY>0){
    Button3 = !Button3;
    Button1 = false;
    Button2 = false;
    select = true;
  }
  //help / info button
  if(mouseX<800 && mouseX>700 && mouseY<50 && mouseY>0){
    alert3 = true;
  }
  //if somewhere else on the screen is clicked, turn off menu buttons
  if(mouseX>300 && mouseX<width || mouseY>300 && mouseY<height){
    Button3 = false;
    Button1 = false;
    Button2 = false;
    select = true;
  }
  
  
  //first column
  if(mouseX<95 && mouseX>5 && mouseY<100 && mouseY>50 && Button1 == true){
    ShapeFill = true;
    ShapeOutline = false;
  }
  if(mouseX<95 && mouseX>5 && mouseY<150 && mouseY>100 && Button1 == true){
    ShapeFill = false;
    ShapeOutline = true; 
  }
  if(mouseX<95 && mouseX>5 && mouseY<200 && mouseY>150 && Button1 == true){
    ShapeFill = true;
    ShapeOutline = true;
  }
  //second column
  if(mouseX<195 && mouseX>105 && mouseY<100 && mouseY>50 && Button2 == true){
    ShapeLineWidth = 1;
  }
  if(mouseX<195 && mouseX>105 && mouseY<150 && mouseY>100 && Button2 == true){
    ShapeLineWidth = 2;
  }
  if(mouseX<195 && mouseX>105 && mouseY<200 && mouseY>150 && Button2 == true){
    ShapeLineWidth = 3;
  }
  if(mouseX<195 && mouseX>105 && mouseY<250 && mouseY>200 && Button2 == true){
    ShapeLineWidth = 4;
  }
  
  //third column
  if(mouseX>205 && mouseX<295 && mouseY<100 && mouseY>50 && Button3 == true){
    //show 'how to input images message' //<>//
    Button3 = false;
    alert2 = true;
    select = false;
  }
  if(mouseX>205 && mouseX<295 && mouseY<150 && mouseY>100 && Button3 == true){
    clear = constrain(clear + 20, 0, 255);
  }
  if(mouseX>205 && mouseX<295 && mouseY<200 && mouseY>150 && Button3 == true){
    clear = constrain(clear - 20, 0, 255);
  }
  if(mouseX>205 && mouseX<295 && mouseY<250 && mouseY>200 && Button3 == true){
    invert = !invert;
  }
  if(mouseX>205 && mouseX<295 && mouseY<300 && mouseY>250 && Button3 == true){
    Button3 = false;
    background = !background;
  }
  
  //confrim alert messges
  //save alert
  if(mouseX>570 && mouseX<670 && mouseY>575 && mouseY<625 && alert1 == true){
    alert1 = false;
    select = true;
  }
  //images alert
    if(mouseX>570 && mouseX<670 && mouseY>575 && mouseY<625 && alert2 == true){
    alert2 = false;
    select = true;
    importImages();
  }
  //help alert
    if(mouseX>570 && mouseX<670 && mouseY>525 && mouseY<575 && alert3 == true){
      alert3 = false;
      select = true;
  }
  }
  //start menu options
  if(mouseX>125 && mouseX<375 && mouseY>320 && mouseY<380 && startMenu == true){
    startMenu = false;
    savedfile = false;
    FileImport();
    CreateShapes();
    select = true;
  }
  if(mouseX>425 && mouseX<675 && mouseY>320 && mouseY<380 && startMenu == true){
    startMenu = false;
    savedfile = true;
    FileImport();
    CreateShapes();
    select = true;
  }
  
}
