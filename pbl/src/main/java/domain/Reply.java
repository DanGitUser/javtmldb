package domain;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("Reply")
public class Reply {
	
	private Long rno;
	private String content;
	private String id;
	private String regdate;
	private Long bno;
	
}
