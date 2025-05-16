package service;

import dao.MemberDao;
import domain.Member;

public class MemberService {
	
	private MemberDao memberDao = new MemberDao();
	
	public void register(Member member) {
		memberDao.insert(member);
	}
	
	public Member findBy(String id) {
		return memberDao.selectOne(id);
	}
}
