package kr.or.ddit.test;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl {
	
	@Resource(name = "memberDao")
	private MemberDaoImpl memberDao;
	
	public MemberVO getMember(String userId) {
		return memberDao.getMember(userId);
	}

}
