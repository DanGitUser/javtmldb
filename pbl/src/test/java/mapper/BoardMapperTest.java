package mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.Board;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class BoardMapperTest {
    
    private BoardMapper boardMapper = MybatisUtil.getSqlSession().getMapper(BoardMapper.class);
    
    @Test
    public void addTest() {
        int result = 1 + 1;
        assertEquals(2, result);
    }
    
    @Test
    public void testSelectOne() {
        // Given
        Long bno = 1L;
        // When
        Board board = boardMapper.selectOne(bno);
        
        // Then ~ Actual, Expect
        assertNotNull(board);
        
        log.info("{}", board);
    }
    
    @Test
    @DisplayName("view page three, 10 at a time, Category 2")
    public void testList() {
        Criteria cri = new Criteria(3, 10, 2, "TC", "새똥이");
        log.info(Arrays.toString(cri.getTypes()));
        List<Board> list = boardMapper.list(cri);
        list.forEach(b -> log.info("{}", b.getTitle()));
    }
    
    @Test
    @DisplayName("update test")
    public void testUpdate() {
        Long bno = 700L;
        Board board = boardMapper.selectOne(bno);
        board.setTitle("Title edit only");
        
        boardMapper.update(board);
    }
}
