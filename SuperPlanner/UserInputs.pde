String txt = "";
String inputs[] = new String[4];
int Input;
int click = 0;
int i = 0;

void initLayout() {
  TEXTBOX box1 = new TEXTBOX(780, 360, 350, 30);
  TEXTBOX box2 = new TEXTBOX(780, 440, 350, 30);
  TEXTBOX box3 = new TEXTBOX(780, 520, 350, 30);
  TEXTBOX box4 = new TEXTBOX(780, 600, 350, 30);
  textboxes.add(box1);
  textboxes.add(box2);
  textboxes.add(box3);
  textboxes.add(box4);
}

void mousePressed() {
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

void keyPressed() {
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

void keyReleased() {
  if (click == 1) {
    if (key == BACKSPACE) {
      txt = txt.substring(0, txt.length() - 2);
    }
  }
}

void checkIfButtonsPressed() { //FUNCTIONALITY FOR BUTTONS
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
    for (int i = 0; i < 4; i++) {
      println(inputs[i]);
    }
    addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);
    i = 0;
    scene = 1;
  }
}

//String userInputFormatted = inputs[0];
//String userInputDateFormatted = inputs[1];
//tring  newEventName = inputs[2];
//int newDurationMins = 180;
//addEvent(userInputFormatted, userInputDateFormatted, newEventName, newDurationMins);



void addEvent(String userInputFormatted, String userInputDateFormatted, String newEventName, int newDurationMins) {
  LocalDateTime newEventDateTime = LocalDateTime.parse(userInputFormatted, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //extracts the userinput (dateTime)
  LocalDate newEventDate = LocalDate.parse(userInputDateFormatted, DateTimeFormatter.ofPattern("yyyy-MM-dd")); //extracts the userinput (date)
  events[numOfEvents] = new Event(newEventName, newEventDateTime, newEventDate, newDurationMins); //saves the event to the save array
  numOfEvents++;
}
