
//varibles related to file reading / saving
Record [] records;
Shape [] shapes;
String[] lines;
String[] item;
String[] column;
int recordCount = 0;
PrintWriter output;
  int column1;
  int column2;
  int column3;
  int column4;
  int column5;
  int column6;
  int column7;
  int column8;
boolean savedfile = false;

void FileImport(){
  
  //load the file and split into lines
  if(savedfile == true){
   lines = loadStrings("save.txt");
  }
  else{
    lines = loadStrings("Member.csv");
  }
  //new array of records 
  records = new Record[lines.length];
  
  //determine the order of the columns and assign them to the correct varibles
  column = split(lines[0], ',');
  for(int i=0; i<column.length; i++){
  if(column[i].equals("ID")){
    column1 = i;
  }
  else if(column[i].equals("Name")){
    column2 = i;
  }  
  else if(column[i].equals("X")){
    column3 = i;
  }
  else if(column[i].equals("Y")){
    column4 = i;
  }
  else if(column[i].equals("Year of Birth")){
    column5 = i;
  }
  else if(column[i].equals("Gender")){
    column6 = i;
  }
  else if(column[i].equals("Level")){
    column7 = i;
  }
  else if(column[i].equals("Group")){
    column8 = i;
  }
  }
  
  //split the remaining lines and assign their data to varibles in the Record class
  for(int i=1; i< lines.length; i++){
    item = split(lines[i], ',' );
    if (item.length >= 8) {
    records[recordCount] = new Record(item);
    recordCount++;
}
  }  
  }
  
void FileSave(){
  //create a new save file and an array to store the data
  output = createWriter("save.txt");
  String [] saveFile = new String[5];
  saveFile[0] = lines[0];
  
  //assign the (possibly) changed values into the new array
  for(int i=0; i<lines.length-1; i++){
  item[column1] = str(records[i].ID);
  item[column2] = records[i].name;
  item[column3] = str(int(map(shapes[i].x, 40, 760, 0, 1000))); //need to convert from shapes pos
  item[column4] = str(int(map((800 -shapes[i].y), 40, 760, 0, 1000))); //<>//
  item[column5] = str(records[i].birthYear);
  item[column6] = records[i].gender;
  item[column7] = str(records[i].level);
  item[column8] = str(records[i].group);
  String line = (item[column1] + "," + item[column2] + ',' + item[column3] + "," + item[column4] + ',' + item[column5] + ',' + item[column6] + ',' + item[column7] + ',' + item[column8]);       //<>//
  if(saveFile.length < i+2){
    saveFile = expand(saveFile, saveFile.length +1);
  }
  
  saveFile[i+1] = line;  
  }
  //print to the save file
  for(int i = 0; i<saveFile.length; i++){
  output.println(saveFile[i]);
  }
  output.close();
  alert1 = true;
  //save complete message
}

//image related varibles
boolean isImage = false;
int clear = 255;
float detail = 180;
boolean invert = false;
PImage image0;
PImage image1;
PImage image2;
PImage image3;
PImage image4;

//function to import images to use instead of shapes
void importImages(){
    image0 = loadImage("group0.png");
    image1 = loadImage("group1.png");
    image2 = loadImage("group2.png");
    image3 = loadImage("group3.png");
    image4 = loadImage("group4.png");
  isImage = true;
  CreateShapes();
}
