package kr.or.ddit.dept.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.businessTree.vo.BusinessTreeVO;
import kr.or.ddit.dept.service.DeptService;
import kr.or.ddit.dept.vo.DeptVO;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.jobTitle.vo.JobTitleVO;

@Controller
public class DeptController {

	
	@Resource(name = "deptService")
	private DeptService deptService;
	
	
	@RequestMapping("/dept/deptManage")
	public String deptManageView(Model model) {
		
		
		List<DeptVO> deptTreeList = deptService.selectDeptTreeList();
		List<EmpVO> empList = deptService.selectAllEmpList();
		
		List<JobTitleVO> empJobInfoList = null;
		List<DeptVO> empDeptInfoList = null;
		
		if(empList != null && empList.size() > 0) {
			
			empJobInfoList = new ArrayList<JobTitleVO>();
			empDeptInfoList = new ArrayList<DeptVO>();
			
			for(EmpVO dbEmp : empList) {
				JobTitleVO empJobInfo = new JobTitleVO();
				empJobInfo.setEmpId(dbEmp.getEmpId());
				JobTitleVO dbEmpJobInfo = deptService.selectEmpJobInfo(empJobInfo);
				empJobInfoList.add(dbEmpJobInfo);
				
				DeptVO empDeptInfo = new DeptVO();
				empDeptInfo.setDeptId(dbEmp.getDeptId());
				DeptVO dbEmpDeptInfo = deptService.selectEmpDeptInfo(empDeptInfo);
				empDeptInfoList.add(dbEmpDeptInfo);
			}
		}
		
		model.addAttribute("deptList", deptTreeList);
		model.addAttribute("empList", empList);
		model.addAttribute("empJobInfoList", empJobInfoList);
		model.addAttribute("empDeptInfoList", empDeptInfoList);
		return "tiles/dept/deptManageView";
	}
	
	
	@RequestMapping("/dept/deptManageTree")
	public String deptManageTreeList(Model model) {
		
		List<BusinessTreeVO> busiTreeList = deptService.selectBusinessTreeList();
		List<DeptVO> deptTreeList = deptService.selectDeptTreeList();
		
		model.addAttribute("deptTreeList", deptTreeList);
		model.addAttribute("busiTreeList", busiTreeList);
		
		return "jsonView";
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/dept/creatDept")
	public String creatDept(DeptVO deptVO) {
		int creatDeptRes = deptService.creatDept(deptVO);
		return "redirect:/dept/deptManage";
	}
	
	
	
	
	
	
	
}
