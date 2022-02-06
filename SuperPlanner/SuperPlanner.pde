import java.time.*;
import static java.time.temporal.TemporalAdjusters.firstInMonth;
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();

void setup() {
  size(1920, 1080);

  Month_View();
  initLayout();
}

void draw() {
  for(TEXTBOX t : textboxes) {
     t.DRAW(); 
  }
}
