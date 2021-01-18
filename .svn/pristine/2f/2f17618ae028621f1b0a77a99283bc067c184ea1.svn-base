package kr.or.ddit.business.schedule.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.business.schedule.service.ScheduleService;
import kr.or.ddit.business.schedule.vo.DeptVO;
import kr.or.ddit.business.schedule.vo.ScheduleVO;
import kr.or.ddit.emp.vo.EmpVO;

@Controller
public class ScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Resource(name="scheduleService")
	ScheduleService scheduleService;
	
	@RequestMapping("/schedule")
	public String getSchedule(Model model,ScheduleVO scheVo) {
		logger.debug("schedule scheVo : {} ",scheVo);
		List<ScheduleVO> vo = null;
		try {
			vo = scheduleService.getSchedule(scheVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		logger.debug("보여줄 스케쥴 리스트 개수 ! schedule : {} ",vo.size());
//		logger.debug("첫번째 스케쥴 정보 ?! schedule : {} ",vo.get(0));
		model.addAttribute("showSchedule", vo);
		
		return "tiles/schedule/calendar";
	}
	
	@RequestMapping(value = "/addSchedule")
	public String addSchedule(ScheduleVO vo, HttpSession session, Model model) {
		EmpVO empVo = (EmpVO) session.getAttribute("EMP");
		vo.setDeptId(empVo.getDeptId());
		logger.debug("vo :{} ", vo);
		try {
			scheduleService.addSchedule(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jsonView";

	}
	
	@RequestMapping("/schedulePopup")
	public String schedulePopupView() {

		return "schedule/schedulePopup";
	}
	
	@RequestMapping("/selectSchedule")
	public String selectSchedule(String id,ScheduleVO vo, HttpSession session,Model model) {
		EmpVO empVo = (EmpVO) session.getAttribute("EMP");
		vo.setDeptId(empVo.getDeptId());
		vo.setSchedId(id);
		ScheduleVO vo2 = null;
		List<DeptVO> deptList = null;
		try {
			vo2 = scheduleService.selectSchedule(vo);
			deptList = scheduleService.getDeptList();
			for(int i=0;i<deptList.size();i++) {
				if(vo2.getDeptId().equals(deptList.get(i).getDeptId())) {
					vo2.setDeptId(deptList.get(i).getDeptName());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("스케줄 : {}", vo2);
		model.addAttribute("selectSchedule", vo2);
		
		return "schedule/select";
	}
	
	@RequestMapping("/deleteSchedule")
	public String deleteSchedule(ScheduleVO vo,HttpSession session) {
		logger.debug("deleteSchedule스케줄 : {}", vo);
		try {
			scheduleService.deleteSchedule(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "jsonView";
	}
	
	@RequestMapping("/updateScheduleView")
	public String updateScheduleView(ScheduleVO vo,HttpSession session, Model model) {
		logger.debug("updateScheduleView 스케줄 : {}", vo);
		
		ScheduleVO vo2 = null;
		try {
			vo2 = scheduleService.selectSchedule(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("updateScheduleView 스케줄 : {}", vo);
		model.addAttribute("schedule",vo2);
		
		return "schedule/scheduleUpdate";
	}
	
	@RequestMapping("/updateSchedule")
	public String updateSchedule(ScheduleVO vo, Model model) {
		logger.debug("updateSchedule 스케줄 : {}", vo);
		try {
			scheduleService.updateSchedule(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("updateSchedule 스케줄2222 : {}", vo);
		
		return "jsonView";
	}
	
}
