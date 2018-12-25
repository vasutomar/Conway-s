
Boolean GameBegin = false;
String StartButtonText = "Begin Game";
int[][] matrix = new int[16][16];
int i=0;
int j=0;
  

void setup() {
  size(800,850);
  background(255);
  
  for(i=0;i<16;i++) {
    for(j=0;j<16;j++) {
      matrix[i][j] = 0;
    }
  }
  
  line(0,0,800,0);
  for(i=0;i<800;i=i+50) {
    line(i+50,0,i+50,800);
    line(0,i+50,800,i+50);
  }
  rect(350,810,100,30);
  stroke(0);
  
  fill(00);
  text(StartButtonText,365,815,100,100);
}

void draw() {
  if(GameBegin)
    moveNext();
    colorMatrix();
}

void colorMatrix() {
  for(i=0;i<16;i++) {
    for(j=0;j<16;j++) {
      if(matrix[i][j] == 1) {
        System.out.println(i+","+j);
        fill(0);
        rect(50*i,50*j,50,50);
      }
    }
  }
}

void update(int x, int y) {
  if ( overRect(350,810,100,30) ) {
      GameBegin = true;
      System.out.println("Game begins");  
  }
  else {
      int start_X = floor(x);
      int start_Y = floor(y);
      
      matrix[start_X][start_Y] = 1;
      //showClicked(start_Y,start_X);
      //showMatrix();
      colorMatrix();
  }
}

void showMatrix() {
  for(i=0;i<16;i++) {
    for(j=0;j<16;j++) {
      System.out.print(matrix[i][j]+" ");
    }
    System.out.println();
  }
}

int floor(int x) {
  return x/50;
}

void moveNext() {
  for(i=0;i<16;i++) {
    for(j=0;j<16;j++) {
      int colored = getColoredNeighbours(i,j);
      if(colored<2 || colored>3)
        matrix[i][j] = 0;
      else if(colored>3 && matrix[i][j] == 0) {
        matrix[i][j] = 1;
      }
    }
  }
}

int getColoredNeighbours(int a,int b) {
  int count = 0;
  if(i-1>0 && j-1>0) {
    if(matrix[i-1][j-1]==1)
      count++;
  }
  if(i+1<16 && j+1<16) {
    if(matrix[i+1][j+1]==1)
      count++;
  }
  if(i>0 && j+1<16) {
    if(matrix[i][j+1]==1)
      count++;
  }
  if(i>0 && j-1>0) {
    if(matrix[i][j-1]==1)
      count++;
  }
  if(i+1<16 && j>0) {
    if(matrix[i+1][j]==1)
      count++;
  }
  if(i-1>0 && j>0) {
    if(matrix[i-1][j]==1)
      count++;
  }
  if(i+1<16 && j-1>0) {
    if(matrix[i+1][j-1]==1)
      count++;
  }
  if(i-1>0 && j+1<16) {
    if(matrix[i-1][j+1]==1)
      count++;
  }
  return count;
}

void showClicked(int a,int b) {
  System.out.println(a+" , "+b);
}

void mousePressed() {
  if(GameBegin == false)
    update(mouseX,mouseY); 
}

boolean overRect(int x,int y,int width,int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
