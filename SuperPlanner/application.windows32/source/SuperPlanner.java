import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.time.*; 
import static java.time.temporal.TemporalAdjusters.firstInMonth; 
import java.time.format.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SuperPlanner extends PApplet {



ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

//variables
PImage HomeScreen;
PImage PurpleBG;
PImage SpaceBG;
PImage TreesBG;
PImage TieDyeBG;
PImage FlowerBG;
PImage FrogsBG;
PImage bg; 
PImage d; //default
Button[] buttons0; //scene 0 buttons
Button[] buttons1; //scene 1 buttons
Button[] buttons2; //scene 2 buttons
Button[] buttons3;
Button[] buttons4;
Button text;       //button to swap to scene 3
int scene = 0; //0 = Title View, 1 = Month View, 2 = Week View
PFont dayF;
PFont monthF;
Event[] events = new Event[999];
int numOfEvents = 0;

public void fonts(){
dayF = createFont("RobotoSlab-Regular.ttf", 30);
monthF = createFont("RobotoSlab-Bold.ttf", 100);
}

int week = -1; //what week is selected for Week_View (-1 is the current week)

public void setup() {
  
  HomeScreen = loadImage("HomeScreen.png");
  PurpleBG= loadImage("Purple.png");
  SpaceBG = loadImage("SpaceTheme.png");
  TreesBG = loadImage("TreeTheme.png");
  initLayout();
  TieDyeBG = loadImage("TieDye.png");
  FlowerBG = loadImage("FlowerTheme.png"); 
  FrogsBG = loadImage("frogs.png");
  d = loadImage("default.png");
  bg = d;
  //BUTTONS (LOAD THEM HERE) (int x, int y, int w, int h, color colour, color hovercolor, color border, color hoverborder, String text)

  //SCENE 0 BUTTONS
  buttons0 = new Button[9]; //ADJUST SIZE IF YOU'RE ADDING A NEW BUTTON
    buttons0[0]= new Button(820, 660, 75, 75, color(139, 130, 197), color(139,130,197), color(0), color(200, 0, 0), "Purple");
    buttons0[1] = new Button(935, 660, 75, 75, color(255), color(0), color(10), color(255), "Space");
    buttons0[2] = new Button(1050,660,75,75,color(145,200,126), color(145,200,126),color(0), color(49,112,52), "Tree");
    buttons0[3] = new Button(1050,760,75,75,color(44,57,142), color(148,21,207),color(110,18,155),color(236,71,210), "Tie-Dye");
    buttons0[4] = new Button(935,760,75,75,color(198,76,177),color(255,255,78),color(248,166,163),color(248,163,246), "Flower");
    buttons0[8] = new Button(820,760,75,75,color(76,191,74),color(76,191,74),color(62,139,61),color(248,163,246), "Frogs");
    buttons0[5] = new Button(820,860,75,75,color(80,184,231),color(80,184,231),color(0),color(128,132,137), "Default1");
    buttons0[6] = new Button(935,860,75,75,color(80,184,231),color(80,184,231),color(0),color(128,132,137), "Default2");
    buttons0[7] = new Button(1050,860,75,75,color(80,184,231),color(80,184,231),color(0),color(128,132,137), "Default3");
    
  //SCENE 1 BUTTONS
  buttons1 = new Button[5]; //ADJUST SIZE IF YOU'RE ADDING A NEW BUTTON
  for (int i = 0; i < 5; i++) { //for the 5 weeks in scene 1
    buttons1[i] = new Button(0, 193 + 177*i, 1920, 177, color(255, 0, 0, 0), color(255, 0, 0, 0), color(255, 0, 0, 0), color(200, 0, 0), "");
  }
  //SCENE 2 BUTTONS
  buttons2 = new Button[3]; //ADJUST SIZE IF YOUR ADDING A NEW BUTTON
  text = new Button(50, 75, 90, 30, color(200), color(200), color(0), color(255, 0, 0), "Add Event");
  buttons2[0] = new Button(610, 20, 40, 40, color(200, 200, 200), color(200, 200, 200), color(100, 100, 100), color(255, 0, 0), "<");
  buttons2[1] = new Button(1280, 20, 40, 40, color(200, 200, 200), color(200, 200, 200), color(100, 100, 100), color(255, 0, 0), ">");
  buttons2[2] = new Button(1750,30,90,40,color(217,221,220), color(217,221,220), color(255), color(0), "Month");
  //SCENE 3 BUTTONS
  buttons3 = new Button[1]; //ADJUST SIZE IF YOUR ADDING A NEW BUTTON
  buttons3[0] = new Button(1000,700,100,40, color(200, 200, 200), color(200, 200, 200), color(100, 100, 100), color(255, 0, 0), "Insert Event");

}

public void draw() {
  if (scene==0) { //TITLE SCREEN
   Title_View();
    buttons0[0].update();
    buttons0[1].update();
    buttons0[2].update();
    buttons0[3].update();
    buttons0[4].update();
    buttons0[5].update();
    buttons0[6].update();
    buttons0[7].update();
    buttons0[8].update();
  } else if (scene == 1) { //MONTH VIEW SCREEN
  background(bg);
    Month_View();
    for (int i = 0; i < 5; i++) { //updates buttons to see if they're being hovered over (only first 5 which are the 'select week' buttons)
      buttons1[i].update();
    }
    text.update();
  } else if (scene == 2) { //WEEK VIEW SCREEN
  background(bg);
    Week_View();
    buttons2[0].update();
    buttons2[1].update();
    buttons2[2].update();
  } else if (scene == 3) {
    fill(180);
    rect(480, 270, 960, 540);
    fill(0);
    textSize(25);
    text("Enter event title:", 600, 384);
    text("Enter event date:", 600, 464);  
    text("Enter event time:", 600, 544);  
    text("Enter duration:", 600, 624);
    
    fill(65);
    textSize(15);
    text("YYYY-MM-DD",600,504);
    text("HH:MM:SS",600,584);
    text("In Minutes", 600, 664);
    textAlign(LEFT);
    for (TEXTBOX t : textboxes) {
      t.DRAW();
    }
    buttons3[0].update();
  }
}
public class Button {
  int x, y, w, h; //x,y are the top left coordinate of the button
  int colour, hovercolor, border, hoverborder;
  String text;
  
  public Button(int x, int y, int w, int h, int colour, int border, String text) {
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

  public Button(int x, int y, int w, int h, int colour, int hovercolor, int border, int hoverborder, String text) {
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

  public void update() {
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
    textSize(w/5.5f);
    text(text, x+w/2, y+h/1.5f);
  }

  public boolean isMouseOver() {
    if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
      return true;
    } else {
      return false;
    }
  }
}
public void Default1View(){
  //String userInputFormatted = "2022-01-30 9:00:00"; //someone figure out how to take user inputs and turn it into this format
  //    String userInputDateFormatted = "2022-01-30";
   //   String newEventName = "Laundry";
   //   int newDurationMins = 180; //300 minutes
 //  addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
  
  Week_View();
 // fill(255);
 // stroke(255);
 // rectMode(CENTER);
 // rect(500,600,100,100);
 
   

}



public class Event {
  String eName;
  LocalDateTime dateTime;
  LocalDate date;
  int durationMin;

  Event(String eName, LocalDateTime dateTime, LocalDate date, int durationMin) {
    this.eName = eName;
    this.dateTime = dateTime;
    this.date = date;
    this.durationMin = durationMin;
  }
}
public void Month_View() {
fill(217,221,220);
  //DISPLAY DATES
  textAlign(LEFT);
  textSize(18);
  stroke(217,221,220);
  LocalDate firstdate = LocalDate.now();
  firstdate = firstdate.withDayOfMonth(1);
  LocalDate firstSunday = firstdate.with(firstInMonth(DayOfWeek.SUNDAY));
  int daycount = -7;
  for (int j = 0; j < 5; j++) { //5 weeks per month calendar
    for (int i = 0; i < 7; i++) { //7 days per week
      text(firstSunday.plusDays(daycount).getDayOfMonth(), width*i/7+width/8, (height-200)*(j)/5+220); //dsplays the dates
      int k = 0;
      while (events[k] != null) { //for every event
        if ((firstSunday.plusDays(daycount).getDayOfMonth() == events[k].date.getDayOfMonth()) && (firstSunday.plusDays(daycount).getMonth() == events[k].date.getMonth()) && (firstSunday.plusDays(daycount).getYear() == events[k].date.getYear())){ //if the event is has the same day, month, year
          rect(width*i/7, (height-200)*(j)/5+240,30,30); //display a rectangle idk
          text(events[k].eName,width*i/7, (height-200)*(j)/5+240); //display event name
        }
        k++;
      }
      daycount++;
    }
  }

  //WEEKDAY TITLES
  textAlign(CENTER, BOTTOM);
  //textFont(dayF);
  textSize(30);
  text("SUNDAY", 1920/7*0.5f, 190);
  text("MONDAY", 1920/7*1.5f, 190);
  text("TUESDAY", 1920/7*2.5f, 190);
  text("WEDNESDAY", 1920/7*3.5f, 190);
  text("THURSDAY", 1920/7*4.5f, 190);
  text("FRIDAY", 1920/7*5.5f, 190);
  text("SATURDAY", 1920/7*6.5f, 190);

  //BOXES
  for (int i = 0; i < 8; i++) {
    strokeWeight(4);
    line(width*i/7+width/7, 200, width*i/7+width/7, height);
    line(0, (height-200)*i/5+195, width, (height-200)*i/5+195);
  }
  line(0, 200, 0, height);

  //MONTH TITLE (make prettier pls and ty)
  textSize(100);
  textAlign(CENTER);
  text(firstdate.getMonth().toString(), width/2, 110);

  


  ChangeMonthButton();
}



//CHANGE MONTH BUTTONS
public void ChangeMonthButton() {
  fill(142, 142, 142);
  triangle(650, 70, 690, 50, 690, 90);
  triangle(1230, 50, 1270, 70, 1230, 90);
}
public class TEXTBOX {
  public int X = 0, Y = 0, H = 35, W = 200;
  public int TEXTSIZE = 24;

  // COLORS
  public int Background = color(140, 140, 140);
  public int Foreground = color(0, 0, 0);
  public int BackgroundSelected = color(160, 160, 160);
  public int Border = color(30, 30, 30);

  public boolean BorderEnable = false;
  public int BorderWeight = 1;

  public String Text = "";
  public int TextLength = 0;

  private boolean selected = false;

  TEXTBOX() {
    // CREATE OBJECT DEFAULT TEXTBOX
  }

  TEXTBOX(int x, int y, int w, int h) {
    X = x; 
    Y = y; 
    W = w; 
    H = h;
  }

  public void DRAW() {
    // DRAWING THE BACKGROUND
    if (selected) {
      fill(BackgroundSelected);
    } else {
      fill(Background);
    }

    if (BorderEnable) {
      strokeWeight(BorderWeight);
      stroke(Border);
    } else {
      noStroke();
    }

    rect(X, Y, W, H);

    // DRAWING THE TEXT ITSELF
    fill(Foreground);
    textSize(TEXTSIZE);
    text(Text, X + (textWidth("a") / 2), Y + TEXTSIZE);
  }

  // IF THE KEYCODE IS ENTER RETURN 1
  // ELSE RETURN 0
  public boolean KEYPRESSED(char KEY, int KEYCODE) {
    if (selected) {
      if (KEYCODE == (int)BACKSPACE) {
        BACKSPACE();
      } else if (KEYCODE == 32) {
        // SPACE
        addText(' ');
      } else if (KEYCODE == (int)ENTER) {
        return true;
      } else {
        boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
        boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
        boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
        boolean isKeyDash = (KEY == '-');
        boolean isColon = (KEY == ':');
        if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber || isKeyDash||isColon) {
          addText(KEY);
        }
      }
    }
    return false;
  }

  private void addText(char text) {
    // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
    if (textWidth(Text + text) < W) {
      Text += text;
      TextLength++;
    }
  }

  private void BACKSPACE() {
    if (TextLength - 1 >= 0) {
      Text = Text.substring(0, TextLength - 1);
      TextLength--;
    }
  }

  // FUNCTION FOR TESTING IS THE POINT
  // OVER THE TEXTBOX
  private boolean overBox(int x, int y) {
    if (x >= X && x <= X + W) {
      if (y >= Y && y <= Y + H) {
        return true;
      }
    }

    return false;
  }

  public void PRESSED(int x, int y) {
    if (overBox(x, y)) {
      selected = true;
    } else {
      selected = false;
    }
  }
}

public void Title_View(){
 background(HomeScreen);
}
String txt = "";
String inputs[] = new String[4];
int Input;
int click = 0;
int i = 0;

public void initLayout() {
  TEXTBOX box1 = new TEXTBOX(780, 360, 350, 30);
  TEXTBOX box2 = new TEXTBOX(780, 440, 350, 30);
  TEXTBOX box3 = new TEXTBOX(780, 520, 350, 30);
  TEXTBOX box4 = new TEXTBOX(780, 600, 350, 30);
  textboxes.add(box1);
  textboxes.add(box2);
  textboxes.add(box3);
  textboxes.add(box4);
}

public void mousePressed() {
  if ((mouseX >= 400 && mouseX <= 600) &&(mouseY >= 200 && mouseY <= 400)) {
    click = 1;
  } else {
    click = 0;
  }
  //weekButton();
  checkIfButtonsPressed();
  for (TEXTBOX t : textboxes) {
    t.PRESSED(mouseX, mouseY);
  }
}

public void keyPressed() {
  if (click == 1) {
    txt += key;
  }
  for (TEXTBOX t : textboxes) {
    if (t.KEYPRESSED(key, keyCode)) {
      inputs[i] = textboxes.get(i).Text;
      println(inputs[i]);
      i++;
    }
  }
}

public void keyReleased() {
  if (click == 1) {
    if (key == BACKSPACE) {
      txt = txt.substring(0, txt.length() - 2);
    }
  }
}

public void checkIfButtonsPressed() { //FUNCTIONALITY FOR BUTTONS
  if (scene == 0) { //TITLE SCREEN BUTTONS
    if (buttons0[0].isMouseOver()) {
      background(PurpleBG);
      scene = 1;
      bg = PurpleBG;
    } else if (buttons0[1].isMouseOver()) {
      background(SpaceBG);
      scene = 1;
      bg = SpaceBG;
    } else if (buttons0[2].isMouseOver()) {
      background(TreesBG);
      scene = 1;
      bg = TreesBG;
    } else if (buttons0[3].isMouseOver()) {
      background(TieDyeBG);
      scene = 1;
      bg = TieDyeBG;
    } else if (buttons0[4].isMouseOver()) {
      background(FlowerBG);
      scene = 1;
      bg = FlowerBG;
    } else if (buttons0[8].isMouseOver()) {
      background(FrogsBG);
      scene = 1;
      bg = FrogsBG;
    } else if (buttons0[5].isMouseOver()||buttons0[6].isMouseOver()||buttons0[7].isMouseOver()) {
      background(104,151,175);
      //example schedule 1
      //Sunday
      String userInputFormatted = "2022-01-30 09:00:00";
      String userInputDateFormatted = "2022-01-30";
      String  newEventName = "Laundry";
      int newDurationMins = 180;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-01-30 13:00:00";
      userInputDateFormatted = "2022-01-30";
      newEventName = "Meal Prep";
      newDurationMins = 120;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-01-30 16:00:00";
      userInputDateFormatted = "2022-01-30";
      newEventName = "Career Build";
      newDurationMins = 180;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      //Monday
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-01-31 08:00:00";
      userInputDateFormatted = "2022-01-31";
      newEventName = "Workout";
      newDurationMins = 60;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-01-31 10:00:00";
      userInputDateFormatted = "2022-01-31";
      newEventName = "Work";
      newDurationMins = 480;
      //Tuesday
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-02-01 10:00:00";
      userInputDateFormatted = "2022-02-01";
      newEventName = "Work";
      newDurationMins = 480;
      //Wednesday
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-02-02 08:00:00";
      userInputDateFormatted = "2022-02-02";
      newEventName = "Workout";
      newDurationMins = 60;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-02-02 10:00:00";
      userInputDateFormatted = "2022-02-02";
      newEventName = "Work";
      newDurationMins = 480;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      //Thursday
      userInputFormatted = "2022-02-03 10:00:00";
      userInputDateFormatted = "2022-02-03";
      newEventName = "Work";
      newDurationMins = 480;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      //Friday
      userInputFormatted = "2022-02-04 08:00:00";
      userInputDateFormatted = "2022-02-04";
      newEventName = "Workout";
      newDurationMins = 60;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-02-04 10:00:00";
      userInputDateFormatted = "2022-02-04";
      newEventName = "Work";
      newDurationMins = 480;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      //Saturday
      userInputFormatted = "2022-02-05 09:00:00";
      userInputDateFormatted = "2022-02-05";
      newEventName = "Groceries";
      newDurationMins = 90;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-02-05 13:00:00";
      userInputDateFormatted = "2022-02-05";
      newEventName = "Online Class";
      newDurationMins = 180;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
      userInputFormatted = "2022-02-05 19:00:00";
      userInputDateFormatted = "2022-02-05";
      newEventName = "Social Life";
      newDurationMins = 300;
      addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);



      scene = 2;
    }

  } else if (scene == 1) { //MONTH VIEW BUTTONS
    if (buttons1[0].isMouseOver()) {
      week = -1;
      scene = 2;
    } else if (buttons1[1].isMouseOver()) {
      week = 0;
      scene = 2;
    } else if (buttons1[2].isMouseOver()) {
      week = 1;
      scene = 2;
    } else if (buttons1[3].isMouseOver()) {
      week = 2;
      scene = 2;
    } else if (buttons1[4].isMouseOver()) {
      week = 3;
      scene = 2;
    } 
    if (text.isMouseOver()) {
      scene = 3;
    }
  } else if (scene == 2) { //WEEK VIEW BUTTONS
    if (buttons2[0].isMouseOver()) {
      week--;
    }
    if (buttons2[1].isMouseOver()) {
      week++;
    }
    if (text.isMouseOver()) {
      scene = 3;
    }
    if (buttons2[2].isMouseOver()) {
      scene = 1;
     // background(bg);
    }
  } else if (scene == 3)     if (text.isMouseOver()) {
    scene = 1;
  }
  if (buttons3[0].isMouseOver()) { //INSERT EVENT BUTTON
    //EXAMPLE
    String newEventName = inputs[0];
    String userInputDateFormatted = inputs[1];
    String userInputFormatted = userInputDateFormatted.concat(" " + inputs[2]); //inputs[2] is time and inputs[1] is date
    Input = Integer.valueOf(inputs[3]);
    int newDurationMins = Input;
    addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
    i = 0;
    scene = 1;
  }
}

