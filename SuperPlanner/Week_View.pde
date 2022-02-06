import java.time.format.*; //<>//

public void Week_View() {
  fill(0);
  stroke(0);

  //Times
  //Adjustable variables (possibly make it so user can adjust them)
  int numOfTimes = 36; //how many times to be shown (try to make adjustable by user)
  int timeIntervals = 30; //how much time in between the intervals (in mins)
  String startTime = "2022-02-05 08:00:00"; //starts the time at 8am

  int topTimes = 140; //location for where topmost time is shown
  strokeWeight(1);
  int textSizeTimes = (int)(26*40/numOfTimes); //for adjusting the size of the text as more Times are added
  textSize(textSizeTimes);
  LocalDateTime firstDateTime = LocalDateTime.parse(startTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")); //extracts the date out of startTime
  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm"); //the format of the displayed time
  for (int i = 0; i < numOfTimes; i++) {
    int timey = topTimes+(height-topTimes)/numOfTimes*i; //the 26 is the textSize
    text(firstDateTime.plusMinutes(i*timeIntervals).format(formatter), 45, timey+26); //writes the times
    line(0, timey+1, width, timey+1); //puts the lines in between the times
  }
  int rowGirth = (topTimes+26+(height-topTimes)/numOfTimes*2)-(topTimes+26+(height-topTimes)/numOfTimes); //timey2 - timey1
  for (int i = 1; i < numOfTimes; i+=2) { //alternating lines
    strokeWeight(1);
    stroke(0);
    fill(150, 150, 150, 30);
    rect(0, topTimes+i*rowGirth, width, rowGirth);
  }
  for (int i = 0; i < numOfTimes; i+=2) {
    fill(230, 230, 230, 30);
    rect(0, topTimes+i*rowGirth, width, rowGirth);
  }

  //DISPLAY DATES
  fill(0);
  textSize(26);
  LocalDate firstdate = LocalDate.now();
  firstdate = firstdate.withDayOfMonth(1);
  LocalDate firstSunday = firstdate.with(firstInMonth(DayOfWeek.SUNDAY));
  int daycount = week*7; //adjusting this will adjust the week (by multiples of 7), eg. -7 is the current week, 0 is next week etc.
  for (int i = 0; i < 7; i++) { //7 days per week
    text(firstSunday.plusDays(daycount).getDayOfMonth(), (width-100)/7*i+150, topTimes-26); //dsplays the dates
    int k = 0;
    while (events[k] != null) { //for every event
      if ((firstSunday.plusDays(daycount).getDayOfMonth() == events[k].date.getDayOfMonth()) && (firstSunday.plusDays(daycount).getMonth() == events[k].date.getMonth()) && (firstSunday.plusDays(daycount).getYear() == events[k].date.getYear())) { //if the event is has the same day, month, year
        int durationRectLength = 0; //how many time slots the event will take up
        int slotsBeforeStart = 0; //how many time slots before the start of the event
        int currentEventTime = (events[k].dateTime.getMinute()+events[k].dateTime.getHour()*60); //time (in total minutes) of the start of the current selected event
        for (int m = (firstDateTime.getMinute() + firstDateTime.getHour()*60)/timeIntervals; m*timeIntervals < 1440; m++) {//m represents every time slot from the start time to a full 24hours (1440 minutes)
          if ((currentEventTime <= m*timeIntervals) && (currentEventTime+events[k].durationMin > m*timeIntervals)) { //if the current time block is in between the start time and end time of the event
            durationRectLength++;
          } else if (currentEventTime > m*timeIntervals) { //if the current time block is still before the start of the event
            slotsBeforeStart++;
          }
        }
        fill(30, 30, 200, 50);
        rect(width*i/7+14, topTimes+slotsBeforeStart*rowGirth, width/7, durationRectLength*rowGirth); //display a rectangle idk
        fill(0);
        text(events[k].eName, width*i/7+150, topTimes+slotsBeforeStart*rowGirth+durationRectLength*rowGirth/2); //display event name
      }
      k++;
    }
    daycount++;
  }

  //WEEKDAY TITLES
  text("SUNDAY", (width-100)/7-10, topTimes-26);
  text("MONDAY", (width-100)/7*2-10, topTimes-26);
  text("TUESDAY", (width-100)/7*3-10, topTimes-26);
  text("WEDNESDAY", (width-100)/7*4-10, topTimes-26);
  text("THURSDAY", (width-100)/7*5-10, topTimes-26);
  text("FRIDAY", (width-100)/7*6-10, topTimes-26);
  text("SATURDAY", (width-100)/7*7-10, topTimes-26);



  //Vertical Lines
  for (int i = -1; i < 8; i++) {
    strokeWeight(4);
    line((width-100)*i/7+100, topTimes, (width-100)*i/7+100, height);
  }
  line(100, topTimes, 100, height);

  //MONTH TITLE (make prettier pls and ty)
  textSize(70);
  textAlign(CENTER); 
  text(firstSunday.plusDays(daycount).getMonth().toString() + " " + firstSunday.plusDays(daycount).getYear(), width/2, 60);
}
