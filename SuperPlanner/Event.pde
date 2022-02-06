
public class Event {
  String eName;
  LocalDateTime dateTime;
  LocalDate date;
  int durationMin;

  Event(String eName, LocalDateTime dateTime, LocalDate date, int durationMin) {
    this.eName = eName;
    this.dateTime = dateTime;
    this.date = date;
    this.durationMin = durationMin;
  }
}
