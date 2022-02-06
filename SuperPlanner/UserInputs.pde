String txt = "";
int click = 0;

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
    t.KEYPRESSED(key, keyCode);
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
  } else if (scene == 2) { //WEEK VIEW BUTTONS
    if (buttons2[0].isMouseOver()) {
      week--;
    }
    if (buttons2[1].isMouseOver()) {
      week++;
    }
  } else if (scene == 3) {
    if (text.isMouseOver()) {
      scene = 3;
    }
    if (buttons3[0].isMouseOver()) { //INSERT EVENT BUTTON
      
    }
  }
}
