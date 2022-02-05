import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.time.LocalDate;
void setup() {
  size(1920, 1080);
  Calendar cal = new GregorianCalendar();

  String todaydate = "2022-02-05"; //find way to automate
  for (int j = 0; j < 5; j++) { //5 weeks per month calendar
    for (int i = 0; i < 7; i++) { //7 days per week

      text(todaydate, width*i/7+width/16, height*(j)/5+20); //idsplays the dates
      todaydate = addOneDay(todaydate);
    }
  }
}

static public String addOneDay(String date) {
  return LocalDate.parse(date).plusDays(1).toString();
}
