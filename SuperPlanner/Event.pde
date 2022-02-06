
public class Event {
  String eName;
  LocalDateTime dateTime;
  LocalDate date;

  Event(String eName, LocalDateTime dateTime, LocalDate date) {
    this.eName = eName;
    this.dateTime = dateTime;
    this.date = date;
  }
}
