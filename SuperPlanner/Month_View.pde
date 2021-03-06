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
  text("SUNDAY", 1920/7*0.5, 190);
  text("MONDAY", 1920/7*1.5, 190);
  text("TUESDAY", 1920/7*2.5, 190);
  text("WEDNESDAY", 1920/7*3.5, 190);
  text("THURSDAY", 1920/7*4.5, 190);
  text("FRIDAY", 1920/7*5.5, 190);
  text("SATURDAY", 1920/7*6.5, 190);

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
