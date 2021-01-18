package kr.or.ddit.loginout.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.attend.service.AttendService;
import kr.or.ddit.attend.vo.AttendVO;
import kr.or.ddit.business.schedule.vo.DeptVO;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;

@Controller
public class LoginController {
	
	@Resource(name="empService")
	EmpService empService;
	
	@Resource(name="attendService")
	AttendService attendService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@RequestMapping("/login/view")
	public String loginView() {
		return "login";
	}
	
	@RequestMapping(path="/login/process", method = RequestMethod.POST)
	public String process(EmpVO empVO, Model model, HttpSession session, HttpServletRequest request) {
		
		logger.debug("로그인 정보 - 아이디{}, 비번{}",empVO.getEmpId(),empVO.getPassword());
		logger.debug("아이피 정보 : {}",request.getRemoteAddr());
		EmpVO dbVO = null;
		try {
			dbVO = empService.getEmp(empVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(dbVO != null &&empVO.getPassword().equals(dbVO.getPassword())) {
			session.setAttribute("EMP", dbVO);
			
			SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");
			Date date = new Date();
			String day2 = day.format(date);
			String time2 = time.format(date);
			
			AttendVO attendVO = new AttendVO();
			
			attendVO.setEmpId(dbVO.getEmpId());
			attendVO.setAttendDt(day2);
			attendVO.setWorkTime(time2);
			attendVO.setHomeTime(time2);
			attendVO.setLoginIp(request.getRemoteAddr());
			
			model.addAttribute("msg","O");
			
			logger.debug("아이디 , 날짜, 시간 : {}, {}, {}",dbVO.getEmpId(),day2,time2);
			
			logger.debug("attendVO 정보 : {}",attendVO);
			
			AttendVO attendDBVO = null;
			DeptVO deptDBVO = null;
			try {
				deptDBVO = empService.getdeptId(dbVO);
				logger.debug("dept ????????????????????? {}",deptDBVO.getUpperDeptId());
				session.setAttribute("DEPT", deptDBVO);
				attendDBVO = attendService.getAttend(attendVO);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			logger.debug("attendDBVO 확인 : {}",attendDBVO);
			if(attendDBVO == null) {
			try {
				attendService.insertAttend(attendVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			}
			
		} else {
			model.addAttribute("msg","일치하는 회원정보가 없습니다.");
		}
		return "jsonView";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		
		SimpleDateFormat day = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat time = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date();
		String day2 = day.format(date);
		String time2 = time.format(date);
		
		AttendVO attendVO = new AttendVO();
		
		attendVO.setAttendDt(day2);
		attendVO.setEmpId(empVO.getEmpId());
		attendVO.setHomeTime(time2);
		try {
			attendService.updateAttend(attendVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		logger.debug("login session info : {}", session);
		
		
		session.invalidate();
		return "redirect:/login/view";
	}
}
