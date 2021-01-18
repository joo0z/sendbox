package kr.or.ddit.emp.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.business.schedule.vo.DeptVO;
import kr.or.ddit.emp.dao.EmpMapper;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.emp.vo.JobVO;

@Service("empService")
public class EmpService {
	
	@Resource(name="empMapper")
	private EmpMapper empMapper;
	
	public EmpVO getEmp(EmpVO empVO) throws Exception {
		return empMapper.getEmp(empVO);
	}
	
	public EmpVO getEmpDept(EmpVO empVO) throws Exception {
		return empMapper.getEmpDept(empVO);
	}
	
	public int updateMypage(EmpVO empVo) throws Exception {
		return empMapper.updateMypage(empVo);
	}
	
	public List<EmpVO> empList(EmpVO empVo) throws Exception {
		return empMapper.empList(empVo);
	}

	public int insertEmp(EmpVO empVo) throws Exception {
		return empMapper.insertEmp(empVo);
	}
	
	public int updateEmp(EmpVO empVo) throws Exception {
		return empMapper.updateEmp(empVo);
	}
	
	public int selectEmpTotCnt(EmpVO empVo) throws Exception{
		return empMapper.selectEmpTotCnt(empVo);
	}
	
	public List<DeptVO> deptList() throws Exception{
		return empMapper.deptList();
	}
	
	public List<JobVO> jobList() throws Exception{
		return empMapper.jobList();
	}
	
	public EmpVO managerIdList(EmpVO empVo) throws Exception{
		return empMapper.managerIdList(empVo);
	}
	
	public DeptVO getdeptId(EmpVO empVo) throws Exception{
		return empMapper.getdeptId(empVo);
	}

}
