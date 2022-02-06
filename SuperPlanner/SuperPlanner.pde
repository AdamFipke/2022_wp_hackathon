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
Button[] buttons;
int scene = 0; //1 = Month View, 2 = Week View

void setup() {
  size(1920, 1080);
  HomeScreen = loadImage("HomeScreen.png");
   PurpleBG= loadImage("Purple.png");
 SpaceBG = loadImage("SpaceTheme.png");
 TreesBG = loadImage("TreeTheme.png");
 TieDyeBG = loadImage("TieDyeTheme.png");
 FlowerBG = loadImage("FlowerTheme.png"); 

 
  Month_View();
  weekbuttons();

  //BUTTONS (LOAD THEM HERE) (int x, int y, int w, int h, color colour, color hovercolor, color border, color hoverborder, String text)
  buttons = new Button[5]; //ADJUST SIZE IF YOUR ADDING A NEW BUTTON
  for (int i = 0; i < 5; i++) { //for the 5 weeks
    buttons[i] = new Button(0, 193 + 177*i, 1920, 177, color(255, 0, 0, 0), color(255, 0, 0, 0), color(255, 0, 0, 0), color(200, 0, 0), "");
  }
}

void draw() {
  textAlign(LEFT);
  for (TEXTBOX t : textboxes) { //ishaans stuff
    t.DRAW();
  }
  if(scene==0){ //TITLE SCREEN
    Title_View();}
  else if (scene == 1) { //MONTH VIEW SCREEN
    Month_View();
    for (int i = 0; i < buttons.length; i++) { //updates buttons to see if they're being hovered over
      buttons[i].update();
    }
  } else if (scene == 2) { //WEEK VIEW SCREEN
    background(200);
    Week_View();
  }
}
