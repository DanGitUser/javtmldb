package mapper;

import java.util.List;

import domain.Board;
import domain.dto.Criteria;

public interface BoardMapper {

	List<Board> list(Criteria cri);
	
	Board selectOne(Long bno);
	
	void insert(Board board);	
	
	void update(Board board);

	long getCount(Criteria cri);

    void delete(Long bno);

}
