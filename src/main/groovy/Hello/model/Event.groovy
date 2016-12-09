package Hello.model;

import org.springframework.data.annotation.Id;
import java.util.Date;

public class Event {
  @Id
  private String id;

  private String name;
  private Integer numberLimit;
  private String mainPhoto;
  private String introduction;

  private Date startAt;
  private Date endAt;
}
