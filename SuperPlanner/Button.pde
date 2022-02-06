public class Button {
  int x, y, w, h; //x,y are the top left coordinate of the button
  color colour, hovercolor, border, hoverborder;
  String text;
  
  public Button(int x, int y, int w, int h, color colour, color border, String text) {
    this.x = x; 
    this.y = y;
    this.w = w;
    this.h = h;
    this.colour = colour;
    hovercolor = colour;
    this.border = border;
    hoverborder = border;
    this.text = text;
  }

  public Button(int x, int y, int w, int h, color colour, color hovercolor, color border, color hoverborder, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colour = colour;
    this.hovercolor = hovercolor;
    this.border = border;
    this.hoverborder = hoverborder;
    this.text = text;
  }

  void update() {
    if (isMouseOver()) { //if it's being hovered
      stroke(hoverborder);
      fill(hovercolor);
    } else {
      stroke(border);
      fill(colour);
    }
    strokeWeight(3);
    rect(x, y, w, h, 4);
    textAlign(CENTER);
    fill(0);
    textSize(w/5.5);
    text(text, x+w/2, y+h/1.5);
  }

  boolean isMouseOver() {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }
}
