import java.time.*;
import static java.time.temporal.TemporalAdjusters.firstInMonth;
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

//variables
PImage HomeScreen;
PImage PurpleBG;
PImage SpaceBG;
PImage TreesBG;
PImage TieDyeBG;
PImage FlowerBG;
Button[] buttons0; //scene 0 buttons
Button[] buttons1; //scene 1 buttons
Button[] buttons2; //scene 2 buttons
Button text;       //button to swap to scene 3
int scene = 1; //1 = Month View, 2 = Week View, 3 = Text box

void setup() {
  size(1920, 1080);
  HomeScreen = loadImage("HomeScreen.png");
  PurpleBG= loadImage("Purple.png");
  SpaceBG = loadImage("SpaceTheme.png");
  TreesBG = loadImage("TreeTheme.png");
  TieDyeBG = loadImage("TieDyeTheme.png");
  FlowerBG = loadImage("FlowerTheme.png");

  initLayout();

  //BUTTONS (LOAD THEM HERE) (int x, int y, int w, int h, color colour, color hovercolor, color border, color hoverborder, String text)

  //SCENE 0 BUTTONS
  //buttons0 = new Button[0]; //ADJUST SIZE IF YOUR ADDING A NEW BUTTON
  //SCENE 1 BUTTONS
  buttons1 = new Button[5]; //ADJUST SIZE IF YOUR ADDING A NEW BUTTON
  for (int i = 0; i < 5; i++) { //for the 5 weeks in scene 1
    buttons1[i] = new Button(0, 193 + 177*i, 1920, 177, color(255, 0, 0, 0), color(255, 0, 0, 0), color(255, 0, 0, 0), color(200, 0, 0), "");
  }
  //SCENE 2 BUTTONS
  buttons2 = new Button[2]; //ADJUST SIZE IF YOUR ADDING A NEW BUTTON
  buttons2[0] = new Button(720, 20, 40, 40, color(200, 200, 200), color(200, 200, 200), color(100, 100, 100), color(255, 0, 0), "<");
  buttons2[1] = new Button(1180, 20, 40, 40, color(200, 200, 200), color(200, 200, 200), color(100, 100, 100), color(255, 0, 0), ">");
  text = new Button(50, 75, 90, 30, color(200), color(200), color(0), color(255, 0, 0), "Add Event");
}

void draw() {
  if (scene==0) { //TITLE SCREEN
    Title_View();
  } else if (scene == 1) { //MONTH VIEW SCREEN
    Month_View();
    for (int i = 0; i < 5; i++) { //updates buttons to see if they're being hovered over (only first 5 which are the 'select week' buttons)
      buttons1[i].update();
    }
    text.update();
  } else if (scene == 2) { //WEEK VIEW SCREEN
    background(200);
    Week_View();
    buttons2[0].update();
    buttons2[1].update();
  } else if (scene == 3) {
    fill(180);
    rect(480, 270, 960, 540);
    for (TEXTBOX t : textboxes) {
      t.DRAW();
    }
  }
}
