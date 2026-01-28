void ShapeSelect(){
  
 for(int j=1; j<shapes.length; j++){
    int i=j-1;
    int half = shapes[i].size/2;
    int x = shapes[i].x;
    int y = shapes[i].y;
    boolean add = true;
    
    //only one shape at a time
    if(mouseX<x+half && mouseX>x-half && mouseY<y+half && mouseY>y-half && select == true && multiple == false){
      for(int k=0; k<records.length-1; k++){
        if(i != k){
        records[k].selected = false;
      }
      }
      records[i].selected = !records[i].selected;
      records[i].level = constrain(records[i].level + sizeAdjust, 0, 10);
    }
    //selecting multiple
    if(mouseX<x+half && mouseX>x-half && mouseY<y+half && mouseY>y-half && select == true && multiple == true){
      add = true;
      //if a shape is selected and not already in the selected array, add it
      for(int k=0; k<selected.length; k++){
        if(i == selected[k]){
         add = false;
        }
      }
      if(add == true){
        selected = append(selected, i);
      }
    }
  }
  //check if each shape id is in the selected array, if it is, select that shape
  if(multiple == true){
  for(int i=1; i<records.length; i++){
    int k = i-1;
    records[k].selected = false;
        for(int n=0; n<selected.length; n++){
          
          if(k == selected[n]){
          records[k].selected = !records[k].selected;
          
          }
        }
      }
  }
}

void deSelect(){
  //for each selected shape, save its new position and size
  for(int k=0; k<records.length-1; k++){ 
    if(records[k].selected == true){
      records[k].level = constrain(records[k].level + sizeAdjust, 0, 10);
      shiftedX[k] = shapes[k].x;
      shiftedY[k] = shapes[k].y;
    }
    //un-select each shape
    records[k].selected = false;
  }
  //re-initalise the 'selected' array for the next time shift is used
     selected = new int[0];
}


int [] shiftedX = new int[50];
int [] shiftedY = new int[50];
int [] movedX = new int[50];
int [] movedY = new int[50];

//move the selected shape to the mouse //<>//
void MoveShape(){
  if(multiple == false){
  for(int j=1; j<records.length; j++){
    int i=j-1;
    if(records[i].selected == true){
      shiftedX[i] = mouseX;
      shiftedY[i] = mouseY;
    }
  }
  }
  
  //move the shapes the same direction and amount as the mouse
  if(multiple == true && shift == false){
    for(int j=1; j<records.length; j++){
    int i=j-1;
    
    if(records[i].selected == true){
      movedX[i] = mouseX - startX;
      movedY[i] = mouseY -startY;
    }
  }
  }
}
