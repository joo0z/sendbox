package kr.or.ddit.salary.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.salary.dao.SalaryMapperDao;
import kr.or.ddit.salary.vo.SalaryReVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Service("salaryService")
public class SalaryService{
	
	private static final Logger logger = LoggerFactory.getLogger(SalaryService.class);
	
	@Resource(name="salaryMapperDao")
	private SalaryMapperDao salaryMapperDao;
	
	public List<SalaryVO> getSalaryList(SalaryVO vo) throws Exception {
		return salaryMapperDao.getSalaryList(vo);
	}
	
	public SalaryVO getSalary(SalaryVO vo) throws Exception {
		return salaryMapperDao.getSalary(vo);
	}
	
	public List<String> selectAllId() throws Exception {
		return salaryMapperDao.selectAllId();
	}
	
	public String getMonthSalary(Map<String, String> maps) throws Exception{
		return salaryMapperDao.getMonthSalary(maps);
	}
	
	public int salaryCal(SalaryVO salaryVO) throws Exception{
		return salaryMapperDao.salaryCal(salaryVO);
	}
	
	public List<SalaryReVO> selectMonList(SalaryVO salaryVO) throws Exception {
		return salaryMapperDao.selectMonList(salaryVO);
	}
	
	public int selectCnt(SalaryVO salaryVO) throws Exception{
		return salaryMapperDao.selectCnt(salaryVO);
	}
	
	public List<SalaryReVO> selectMonExcel(SalaryVO salaryVO) throws Exception {
		return salaryMapperDao.selectMonExcel(salaryVO);
	}
	
	public int salaryStUpdate(SalaryVO salaryVO) throws Exception {
		return salaryMapperDao.salaryStUpdate(salaryVO);
	}
	
	public String selectBasicSal(String empId) throws Exception {
		return salaryMapperDao.selectBasicSal(empId);
	}
	
	public SalaryReVO selectEmpMonthSalary(Map<String, String> maps) throws Exception{
		return salaryMapperDao.selectEmpMonthSalary(maps);
	}
}
