package domain;

import org.apache.ibatis.type.Alias;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
@Alias("board")
public class Board {
	
	private Long bno; // 게시글 번호
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private String id; // 사용자 아이디
	private String regdate; // 작성 일자
	private String moddate; // 수정 일자
	private Integer cnt; // 조회 수
	private Integer cno; // 목록 번호
	
}
