package kr.or.ddit.findidpw.dao;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.findidpw.vo.EmpVO;

@Mapper("findIdPwMapper")
public interface FindIdPwMapper {
	EmpVO getEmp(EmpVO empVO) throws Exception;
	
	int updatePass(EmpVO empVO) throws Exception;
}
