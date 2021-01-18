package kr.or.ddit.test;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDaoImpl {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;
	
	public MemberVO getMember(String userId) {
		return sqlSession.selectOne("member.getMember", userId);
	}

}
