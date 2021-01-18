package kr.or.ddit.sign.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.sign.dao.SignMapper;
import kr.or.ddit.sign.vo.SignVO;

@Service("signService")
public class SignService{
	
	@Resource(name="signMapper")
	private SignMapper signMapper;

	public SignVO getSign(String empId) throws Exception{
		return signMapper.getSign(empId);
	}
	
	public int insertSign(String empId) throws Exception{
		return signMapper.insertSign(empId);
	}
	
	public int updateSign(SignVO signVO) throws Exception{
		return signMapper.updateSign(signVO);
	}
}