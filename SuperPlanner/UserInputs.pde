String txt = "";
int click = 0;

void initLayout() {
  TEXTBOX box1 = new TEXTBOX(720, 310, 300, 30);
  textboxes.add(box1);
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
  if (buttons1[0].isMouseOver()) {
    scene = 2;
  }
  if (text.isMouseOver()) {
    scene = 3; 
  }
}
