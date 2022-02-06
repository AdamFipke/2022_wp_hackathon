import java.time.*;
import static java.time.temporal.TemporalAdjusters.firstInMonth;
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

//variables
PImage HomeScreen;
PImage Purple;
PImage Space;
PImage Trees;
Button[] buttons;
int scene = 1; //1 = Month View, 2 = Week View

void setup() {
  size(1920, 1080);
  HomeScreen = loadImage("HomeScreen.png");

  background(HomeScreen);

  //BUTTONS (LOAD THEM HERE) (int x, int y, int w, int h, color colour, color hovercolor, color border, color hoverborder, String text)
  buttons = new Button[7]; //ADJUST SIZE IF YOUR ADDING A NEW BUTTON
  for (int i = 0; i < 5; i++) { //for the 5 weeks
    buttons[i] = new Button(0, 193 + 177*i, 1920, 177, color(255, 0, 0, 0), color(255, 0, 0, 0), color(255, 0, 0, 0), color(200, 0, 0), "");
  }
  
  buttons[5] = new Button(720,20,40,40,color(200,200,200),color(200,200,200),color(100,100,100),color(255,0,0),"<");
  buttons[6] = new Button(1180,20,40,40,color(200,200,200),color(200,200,200),color(100,100,100),color(255,0,0),">");
}

void draw() {
  textAlign(LEFT);
  for (TEXTBOX t : textboxes) { //ishaans stuff
    t.DRAW();
  }

  if (scene == 1) { //MONTH VIEW SCREEN
    Month_View();
    for (int i = 0; i < 5; i++) { //updates buttons to see if they're being hovered over (only first 5 which are the 'select week' buttons)
      buttons[i].update();
    }
  } else if (scene == 2) { //WEEK VIEW SCREEN
    background(200);
    Week_View();
    buttons[5].update();
    buttons[6].update();
  }
}
