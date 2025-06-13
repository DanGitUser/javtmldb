package mapper;

import java.util.List;

import domain.Board;
import domain.Member;

public interface BoardMapper {

	List<Board> list();
	
	Board selectOne(Long bno);
	
	int insert(Long no);	
	
	int delete(Long rno);
	
	int update(Long board);

	
}
