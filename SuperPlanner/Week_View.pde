import java.time.format.*;

public void Week_View() {
  fill(0);
  stroke(0);
  //DISPLAY DATES
  int topTimes = 140; //location for where topmost time is shown
  textSize(26);
  LocalDate firstdate = LocalDate.now();
  firstdate = firstdate.withDayOfMonth(1);
  LocalDate firstSunday = firstdate.with(firstInMonth(DayOfWeek.SUNDAY));
  int daycount = week*7; //adjusting this will adjust the week (by multiples of 7), eg. -7 is the current week, 0 is next week etc.
  for (int i = 0; i < 7; i++) { //7 days per week
    text(firstSunday.plusDays(daycount).getDayOfMonth(), width*i/7+width/20, topTimes-26); //dsplays the dates
    daycount++;
  }

  //WEEKDAY TITLES
  text("                SUNDAY             MONDAY               TUESDAY              WEDNENDSAY             THURSDAY             FRIDAY             SATURDAY", 50, topTimes-26); //can be made more sophisticated

  //Times
  //Adjustable variables (possibly make it so user can adjust them)
  int numOfTimes = 36; //how many times to be shown (try to make adjustable by user)
  int timeIntervals = 30; //how much time in between the intervals (in mins)
  String startTime = "2022-02-05 08:00:00"; //starts the time at 8am

  strokeWeight(1);
  int textSizeTimes = (int)(26*40/numOfTimes); //for adjusting the size of the text as more Times are added
  textSize(textSizeTimes);
  LocalDateTime firstDateTime = LocalDateTime.parse(startTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //extracts the date out of startTime
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm"); //the format of the displayed time
  for (int i = 0; i < numOfTimes; i++) {
    int timey = topTimes+26+(height-topTimes)/numOfTimes*i; //the 26 is the textSize
    text(firstDateTime.plusMinutes(i*timeIntervals).format(formatter), 8, timey); //writes the times
    line(0, timey+1, width, timey+1); //puts the lines in between the times
  }

  //Vertical Lines
  for (int i = -1; i < 8; i++) {
    strokeWeight(4);
    line((width-100)*i/7+100, topTimes, (width-100)*i/7+100, height);
  }
  line(100, topTimes, 100, height);

  //MONTH TITLE (make prettier pls and ty)
  textSize(70);
  textAlign(CENTER); //daycount%30
  text(firstSunday.plusDays(daycount).getMonth().toString() + " " + firstSunday.plusDays(daycount).getYear(), width/2, 60);
}
