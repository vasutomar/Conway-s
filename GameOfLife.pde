
Boolean GameBegin = false;
String StartButtonText = "Begin Game";
int gridSize = 32;
int tileWidth = 800/gridSize;
int[][] matrix = new int[gridSize][gridSize];
int[][] temp = new int[gridSize][gridSize];
int i=0;
int j=0;
  

void setup() {
  size(800,850);
  background(255);
  
  for(i=0;i<gridSize;i++) {
    for(j=0;j<gridSize;j++) {
      matrix[i][j] = 0;
      temp[i][j] = 0;
    }
  }
  
  line(0,0,800,0);
  for(i=0;i<800;i=i+tileWidth) {
    line(i+50,0,i+tileWidth,800);
    line(0,i+tileWidth,800,i+tileWidth);
  }
  rect(350,810,100,30);
  stroke(0);
  
  fill(00);
  text(StartButtonText,365,815,100,100);
}

void draw() {
  if(GameBegin) {
    delay(1000/16);
    showMatrix();
    moveNext();
    colorMatrix();
  }
}

void playGame() {
  
}

void moveNext() {
  for(i=0;i<gridSize;i++) {
    for(j=0;j<gridSize;j++) {
      int colored = getColoredNeighbours(i,j);
      if(matrix[i][j] == 1) {
        if(colored<2 || colored >3)
          temp[i][j] = 0;
        else
          temp[i][j] = 1;
      }
      else {
        if(colored == 3) {
          System.out.println("here,"+i+" "+j);
          temp[i][j] = 1;
        }
      }
    }
  }
  for(i=0;i<gridSize;i++) {
    for(j=0;j<gridSize;j++) {
      matrix[i][j] = temp[i][j];
    }
  }
}

int getColoredNeighbours(int a,int b) {
  int count = 0;
  if(a-1>-1 && b-1>-1) {
    if(matrix[a-1][b-1]==1)
      count++;
  }
  if(a+1<gridSize && b+1<gridSize) {
    if(matrix[a+1][b+1]==1)
      count++;
  }
  if(a>-1 && b+1<gridSize) {
    if(matrix[a][b+1]==1)
      count++;
  }
  if(a>-1 && b-1>-1) {
    if(matrix[a][b-1]==1)
      count++;
  }
  if(a+1<gridSize && b>-1) {
    if(matrix[a+1][b]==1)
      count++;
  }
  if(a-1>-1 && b>-1) {
    if(matrix[a-1][b]==1)
      count++;
  }
  if(a+1<gridSize && b-1>-1) {
    if(matrix[a+1][b-1]==1)
      count++;
  }
  if(a-1>-1 && b+1<gridSize) {
    if(matrix[a-1][b+1]==1)
      count++;
  }
  return count;
}


void colorMatrix() {
  for(i=0;i<gridSize;i++) {
    for(j=0;j<gridSize;j++) {
      if(matrix[i][j] == 1) {
        //System.out.println(i+","+j);
        fill(0);
        rect(tileWidth*j,tileWidth*i,tileWidth,tileWidth);
      }
      else {
        fill(255);
        rect(tileWidth*j,tileWidth*i,tileWidth,tileWidth);
      }
    }
  }
}

void showMatrix() {
  for(i=0;i<gridSize;i++) {
    for(j=0;j<gridSize;j++) {
      System.out.print(matrix[i][j]+" ");
    }
    System.out.println();
  }
  System.out.println("-----------------------------------------------------");
}

void showClicked(int a,int b) {
  System.out.println(a+" , "+b);
}

void mousePressed() {
  if(GameBegin == false)
    update(mouseX,mouseY); 
}

void update(int x, int y) {
  if ( overRect(350,810,100,30) ) {
      GameBegin = true;
      System.out.println("Game begins");  
  }
  else {
      int start_X = floor(x);
      int start_Y = floor(y);
      
      matrix[start_Y][start_X] = 1;
      //showClicked(start_Y,start_X);
      //showMatrix();
      colorMatrix();
  }
}

boolean overRect(int x,int y,int width,int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}


int floor(int x) {
  return x/tileWidth;
}
