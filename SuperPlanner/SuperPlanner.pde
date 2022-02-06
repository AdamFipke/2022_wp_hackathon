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
PImage bg;
Button[] buttons0; //scene 0 buttons
Button[] buttons1; //scene 1 buttons
Button[] buttons2; //scene 2 buttons
int scene = 0; //0 = Title View, 1 = Month View, 2 = Week View
PFont dayF;
PFont monthF;

void fonts(){
dayF = createFont("RobotoSlab-Regular.ttf", 30);
monthF = createFont("RobotoSlab-Bold.ttf", 100);
}

int week = -1; //what week is selected for Week_View (-1 is the current week)



void setup() {
  size(1920, 1080);
  HomeScreen = loadImage("HomeScreen.png");
  PurpleBG= loadImage("Purple.png");
  SpaceBG = loadImage("SpaceTheme.png");
  TreesBG = loadImage("TreeTheme.png");
  TieDyeBG = loadImage("TieDye.png");
  FlowerBG = loadImage("FlowerTheme.png"); 



  





  //BUTTONS (LOAD THEM HERE) (int x, int y, int w, int h, color colour, color hovercolor, color border, color hoverborder, String text)
  
  //SCENE 0 BUTTONS
  buttons0 = new Button[5]; //ADJUST SIZE IF YOU'RE ADDING A NEW BUTTON
    buttons0[0]= new Button(100, 750, 100, 100, color(139, 130, 197), color(139,130,197), color(0), color(200, 0, 0), "Purple Theme");
    buttons0[1] = new Button(350, 750, 100, 100, color(255), color(0), color(10), color(255), "Space Theme");
    buttons0[2] = new Button(600,750,100,100,color(145,200,126), color(145,200,126),color(0), color(49,112,52), "Tree Theme");
    buttons0[3] = new Button(850,750,100,100,color(44,57,142), color(148,21,207),color(110,18,155),color(236,71,210), "Tie-Dye Theme");
    buttons0[4] = new Button(1100,750,100,100,color(198,76,177),color(255,255,78),color(248,166,163),color(248,163,246), "Flower Theme");
  //SCENE 1 BUTTONS
  buttons1 = new Button[5]; //ADJUST SIZE IF YOU'RE ADDING A NEW BUTTON
  for (int i = 0; i < 5; i++) { //for the 5 weeks in scene 1
    buttons1[i] = new Button(0, 193 + 177*i, 1920, 177, color(255, 0, 0, 0), color(255, 0, 0, 0), color(255, 0, 0, 0), color(200, 0, 0), "");
  }
  //SCENE 2 BUTTONS
  buttons2 = new Button[2]; //ADJUST SIZE IF YOU'RE ADDING A NEW BUTTON
  buttons2[0] = new Button(720, 20, 40, 40, color(200, 200, 200), color(200, 200, 200), color(100, 100, 100), color(255, 0, 0), "<");
  buttons2[1] = new Button(1180, 20, 40, 40, color(200, 200, 200), color(200, 200, 200), color(100, 100, 100), color(255, 0, 0), ">");

}

void draw() {
  textAlign(LEFT);
  for (TEXTBOX t : textboxes) { //ishaans stuff
    t.DRAW();
  }
  if (scene==0) { //TITLE SCREEN
   Title_View();
    buttons0[0].update();
    buttons0[1].update();
    buttons0[2].update();
    buttons0[3].update();
    buttons0[4].update();
  } else if (scene == 1) { //MONTH VIEW SCREEN
    Month_View();
    for (int i = 0; i < 5; i++) { //updates buttons to see if they're being hovered over (only first 5 which are the 'select week' buttons)
      buttons1[i].update();
    }
  } else if (scene == 2) { //WEEK VIEW SCREEN
    Week_View();
    buttons2[0].update();
    buttons2[1].update();
  }
}
