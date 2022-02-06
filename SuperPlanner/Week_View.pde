import java.time.format.*;

public void Week_View() {
  fill(0);
  
  //DISPLAY DATES
  int topTimes = 140; //location for where topmost time is shown
  textSize(26);
  LocalDate firstdate = LocalDate.now();
  firstdate = firstdate.withDayOfMonth(1);
  LocalDate firstSunday = firstdate.with(firstInMonth(DayOfWeek.SUNDAY));
  int daycount = -7;
  for (int i = 0; i < 7; i++) { //7 days per week
    text(firstSunday.plusDays(daycount).getDayOfMonth(), width*i/7+width/20, topTimes-26); //dsplays the dates
    daycount++;
  }

  //WEEKDAY TITLES
  text("                SUNDAY             MONDAY               TUESDAY              WEDNENDSAY             THURSDAY             FRIDAY             SATURDAY", 50, topTimes-26); //can be made more sophisticated

  //Times
  //Adjustable variables (possibly make it so user can adjust them)
  int numOfTimes = 48; //how many times to be shown (try to make adjustable by user)
  int timeIntervals = 30; //how much time in between the intervals (in mins)
  String startTime = "2022-02-05 06:00:00"; //starts the time at 6am
  
  int textSizeTimes = (int)(26*40/numOfTimes); //for adjusting the size of the text as more Times are added
  textSize(textSizeTimes);
  LocalDateTime firstDateTime = LocalDateTime.parse(startTime,DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //extracts the date out of startTime
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm"); //the format of the displayed time
  for (int i = 0; i < numOfTimes; i++) {
    text(firstDateTime.plusMinutes(i*timeIntervals).format(formatter), 20, topTimes+26+(height-topTimes)/numOfTimes*i); //the 26 is the textSize
  }

  //BOXES
  for (int i = -1; i < 8; i++) {
    strokeWeight(4);
    line(width*i/7+width/7, 200, width*i/7+width/7, height);
  }

  //MONTH TITLE (make prettier pls and ty)
  textSize(70);
  textAlign(CENTER);
  text(firstdate.getMonth().toString(), width/2, 60);
}
