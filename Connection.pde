class Connection{
  int id;
  int i;
  int linkedID;
  boolean connected;
  
//assign the data of each line to varibles used throughout the code
public Connection(String[] item){
  id = int(item[column1]);

}
}

//outside class
String [] row;
Connection [] connections;
String [] value;
int connectCount = 0;


void Lines(){
  //load the file and split into lines
    row = loadStrings("Network.csv");
  
  //new array of connections
  connections = new Connection[row.length];
  
  //split the remaining lines and assign their data to varibles in the Record class //<>//
  for(int i=1; i< row.length; i++){
    value = split(row[i], ',' );
    for(int j=1; j<value.length-1; j++){
      if(int(value[j]) == 1){
        strokeWeight(ShapeLineWidth);
        stroke(200, 70);
        line(shapes[i-1].x, shapes[i-1].y, shapes[j-1].x, shapes[j-1].y); //<>//
      }
     }
   }
}  
  
