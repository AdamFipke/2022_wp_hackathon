import java.util.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.time.LocalDate;
void setup() {
  size(1920, 1080);
  Calendar cal = new GregorianCalendar();
  
  textSize(18);
  String todaydate = LocalDate.now().toString(); 
  LocalDate firstdate = LocalDate.now();
  
  for (int j = 0; j < 5; j++) { //5 weeks per month calendar
    for (int i = 0; i < 7; i++) { //7 days per week
      text(todaydate.charAt(8) +""+ todaydate.charAt(9), width*i/7+width/8, (height-200)*(j)/5+220); //dsplays the dates
      todaydate = addOneDay(todaydate);
    }
  }
  
  //MONTH TITLE
  textSize(100);
  textAlign(CENTER);
  text(firstdate.getMonth().toString(), width/2, 110);
}

static public String addOneDay(String date) { 
  return LocalDate.parse(date).plusDays(1).toString();
}
