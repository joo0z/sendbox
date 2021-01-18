package kr.or.ddit.emp.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.business.schedule.vo.DeptVO;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.emp.vo.JobVO;

@Mapper("empMapper")
public interface EmpMapper {
	EmpVO getEmp(EmpVO empVO) throws Exception;
	
	EmpVO getEmpDept(EmpVO empVO) throws Exception;
	
	int updateMypage(EmpVO empVo) throws Exception;
	
	List<EmpVO> empList(EmpVO empVo) throws Exception;
	
	int insertEmp(EmpVO empVo) throws Exception;
	
	int updateEmp(EmpVO empVo) throws Exception;
	
	int selectEmpTotCnt(EmpVO empVo) throws Exception;
	
	List<DeptVO> deptList() throws Exception;
	
	List<JobVO> jobList() throws Exception;
	
	EmpVO managerIdList(EmpVO empVO) throws Exception;
	
	DeptVO getdeptId(EmpVO empVO) throws Exception;
}
