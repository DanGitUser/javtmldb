package domain;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
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
    
    public Board(Long bno, String title, String content, String id, String regdate, String moddate, Integer cnt,
            Integer cno) {
        super();
        this.bno = bno;
        this.title = title;
        this.content = content;
        this.id = id;
        this.regdate = regdate;
        this.moddate = moddate;
        this.cnt = cnt;
        this.cno = cno;
    }
    
    
    
}
