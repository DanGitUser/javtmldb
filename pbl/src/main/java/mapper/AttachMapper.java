package mapper;

import java.util.List;

import domain.Attach;

public interface AttachMapper {

    void insert(Attach attach);
    List<Attach> list(Long bno);
    Attach selectOne(String uuid);
    Void delete(String uuid);
    void deleteByBno(Long bno);
    
}
