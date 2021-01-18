package kr.or.ddit.dept.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.business.busiboard.vo.BusiBoardVO;
import kr.or.ddit.business.library.vo.LibEmpVO;
import kr.or.ddit.businessTree.vo.BusinessTreeVO;
import kr.or.ddit.dept.vo.DeptVO;
import kr.or.ddit.emp.vo.EmpHistoryVO;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.jobTitle.vo.JobTitleVO;

@Mapper("deptMapperDao")
public interface DeptMapperDao {

	List<BusinessTreeVO> selectBusinessTreeList() throws Exception;

	List<DeptVO> selectDeptTreeList() throws Exception;

	List<EmpVO> selectAllEmpList() throws Exception;

	JobTitleVO selectEmpJobInfo(JobTitleVO empJobInfo) throws Exception;

	DeptVO selectEmpDeptInfo(DeptVO empDeptInfo) throws Exception;

	DeptVO selectUpperDeptInfo(DeptVO deptVO) throws Exception;

	int insertDeptInfo(DeptVO deptVO) throws Exception;
	
	int insertBusiBoard(BusiBoardVO busiBoardVO) throws Exception;
	
	int insertBusiLibrary(LibEmpVO libEmpVO) throws Exception;

	EmpVO selectEmpInfo(EmpVO tempEmpInfo) throws Exception;

	int updateEmpHistoryInfo(EmpHistoryVO empHistoryVO) throws Exception;

	int insertEmpHistoryInfo(EmpHistoryVO empHistoryVO) throws Exception;

	int updateEmpInfo(EmpVO upEmpInfoVO) throws Exception;
	

}
