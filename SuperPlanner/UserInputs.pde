String txt = "";
int click = 0;

//void draws() {
//  fill(0);
//  rect(400, 200, 200, 200, 15, 15, 15, 15);
//  textSize(20);
//  textAlign(CENTER);
//  fill(255);
//  text(txt, 500, 250);
//}

void mousePressed() {
  if ((mouseX >= 400 && mouseX <= 600) &&(mouseY >= 200 && mouseY <= 400)) {
    click = 1;
  } else {
    click = 0;
  }
  //weekButton();
  checkIfButtonsPressed();
}

void keyPressed() {
  if (click == 1) {
    txt += key;
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
  if (buttons[0].isMouseOver()) {
    scene = 2;
  }
  else if(buttons[6].isMouseOver()){
    background(PurpleBG);
    scene = 1;
}}