public void addEvent(String userInputFormatted, String userInputDateFormatted, String newEventName, int newDurationMins) {
  LocalDateTime newEventDateTime = LocalDateTime.parse(userInputFormatted, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //extracts the userinput (dateTime)
  LocalDate newEventDate = LocalDate.parse(userInputDateFormatted, DateTimeFormatter.ofPattern("yyyy-MM-dd")); //extracts the userinput (date)
  events[numOfEvents] = new Event(newEventName, newEventDateTime, newEventDate, newDurationMins); //saves the event to the save array
  numOfEvents++;
}
 //<>//
 //<>//
public void Week_View() {
  fill(217,221,220);
  stroke(217,221,220,100);
  //Times
  //Adjustable variables (possibly make it so user can adjust them)
  int numOfTimes = 36; //how many times to be shown (try to make adjustable by user)
  int timeIntervals = 30; //how much time in between the intervals (in mins)
  String startTime = "2022-02-05 08:00:00"; //starts the time at 8am

  int topTimes = 140; //location for where topmost time is shown
  strokeWeight(1);
  int textSizeTimes = (int)(26*40/numOfTimes); //for adjusting the size of the text as more Times are added
  textSize(textSizeTimes);
  LocalDateTime firstDateTime = LocalDateTime.parse(startTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //extracts the date out of startTime
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm"); //the format of the displayed time
  for (int i = 0; i < numOfTimes; i++) {
    int timey = topTimes+(height-topTimes)/numOfTimes*i; //the 26 is the textSize
    text(firstDateTime.plusMinutes(i*timeIntervals).format(formatter), 45, timey+26); //writes the times
    line(0, timey+1, width, timey+1); //puts the lines in between the times
  }
  int rowGirth = (topTimes+26+(height-topTimes)/numOfTimes*2)-(topTimes+26+(height-topTimes)/numOfTimes); //timey2 - timey1
  for (int i = 1; i < numOfTimes; i+=2) { //alternating lines
    strokeWeight(1);
    stroke(0);
    fill(150, 150, 150, 30);
    rect(0, topTimes+i*rowGirth, width, rowGirth);
  }
  for (int i = 0; i < numOfTimes; i+=2) {
    fill(230, 230, 230, 30);
    rect(0, topTimes+i*rowGirth, width, rowGirth);
  }

  //DISPLAY DATES
  fill(217,221,220);
  textSize(26);
  LocalDate firstdate = LocalDate.now();
  firstdate = firstdate.withDayOfMonth(1);
  LocalDate firstSunday = firstdate.with(firstInMonth(DayOfWeek.SUNDAY));
  int daycount = week*7; //adjusting this will adjust the week (by multiples of 7), eg. -7 is the current week, 0 is next week etc.
  for (int i = 0; i < 7; i++) { //7 days per week
    text(firstSunday.plusDays(daycount).getDayOfMonth(), (width-100)/7*i+150, topTimes-26); //dsplays the dates
    int k = 0;
    while (events[k] != null) { //for every event
      if ((firstSunday.plusDays(daycount).getDayOfMonth() == events[k].date.getDayOfMonth()) && (firstSunday.plusDays(daycount).getMonth() == events[k].date.getMonth()) && (firstSunday.plusDays(daycount).getYear() == events[k].date.getYear())) { //if the event is has the same day, month, year
        int durationRectLength = 0; //how many time slots the event will take up
        int slotsBeforeStart = 0; //how many time slots before the start of the event
        int currentEventTime = (events[k].dateTime.getMinute()+events[k].dateTime.getHour()*60); //time (in total minutes) of the start of the current selected event
        for (int m = (firstDateTime.getMinute() + firstDateTime.getHour()*60)/timeIntervals; m*timeIntervals < 1440; m++) {//m represents every time slot from the start time to a full 24hours (1440 minutes)
          if ((currentEventTime <= m*timeIntervals) && (currentEventTime+events[k].durationMin > m*timeIntervals)) { //if the current time block is in between the start time and end time of the event
            durationRectLength++;
          } else if (currentEventTime > m*timeIntervals) { //if the current time block is still before the start of the event
            slotsBeforeStart++;
          }
        }
        fill(30, 30, 200, 50);
        rect(100+260*i, topTimes+slotsBeforeStart*rowGirth, 260, durationRectLength*rowGirth); //display a rectangle idk
        fill(0);
        text(events[k].eName, 200+260*i, topTimes+slotsBeforeStart*rowGirth+durationRectLength*rowGirth/2); //display event name
        fill(217,221,220);
      }
      k++;
    
 
    }
    daycount++;
  }

  //WEEKDAY TITLES
  text("SUNDAY", (width-100)/7-10, topTimes-26);
  text("MONDAY", (width-100)/7*2-10, topTimes-26);
  text("TUESDAY", (width-100)/7*3-10, topTimes-26);
  text("WEDNESDAY", (width-100)/7*4-10, topTimes-26);
  text("THURSDAY", (width-100)/7*5-10, topTimes-26);
  text("FRIDAY", (width-100)/7*6-10, topTimes-26);
  text("SATURDAY", (width-100)/7*7-10, topTimes-26);



  //Vertical Lines
  for (int i = -1; i < 8; i++) {
    strokeWeight(4);
    line((width-100)*i/7+100, topTimes, (width-100)*i/7+100, height);
  }
  line(100, topTimes, 100, height);

  //MONTH TITLE (make prettier pls and ty)
  textSize(70);
  textAlign(CENTER); 
  text(firstSunday.plusDays(daycount).getMonth().toString() + " " + firstSunday.plusDays(daycount).getYear(), width/2, 60);
}
  public void settings() {  size(1920, 1080); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SuperPlanner" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
