String txt = "";
String inputs[] = new String[4];
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
    if(t.KEYPRESSED(key, keyCode)) {
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
      bg=PurpleBG;
      scene = 1;
    } else if (buttons0[1].isMouseOver()) {
      bg=SpaceBG;
      scene = 1;
    } else if (buttons0[2].isMouseOver()) {
      bg=TreesBG;
      scene = 1;
    } else if (buttons0[3].isMouseOver()) {
      bg = TieDyeBG;
      scene = 1;
    } else if (buttons0[4].isMouseOver()) {
      bg = FlowerBG;
      scene = 1;
    }
    background(bg);
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
  } else if (scene == 3) {
    if (text.isMouseOver()) {
      scene = 1;
    }
    if (buttons3[0].isMouseOver()) { //INSERT EVENT BUTTON
      String userInputFormatted = "2022-02-05 08:00:00"; //someone figure out how to take user inputs and turn it into this format
      String userInputDateFormatted = "2022-02-05";
      String newEventName = "Dave's Bday";
      
      LocalDateTime newEventDateTime = LocalDateTime.parse(userInputFormatted, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //extracts the userinput (dateTime)
      LocalDate newEventDate = LocalDate.parse(userInputDateFormatted, DateTimeFormatter.ofPattern("yyyy-MM-dd")); //extracts the userinput (date)
      events[numOfEvents] = new Event(newEventName, newEventDateTime, newEventDate); //saves the event to the save array
      numOfEvents++;
    }
  }
}
