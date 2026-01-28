PFont MainFont;
PFont smallFont;
boolean startMenu;

void setup(){
  size(800, 800);  //<>//
  MainFont = loadFont("MicrosoftYaHeiUILight-15.vlw");
  smallFont = loadFont("MicrosoftYaHeiUI-9.vlw");
  textFont(MainFont);
  startMenu = true;
  
}

//global varibles
int ShapeLineWidth = 2;
boolean Button1 = false;
boolean Button2 = false;
boolean Button3 = false;
boolean ShapeFill = true;
boolean ShapeOutline = true;
boolean alert1 = false;
boolean alert2 = false;
boolean alert3 = false;
boolean select = true;
boolean multiple = false;
boolean shift = false;
boolean background = false;
int sizeAdjust = 0;
alert [] message;
int [] selected = new int[0];
int startX;
int startY;

void draw(){
  if(startMenu == true){
    //show the start menu alert
    showAlerts();
  }
  else{
    //draw all elements in correct display order
  background(255);
  if(background == true){
    createBackground();
  }
  Axis();
  Lines();
  CreateShapes();
  ToolBar();
  MoveShape(); 
  showAlerts();
 
  } //<>//

}

//draw the axis for the data
void Axis(){
  strokeWeight(2);
  stroke(0, 255);
  fill(0);
  textSize(15);
 line(20, 70, 20, 780); 
 line(780, 780, 20, 780);
 text("x- axis", 400, 795);
 text("1000", 780, 795);
 text("1000", 20, 70);
 text("0", 22, 795);
 text("0", 12, 782);
 pushMatrix();
 rotate(-PI/2);
 text("y-axis", -400, 12);
 
 popMatrix();
}


void CreateShapes(){ //<>//
  rectMode(CENTER);
  imageMode(CENTER);
  shapes = new Shape[lines.length];
  
  //for every record element create a corresponding shape 
  for(int i=0; i<records.length-1; i++){
    shapes[i] = new Shape(records[i].ID, records[i].xPos, records[i].yPos, records[i].Female, records[i].name, records[i].group, records[i].level, records[i].birthYear);
    shapes[i].DrawShape();
  }
}

void keyPressed(){
 if(keyCode == ENTER){
   FileSave();
 }
 
 if(keyCode == UP){
   sizeAdjust = sizeAdjust + 1;   
 }
 
 if(keyCode == DOWN){
   sizeAdjust = sizeAdjust - 1;
 }
 if(keyCode == SHIFT){
   multiple = true;
   shift = true;
 }
}

void keyReleased(){
 if(keyCode == SHIFT){  
   shift = false;
   startX = mouseX;
   startY = mouseY;
 }
}

//generate an interesting background
void createBackground(){
  float xnoise =0.0;
  float ynoise = 0.0;
  float inc = 0.009;
  
  strokeWeight(5);
  for(int y = 0; y<height; y=y+10){
    for(float x = 0; x<width; x=x+xnoise){
      float green=noise(xnoise, ynoise)*255;
      stroke(50, green, 70);
      line(x, y, x, y-10);
      xnoise=xnoise+inc;
    }
  xnoise = 0;
  ynoise = ynoise+inc;
  } 
}

void showAlerts(){
  //create alert messages to be called for different reasons
  message = new alert[5];
  message[0] = new alert(1);
  message[1] = new alert(2);
  message[2] = new alert(3);
  message[3] = new alert(4);
  
  //save complete alert
  if(alert1 == true){
    message[0].alertSummoned();
  }
  //images import message
  if(alert2 == true){
    message[1].alertSummoned();
  }
  
  //start menu message
  if(startMenu == true){
    message[2].alertSummoned();
  }
  //help message
  if(alert3 == true){
    message[3].alertSummoned();
  }
}
