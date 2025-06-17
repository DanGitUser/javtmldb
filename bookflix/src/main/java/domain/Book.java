package domain;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Book {

	private Integer bno;
	private String name;
	private String writer;
	private String publisher;
	private Integer pages;
	private String regdate;
	
}
