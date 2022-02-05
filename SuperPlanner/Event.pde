String txt = "";
int click = 0;

void draw() {
  fill(0);
  rect(400, 200, 200, 200, 15, 15, 15, 15);
  textSize(20);
  textAlign(CENTER);
  fill(255);
  text(txt, 500, 250);
}

void mousePressed() {
  if ((mouseX >= 400 && mouseX <= 600) &&(mouseY >= 200 && mouseY <= 400)) {
    click = 1;
  } else {
    click = 0;
  }
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