public void Month_View() {
  
  //DISPLAY DATES
  textAlign(LEFT);
  textSize(18);
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

  //MONTH TITLE (make prettier pls and ty)
  textSize(100);
  textAlign(CENTER);
  text(firstdate.getMonth().toString(), width/2, 110);
}
