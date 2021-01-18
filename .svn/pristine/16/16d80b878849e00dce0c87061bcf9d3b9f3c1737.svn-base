package kr.or.ddit.salary.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.salary.vo.SalaryReVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Mapper("salaryMapperDao")
public interface SalaryMapperDao {
	List<SalaryVO> getSalaryList(SalaryVO vo) throws Exception;
	
	SalaryVO getSalary(SalaryVO vo) throws Exception;
	
	List<String> selectAllId() throws Exception;
	
	String getMonthSalary(Map<String, String> maps) throws Exception;
	
	int salaryCal(SalaryVO salaryVO) throws Exception;
	
	List<SalaryReVO> selectMonList(SalaryVO salaryVO) throws Exception;

	int selectCnt(SalaryVO salaryVO) throws Exception;

	List<SalaryReVO> selectMonExcel(SalaryVO salaryVO) throws Exception;
	
	int salaryStUpdate(SalaryVO salaryVO) throws Exception;

	String selectBasicSal(String empId) throws Exception;
	
	SalaryReVO selectEmpMonthSalary(Map<String, String> maps) throws Exception;
}
