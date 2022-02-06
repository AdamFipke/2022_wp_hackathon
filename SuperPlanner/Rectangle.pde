
public class Rectangle
{
  private float x1;
  private float x2;
  private float y1;
  private float y2;
  private int r,g,b;


Rectangle(){
 x1 = 0;
 x2 = 1920;
 y1 = 200;
 y2 = 1080/5+200;
}

Rectangle(float x1, float x2, float y1, float y2){
  this.x1 = x1;
  this.x2 = x2;
  this.y1 = y1;
  this.y2 = y2;
}

void dra(){
  fill(255, 255);
  noStroke();
  rect(x1, x2, y1, y2);
}

//void setColour(int r, int g, int b){
 // this.r = r;
 // this.g =g;
 // this.b=b;
//}
}
