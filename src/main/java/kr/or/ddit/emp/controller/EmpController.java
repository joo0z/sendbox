package kr.or.ddit.emp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.sun.org.apache.xpath.internal.operations.Mod;

import kr.or.ddit.business.schedule.vo.DeptVO;
import kr.or.ddit.comm.vo.PaginationVO;
import kr.or.ddit.emp.service.EmpHistoryService;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpHistoryVO;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.emp.vo.JobVO;

@Controller
public class EmpController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmpController.class);
	
	
	@Resource(name="empService")
	EmpService empService;
	
	@Resource(name="empHistoryService")
	EmpHistoryService empHistoryService;
	
	@RequestMapping("/mypage")
	public String mypageView(Model model,EmpVO empVo) {
		logger.debug("마이페이지 empVo : {}", empVo);
		
		EmpVO empVo2 =null;
		try {
			empVo2 = empService.getEmp(empVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("emp",empVo2);
		
		return "tiles/emp/mypage";
	}

	@RequestMapping("/updatemypage")
	public String updatemypageView(String empId,Model model) {
		EmpVO empVo = new EmpVO();
		empVo.setEmpId(empId);
		
		EmpVO empVo2 =null;
		try {
			empVo2 = empService.getEmp(empVo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		logger.debug("updatemypage empVo2 : {}",empVo2);
		model.addAttribute("emp",empVo2);
		
		return "tiles/emp/updatemypage";
	}
	
	@RequestMapping(path = "/updatemypage", method = RequestMethod.POST)
	public String updatemypage(EmpVO empVo, @RequestPart("picture") MultipartFile profile,Model model) {
		
		logger.debug("수정 컨트롤러 진입");
		logger.debug("empVo : {}", empVo);
		EmpVO empVo2 =null;
		try {
			empVo2 = empService.getEmp(empVo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		logger.debug("empVo2 : {}",empVo2);
		
		
		String realFileName = profile.getOriginalFilename();
		String ext = FileUploadUtil.getExtension(realFileName);
		String fileName = "";
		String fileName2 = "";
		if (profile.getSize() > 0) {
			fileName = "D:\\profile\\" + UUID.randomUUID().toString() + "." + ext;
			File file = new File(fileName);
			try {
				profile.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			empVo.setFilepath(fileName);
			empVo.setRealfilename(realFileName);

		} else {
			fileName = empVo2.getFilepath();
			fileName2 = empVo2.getRealfilename();

			empVo.setFilepath(fileName);
			empVo.setRealfilename(fileName2);
		}

		try {
			empService.updateMypage(empVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("emp",empVo);
		
		
		return "redirect:/mypage?empId=" + empVo2.getEmpId();
	}

	@RequestMapping("/profileImgView")
	public String profileImgView(String empId, Model model) throws IOException {
		logger.debug("프로필아이디: {} ", empId);
		// 응답으로 생성하려고 하는 것 : 이미지 파일을 읽어서 output stream객체에 쓰는것
		EmpVO empVo = new EmpVO();
		empVo.setEmpId(empId);
		logger.debug("프로필아이디2: {} ", empVo.getEmpId());
		
		EmpVO empVo2 = null;
		try {
			empVo2=empService.getEmp(empVo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.debug("프로필경로: {} ", empVo2.getFilepath());

		model.addAttribute("filepath", empVo2.getFilepath());

		return "profileImgView";
	}

	@RequestMapping("/memoView")
	public String memoView() {
		return "main/memo";
	}

	@RequestMapping("/attend")
	public String attendView() {

		return "tiles/emp/attend";
	}
	
	@RequestMapping("/salary")
	public String salaryView() {
		
		return "tiles/emp/salary";
	}
	
	@RequestMapping("/mail")
	public String mailView() {
		
		return "tiles2/emp/mail";
	}
	
	@RequestMapping("/empManage")
	public String empManage(Model model,EmpVO empVo,
			@RequestParam(name = "searchCondition", required = false) String searchCondition,
			 @RequestParam(name = "searchKeyword", required = false) String searchKeyword
			) {
		
		if(searchCondition != null) {
			empVo.setSearchCondition(searchCondition);
		}
		if(searchKeyword != null) {
			empVo.setSearchKeyword(searchKeyword);
		}
		
		
		empVo.setRecordCountPerPage(10);
//		empVo.setPageSize(10);
		logger.debug("empVo 정보 좀 보자: {}", empVo);
		List<EmpVO> list = null;
		int cnt = 1;
		try {
			list = empService.empList(empVo);
			cnt = empService.selectEmpTotCnt(empVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		PaginationVO pagination = new PaginationVO(empVo.getPageIndex(),
				empVo.getRecordCountPerPage(), empVo.getPageSize(), cnt);
		
		logger.debug("pagination 정보 좀 보자: {}", pagination);
		model.addAttribute("pagination", pagination);
		model.addAttribute("list",list);
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchCondition", searchCondition);
		
		return "tiles/emp/empManage";
	}

	@RequestMapping("/insertEmp")
	public String insertEmpView(Model model) {
		
		List<DeptVO> deptList = null;
		try {
			deptList = empService.deptList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("deptList", deptList);
		
		return "tiles/emp/insertEmp";
	}
	
	@RequestMapping(path = "/insertEmp", method = RequestMethod.POST)
	public String insertEmp(EmpVO empVo,EmpHistoryVO vo,@RequestPart("picture") MultipartFile profile,Model model) {
		
		logger.debug("insertEmp empVo : {}",empVo);
		
		EmpVO managerId = null;
		DeptVO deptId = null;
		
		try {
			managerId = empService.managerIdList(empVo);
			deptId = empService.getdeptId(empVo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		empVo.setManagerId(managerId.getEmpId());
		logger.debug("managerId : {}",managerId.getManagerId());
		
		
		logger.debug("getUpperDeptId : {}",deptId.getUpperDeptId());
		
		if(empVo.getDeptId().equals("0002") || deptId.getUpperDeptId().equals("0002")) {
			empVo.setAuthLv("2");
		}else{
			if(empVo.getJobtitleId().equals("0") || empVo.getJobtitleId().equals("1")) {
				empVo.setAuthLv("0");
			}else if(empVo.getJobtitleId().equals("2") || empVo.getJobtitleId().equals("3")) {
				empVo.setAuthLv("1");
			}else if(empVo.getJobtitleId().equals("4")) {
				empVo.setAuthLv("3");
			}
		}
		
		
		String realFileName = profile.getOriginalFilename();
		String ext = FileUploadUtil.getExtension(realFileName);
		String fileName = "";
		if (profile.getSize() > 0) {
			fileName = "D:\\profile\\" + UUID.randomUUID().toString() + "." + ext;
			File file = new File(fileName);
			try {
				profile.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}

		
		empVo.setFilepath(fileName);
		empVo.setRealfilename(realFileName);
		
		try {
			empService.insertEmp(empVo);
			empHistoryService.insertEmpHistory(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<EmpVO> list = null;
		try {
			list = empService.empList(empVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("list",list);

		return "redirect:/empManage";
	}
	
	@RequestMapping("/emp")
	public String empView(String empId, Model model) {
		EmpVO empVo = new EmpVO();
		empVo.setEmpId(empId);
		EmpVO empVo2 = null;
		try {
			empVo2 = empService.getEmpDept(empVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("emp", empVo2);
		
		
		
		return "tiles/emp/emp";
	}
	
	@RequestMapping("/updateEmp")
	public String updateEmpView(String empId, Model model) {
		EmpVO empVo = new EmpVO();
		empVo.setEmpId(empId);
		EmpVO empVo2 = null;
		List<DeptVO> deptList = null;
		List<JobVO> jobList = null;
		try {
			empVo2 = empService.getEmp(empVo);
			deptList = empService.deptList();
			jobList = empService.jobList();
			logger.debug("deptId : {}????????????????????????",empVo2.getDeptId());
			logger.debug("deptList : {}?????????????????????????????????????????",deptList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("emp", empVo2);
		model.addAttribute("deptList",deptList);
		model.addAttribute("jobList",jobList);
		return "tiles/emp/updateEmp";
	}
	
	@RequestMapping(path = "/updateEmp", method = RequestMethod.POST)
	public String updateEmp(EmpVO empVo, EmpHistoryVO vo,Model model) {
		logger.debug("updateEmp empVo : {}",empVo);
		
		EmpVO managerId = null;
		DeptVO deptId = null;
		
		try {
			managerId = empService.managerIdList(empVo);
			deptId = empService.getdeptId(empVo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		empVo.setManagerId(managerId.getEmpId());
		logger.debug("managerId : {}",managerId.getManagerId());
		
		
		logger.debug("getUpperDeptId : {}",deptId.getUpperDeptId());
		
		if(empVo.getDeptId().equals("0002") || deptId.getUpperDeptId().equals("0002")) {
			empVo.setAuthLv("2");
		}else{
			if(empVo.getJobtitleId().equals("0") || empVo.getJobtitleId().equals("1")) {
				empVo.setAuthLv("0");
			}else if(empVo.getJobtitleId().equals("2") || empVo.getJobtitleId().equals("3")) {
				empVo.setAuthLv("1");
			}else if(empVo.getJobtitleId().equals("4")) {
				empVo.setAuthLv("3");
			}
		}
		
		
		
		try {
			empService.updateEmp(empVo);
			empHistoryService.updateEmpHistory(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("emp",empVo);
		
		
		return "redirect:/emp?empId="+empVo.getEmpId();
	}
	
	@RequestMapping("/signTest")
	public String signTest() {
		return "tiles/emp/test";
	}
}
