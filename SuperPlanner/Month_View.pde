public void Month_View() {
  
  //DISPLAY DATES
  textAlign(LEFT);
  textSize(18);
  stroke(0);
  LocalDate firstdate = LocalDate.now();
  firstdate = firstdate.withDayOfMonth(1);
  LocalDate firstSunday = firstdate.with(firstInMonth(DayOfWeek.SUNDAY));
  int daycount = -7;
  for (int j = 0; j < 5; j++) { //5 weeks per month calendar
    for (int i = 0; i < 7; i++) { //7 days per week
      text(firstSunday.plusDays(daycount).getDayOfMonth(), width*i/7+width/8, (height-200)*(j)/5+220); //dsplays the dates
      daycount++;
    }
  }

  //WEEKDAY TITLES
  textSize(30);
  text("SUNDAY             MONDAY             TUESDAY             WEDNENDSAY             THURSDAY             FRIDAY             SATURDAY", 50, 190); //can be made more sophisticated

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
  
  weekbuttons();
  ChangeMonthButton();
}

//WEEK BUTTONS
 void weekbuttons(){
   r = new Rectangle[5];

  for (int i = 0; i < 5; i++) {
    int x1 = 0;
    int x2 = 1920;
    int y1 = 190 + 178*(i);
    int y2 = 1990 + 2*178*i;
    r[i] = new Rectangle(x1, x2, y1, y2);
  }

  for (int j = 0; j < 5; j++) {
    r[j].dra();
  }
 }
 
 //CHANGE MONTH BUTTONS
 public void ChangeMonthButton(){
  fill(142,142,142);
  triangle(650, 70, 690, 50, 690, 90);
  triangle(1230, 50, 1270, 70, 1230, 90);
 
 }
