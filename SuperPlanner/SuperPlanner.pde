import java.time.*;
import static java.time.temporal.TemporalAdjusters.firstInMonth;
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

//variables
PImage HomeScreen;
PImage Purple;
PImage Space;
PImage Trees;
Button[] buttons;
int scene; //1 = Month View

void setup() {
  size(1920, 1080);
  HomeScreen = loadImage("HomeScreen.png");

  background(HomeScreen);
  Month_View();
  weekbuttons();

  //BUTTONS (LOAD THEM HERE) (int x, int y, int w, int h, color colour, color hovercolor, color border, color hoverborder, String text)
  buttons = new Button[5]; //ADJUST SIZE IF YOUR ADDING A NEW BUTTON
  for (int i = 0; i < 5; i++) { //for the 5 weeks
    buttons[i] = new Button(0, 193 + 177*i, 1920, 177, color(255, 0, 0, 0), color(255, 0, 0, 0), color(255,0,0,0), color(200, 0, 0), "");
  }
}

void draw() {
  textAlign(LEFT);
  for (TEXTBOX t : textboxes) {
    t.DRAW();
  }
  
  Month_View();
  for (int i = 0; i < buttons.length; i++) { //updates buttons to see if they're being hovered over
    buttons[i].update();
  }
}
