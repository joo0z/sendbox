package kr.or.ddit.emp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.emp.dao.EmpHistoryMapper;
import kr.or.ddit.emp.vo.EmpHistoryVO;

@Service("empHistoryService")
public class EmpHistoryService {
	
	@Resource(name="empHistoryMapper")
	private EmpHistoryMapper empHistoryMapper;
	
	public int insertEmpHistory(EmpHistoryVO vo) throws Exception {
		return empHistoryMapper.insertEmpHistory(vo);
	}
	
	public int updateEmpHistory(EmpHistoryVO vo) throws Exception {
		return empHistoryMapper.updateEmpHistory(vo);
	}

}
