class Record{
  int ID;
  String name;
  int xPos;
  int yPos;
  int birthYear;
  String gender;
  int level;
  int group;
  boolean Female;
  boolean selected;
  

//assign the data of each line to varibles used throughout the code
public Record(String[] item){
  ID = int(item[column1]);
  name = item[column2];
  xPos = int(item[column3]);
  yPos = int(item[column4]);
  birthYear = int(item[column5]);
  gender = item[column6];
  level = int(item[column7]);
  group = int(item[column8]);
  
  if(gender.equals("Female")){
    Female= true;
  }
  else if(gender.equals("Male")){
    Female = false;
  }  
  
}

}
