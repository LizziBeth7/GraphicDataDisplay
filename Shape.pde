class Shape{
  Shape(int ID, int X, int Y, boolean Gender, String Person, int Group, int Level, int BIRTHYear){
   recordX=X;
   recordY=Y;
   female = Gender;
   name = Person;
   group = Group;
   level = Level +1;
   size = 10*level;
   Year = BIRTHYear;
   i = ID - 1;
}
int recordX;
int recordY;
int x;
int y;
boolean female;
String name;
int group;
int level;
int size;
int RedValue;
int Year;
int i;

void DrawShape(){
  //if shapes haven't been moved set to values in the record
if(shiftedX[i] == 0 && shiftedY[i] == 0){
  //map record values
  x = recordX;
  y = recordY;
  x = int(map(x, 0, 1000, 40, 760));
  y = int(map(y, 0, 1000, 40, 760));
  y = 800 - y;
 }
  else{
  //set x & y to their shifted values
  x = shiftedX[i];
  y = shiftedY[i];
  }
  
  //display the changed values when multiple shapes are changed at once
  if(multiple == true && shift == false && records[i].selected == true){
    x = x + movedX[i];
    y = y + movedY[i];
  }
  
  fill(0);
  AddLabel();
  GenderBar();
  
  //display info if shape selected & highlight
  if(records[i].selected == true){
    InfoBox();
    level = constrain(level + sizeAdjust, 1, 11);
    stroke(145, 252, 109);
  }
  else{stroke(0, 255);}
  
 //check stroke weight set by user
  if(ShapeOutline == true){
    strokeWeight(ShapeLineWidth);
  }
  else{strokeWeight(0);}  
  
  //set size as a ratio of level
  size = 10*level;
  
  //check if fill is active and set color
  DetermineColor();
  if(ShapeFill == true){
    fill(RedValue, 0, 255-RedValue);
    tint(RedValue, 0, 255-RedValue, clear);
  }
  else{
   fill(255); 
  }
  
  if(invert == true){
   filter(INVERT);  //<>//
  }
  
  //check group and draw coresponding shape / image
 if(group == 0){
   if(isImage == true && image0 != null){
     image(image0, x, y, size, size);
   }
   else{rect(x, y, size, size);}
 }
 else if(group == 1){
   if(isImage == true && image1 != null){
     image(image1, x, y, size, size);
   }else{ellipse(x, y, size, size); }
 }
 else if(group == 2){
   if(isImage == true && image2 != null){
     image(image2, x, y, size, size);
   }
   else{triangle(x, y-size/2, x-size/2, y+size/2, x+size/2, y+size/2);}
 }
 else if(group == 3){
   if(isImage == true && image3 != null){
     image(image3, x, y, size, size);
   }
   else{quad(x-size/2, y, x, y-size/2, x+size/2, y, x, y+size/2);}
 }
 else if(group == 4){
   if(isImage == true && image4 !=null){
     image(image4, x, y, size, size);
   }
   else{
   beginShape();
   vertex(x, y-size/2);
   vertex(x-size/2, y+size/2);
   vertex(x+size/2, y);
   vertex(x-size/2, y);
   vertex(x+size/2, y+size/2);
   vertex(x, y-size/2);
   endShape();
   }
 }
 //if there are more than 5 groups, the rest are shown as rectangles
 else{
  rect(x, y, size, size/2); 
 }
  if(invert == true){
    filter(INVERT);
  }
}

//draw the name label beneath each shape
void AddLabel(){
   textAlign(CENTER); 
   textFont(MainFont);
   textSize(15);
   text(name, x, y+size/2 + 15);
  }


//add the line for if male
void GenderBar(){
  stroke(0);
  strokeWeight(ShapeLineWidth);
  if(female == false){
    line(x-size/2, y+size/2+4, x+size/2, y+size/2+4);
  }
}

//evaluate birth year and create colour
void DetermineColor(){
  int LastDigit = Year - 2000;
  RedValue = int(map(LastDigit, 0, 5, 0, 255));
}

//create an info box with the shapes details
void InfoBox(){
  //turn the varibles into strings
  int infoHeight = 5+((5-level)*5);
  String idName = str(i+1) + ": " + name;
  int InfoY = y-size-infoHeight;
  String BirthY = "Born: " + str(Year);
  String levelStr = "Level: " + str(level-1);
  String groupStr = "Group: " + str(group);
  String gender;
  String xStr = "x:  " + str(int(map(x, 40, 760, 0, 1000)));
  String yStr = "y:  " + str(int(map((800 -y), 40, 760, 0, 1000)));
  if(female == true){
    gender = "Female";
  }
  else{gender = "Male";}
  
  fill(240);
  stroke(0);
  strokeWeight(1.5);
  rect(x, InfoY, 95, 50);
  textFont(smallFont);
  textAlign(LEFT);
  textSize(9);
  fill(0);
  text(idName, x-45, InfoY-10);
  text(BirthY + "    " + gender, x-45, InfoY);
  text(levelStr + "        " + groupStr, x-45, InfoY+10);
  text(xStr + "        " + yStr, x-45, InfoY+20);
}

}
