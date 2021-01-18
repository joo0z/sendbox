package kr.or.ddit.attend.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.attend.service.AttendService;
import kr.or.ddit.attend.view.ExcelDownloadView2;
import kr.or.ddit.attend.vo.AttendVO;
import kr.or.ddit.attend.vo.MyAttendVO;
import kr.or.ddit.emp.vo.EmpVO;

@Controller
public class AttendController {
	
	private static final Logger logger = LoggerFactory.getLogger(AttendController.class);
	
	@Resource(name="attendService")
	AttendService attendService;
	
	@RequestMapping("/myattend")
	public String myattendView(Model model,AttendVO attendVO, HttpSession session) {
		
		logger.debug("attendVO 찍기.. {}",attendVO);
		EmpVO sessionVO = (EmpVO) session.getAttribute("EMP");
		Date nowDate = new Date();
		SimpleDateFormat yy = new SimpleDateFormat("yyyy");
		SimpleDateFormat mm = new SimpleDateFormat("MM");
		
		String year = yy.format(nowDate);
		String month = mm.format(nowDate);
		String attendDt = year + "-" + month;
		
		attendVO.setAttendDt(year+"/"+month);
		
		AttendVO inputVO = new AttendVO();
		inputVO.setAttendDt(attendDt);
		inputVO.setEmpId(sessionVO.getEmpId());
		
		logger.debug("inputVO ? {}",inputVO);
		Double myMonthPlusAttend = 0.0;
		Double myWeekPlusAttend = 0.0;
		Double myMonthAttend = 0.0;
		Double myWeekAttend = 0.0;
		
		try {
			// 이번달 추가 근무시간
			myMonthPlusAttend = attendService.myMonthPlusAttend(inputVO);
			// 이번주 추가 근무시간
			myWeekPlusAttend = attendService.myWeekPlusAttend(inputVO);
			// 이번달 근무시간
			myMonthAttend = attendService.myMonthAttend(inputVO);
			// 이번주 근무시간
			myWeekAttend = attendService.myWeekAttend(inputVO);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		logger.debug("시간들 {},{},{},{}",myMonthPlusAttend,myWeekPlusAttend,myMonthAttend,myWeekAttend);
		
		MyAttendVO myAttendVO = new MyAttendVO();
		
		// 이번달 근무 시간
		myAttendVO.setMHour((int) Math.floor(myMonthAttend));
		// 이번달 근무 분
		myAttendVO.setMMinute((int) Math.round((myMonthAttend - Math.floor(myMonthAttend))*60));
		// 이번달 초과 근무 시간
		myAttendVO.setMPHour((int) Math.floor(myMonthPlusAttend));
		// 이번달 초과 근무 분
		myAttendVO.setMPMinute((int) Math.round((myMonthPlusAttend - Math.floor(myMonthPlusAttend))*60));
		// 이번주 근무 시간
		myAttendVO.setWHour((int) Math.floor(myWeekAttend));
		// 이번주 근무 분
		myAttendVO.setWMinute((int) Math.round((myWeekAttend - Math.floor(myWeekAttend))*60));
		// 이번주 초과 근무 시간
		myAttendVO.setWPHour((int) Math.floor(myWeekPlusAttend));
		// 이번주 초과 근무 분
		myAttendVO.setWPMinute((int) Math.round((myWeekPlusAttend - Math.floor(myWeekPlusAttend))*60));
		
		logger.debug("myAttendVO ??????????????????????? {}",myAttendVO);
		
		model.addAttribute("myAttendVO",myAttendVO);
		
		List<AttendVO> attendList = null;
		try {
			attendList = attendService.getAttendList(attendVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("attendList",attendList);
		
		return "tiles/attend/attend";
		
		
	}
	
	
	  
	@RequestMapping("/excelDown")
	public void listExcel(HttpServletRequest request, HttpServletResponse response, AttendVO attendVo, ModelMap modelMap,HttpSession session)
			throws Exception{
 
		EmpVO vo = (EmpVO) session.getAttribute("EMP");
		// 그냥 평소에 마이바티스에서 데이터 뽑는 방법으로 데이터를 가져온다.
		List<AttendVO> dataList = attendService.selectAttend(attendVo);
		logger.debug("dataList : {}",dataList);
		// 받은 데이터를 맵에 담는다.
		Map<String, Object> beans = new HashMap<String, Object>();
		beans.put("dataList", dataList);
		beans.put("name", vo.getEmpNm());

		// 엑셀 다운로드 메소드가 담겨 있는 객체
		ExcelDownloadView2 me = new ExcelDownloadView2();

		me.download(request, response, beans, attendVo.getEmpId() +"attend", "attend.xlsx", "무시해도됨");
		
	}
	
	@RequestMapping(value="/selectAttend", method=RequestMethod.POST)
	public String selectAttend(Model model,String year, String month,HttpSession session) {
		EmpVO empVo = (EmpVO) session.getAttribute("EMP");
		String date = year+"/"+month;
		logger.debug("date : {}",date);
		AttendVO vo = new AttendVO();
		vo.setAttendDt(date);
		vo.setEmpId(empVo.getEmpId());
		List<AttendVO> attendList = null;
		logger.debug("getAttendDt : {}",vo.getAttendDt());
		logger.debug("getEmpId : {}",vo.getEmpId());
		
		AttendVO inputVO = new AttendVO();
		inputVO.setAttendDt(year+"-"+month);
		inputVO.setEmpId(empVo.getEmpId());
		
		logger.debug("inputVO ? {}",inputVO);
		Double myMonthPlusAttend = 0.0;
		Double myMonthAttend = 0.0;
		
		try {
			// 이번달 추가 근무시간
			myMonthPlusAttend = attendService.myMonthPlusAttend(inputVO);
			// 이번달 근무시간
			myMonthAttend = attendService.myMonthAttend(inputVO);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		logger.debug("시간들 {},{},{},{}",myMonthPlusAttend,myMonthAttend);
		
		MyAttendVO myAttendVO = new MyAttendVO();
		
		// 이번달 근무 시간
		myAttendVO.setMHour((int) Math.floor(myMonthAttend));
		// 이번달 근무 분
		myAttendVO.setMMinute((int) Math.round((myMonthAttend - Math.floor(myMonthAttend))*60));
		// 이번달 초과 근무 시간
		myAttendVO.setMPHour((int) Math.floor(myMonthPlusAttend));
		// 이번달 초과 근무 분
		myAttendVO.setMPMinute((int) Math.round((myMonthPlusAttend - Math.floor(myMonthPlusAttend))*60));
		
		logger.debug("myAttendVO ??????????????????????? {}",myAttendVO);
		
		model.addAttribute("myAttendVO",myAttendVO);
		
		
		
		try {
			attendList = attendService.selectAttend(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("attendList : {}",attendList);
		
		model.addAttribute("attendList",attendList);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		
		return "tiles/attend/selectAttend";
	}

	@RequestMapping("/chartTest")
	public String charTest() {
		return "/attend/chart";
	}

	
}
