import java.time.*;
import static java.time.temporal.TemporalAdjusters.firstInMonth;

void setup() {
  size(1920, 1080);
  
  
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
  
  //MONTH TITLE (make prettier pls and ty)
  textSize(100);
  textAlign(CENTER);
  text(firstdate.getMonth().toString(), width/2, 110);
}
