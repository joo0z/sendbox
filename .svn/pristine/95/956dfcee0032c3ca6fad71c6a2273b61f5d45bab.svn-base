package kr.or.ddit.memo.dao;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.or.ddit.memo.vo.MemoVO;

public class MemoMapperTest {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {
				"/kr/or/ddit/config/egovframework/spring/context-common.xml"
			 , "/kr/or/ddit/config/egovframework/spring/context-datasource.xml"
			 , "/kr/or/ddit/config/egovframework/spring/context-mapper.xml"
		});
		
		
		MemoMapper memoMapper = (MemoMapper)context.getBean("memoMapper");
		try {
			List<MemoVO> list = memoMapper.retrieveList(new MemoVO());
			for(MemoVO listMemoVO:list) {
				System.out.println(listMemoVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
