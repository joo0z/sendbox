package kr.or.ddit.findidpw.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.findidpw.dao.FindIdPwMapper;
import kr.or.ddit.findidpw.vo.EmpVO;

@Service("findIdPwService")
public class FindIdPwService {
	
	@Resource(name="findIdPwMapper")
	private FindIdPwMapper findIdPwMapper;
	
	public EmpVO getEmp(EmpVO empVO) throws Exception {
		return findIdPwMapper.getEmp(empVO);
	}
	

	public int updatePass(EmpVO empVO) throws Exception {
		return findIdPwMapper.updatePass(empVO);
	}
}
