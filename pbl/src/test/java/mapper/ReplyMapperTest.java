package mapper;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import domain.Reply;
import domain.dto.Criteria;
import lombok.extern.slf4j.Slf4j;
import util.MybatisUtil;

@Slf4j
public class ReplyMapperTest {

    private ReplyMapper replyMapper = MybatisUtil.getSqlSession().getMapper(ReplyMapper.class);
    
    @Test
    public void testSelectOne() {
        Long rno = 1L;
        Reply reply = replyMapper.selectOne(rno);
        assertNotNull(reply);
        log.info("{}", reply);
    }
    
    @Test
    @DisplayName("view replies on post 800")
    public void testList() {
        List<Reply> list = replyMapper.list(800L, null);
        list.forEach(r -> log.info("{}", r.getContent()));
    }
    
    @Test
    @DisplayName("update test")
    public void testUpdate() {
        Long rno = 3L;
        Reply reply = replyMapper.selectOne(rno);
        reply.setContent("Edited Comment 2");       
        replyMapper.update(reply);
    }
    
    @Test
    @DisplayName("Insert test")
    public void testInsert() {
        Reply reply = Reply.builder().content("content test insert").id("gitbaby").bno(800L).build();
        replyMapper.insert(reply);
    }
    
    @Test
    @DisplayName("delete test")
    public void testDelete() {
        Long rno = 7L;
        replyMapper.delete(rno);
        
    }
}
