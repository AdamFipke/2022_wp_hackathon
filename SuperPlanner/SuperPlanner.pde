import java.time.*;
import static java.time.temporal.TemporalAdjusters.firstInMonth;
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

//variables
  PImage bg;
void setup() {
  size(1920, 1080);
  bg = loadImage("SpaceTheme.png");
  background(bg);
  Month_View();
  initLayout();
}

void draw() {
  textAlign(LEFT);
  for(TEXTBOX t : textboxes) {
     t.DRAW(); 
  }
  //Week_View();
}
