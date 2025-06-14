package domain;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Member {
	
	private final Long no;
	private final String id, pw, name;
	private final Date regDate;
	
}
