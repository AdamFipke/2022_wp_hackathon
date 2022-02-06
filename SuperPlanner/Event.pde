void initLayout() {
  TEXTBOX input = new TEXTBOX();
  input.X = 75;
  input.Y = 50;
  input.W = 300;
  input.H = 30;
  textboxes.add(input); 
}

void mousePressed() {
  for(TEXTBOX t : textboxes) {
    t.PRESSED(mouseX, mouseY); 
  }
 weekButton();
}

void keyPressed() {
  for(TEXTBOX t : textboxes) {
    t.KEYPRESSED(key, keyCode);  
  }
}
