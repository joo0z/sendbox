package kr.or.ddit.business.meeting.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.business.meeting.service.MeetingService;
import kr.or.ddit.business.meeting.vo.MeetingVO;
import kr.or.ddit.business.meeting.vo.UsingVO;
import kr.or.ddit.business.schedule.service.ScheduleService;
import kr.or.ddit.business.schedule.vo.DeptVO;
import kr.or.ddit.emp.vo.EmpVO;

@Controller
public class MeetingController {
	private static final Logger logger = LoggerFactory.getLogger(MeetingController.class);

	@Resource(name = "meetingService")
	MeetingService meetingService;
	
	@Resource(name="scheduleService")
	ScheduleService scheduleService;

	@RequestMapping("/meeting")
	public String getMeeting(Model model) {
		List<MeetingVO> list = null;
		List<MeetingVO> list2 = null;
		List<UsingVO> usingList = null;
		try {
			list = meetingService.getMeeting();
			list2 = meetingService.revMeeting();
			usingList = meetingService.allMR();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for(int i=0;i<usingList.size();i++) {
			try {
				MeetingVO dbVO = meetingService.usingMR(usingList.get(i).getMeetroomId());
				if(dbVO == null) {
					usingList.get(i).setUsing("사용가능");
				} else {
					usingList.get(i).setUsing("사용중");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		model.addAttribute("using",usingList);
		model.addAttribute("showSchedule", list);
		model.addAttribute("show", list2);

		return "tiles/meeting/meeting";
	}
	
	@RequestMapping("/meeting/meetSchedulePopup")
	public String schedulePopupView() {

		return "meeting/meetSchedulePopup";
	}
	
//	@RequestMapping(value = "/addMeeting", method = RequestMethod.POST)
//	public String addSchedule(String scheduleData, HttpSession session){
//		try {
//			meetingService.getMeeting();
//		} catch (Exception e1) {
//			e1.printStackTrace();
//		}
//		
//		
//		scheduleData = scheduleData.replaceAll("\\{", "");
//		scheduleData = scheduleData.replaceAll("\\}", "");
//		scheduleData = scheduleData.replaceAll("\"", "");
//		
//		
//		String[] arr1 = scheduleData.split(",");
//		MeetingVO vo = new MeetingVO();
//		for(int i=0; i<arr1.length; i++) {
//	         String[] arr2 = arr1[i].split(":");
//	         
//	         if(i == 0) {
//	            vo.setMeetroomId(arr2[1]);
//	         } else if (i == 1) {
//	            vo.setReservStartDt(arr2[1]);
//	         } else if (i == 2) {
//	            String start = vo.getReservStartDt();
//	            start += " " + arr2[1];
//	            vo.setReservStartDt(start);
//	            vo.setStartTime(arr2[1]+":00");
//	         } else if ( i==3 ) {
//	            vo.setReservEndDt(arr2[1]);
//	         } else if (i ==4) {
//	            String end = vo.getReservEndDt();
//	            end += " " + arr2[1];
//	            vo.setReservEndDt(end);
//	            vo.setEndTime(arr2[1]+":00");
//	         }
//	      }
//		EmpVO empVo = (EmpVO) session.getAttribute("EMP");
//		vo.setDeptId(empVo.getDeptId());
//		try {
//			meetingService.addMeeting(vo);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "jsonView";
//	}
	
	@RequestMapping(value = "/addMeeting")
	public String addMeeting(MeetingVO vo ,HttpSession session,Model model){
		int cnt = 0;
		try {
			cnt = meetingService.checkMeeting(vo);
			logger.debug("cnt :{} ", cnt);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		if(cnt == 0) {
			EmpVO empVo = (EmpVO) session.getAttribute("EMP");
			vo.setDeptId(empVo.getDeptId());
			logger.debug("vo :{} ", vo);
			try {
				meetingService.addMeeting(vo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("msg", "성공");
			return "jsonView";
		}else {
			model.addAttribute("msg", "중복");
			return "jsonView";
		}
		
		
	}
	
	@RequestMapping("/selectMeeting")
	public String deleteMeeting(String id,MeetingVO vo, HttpSession session,Model model) {
		vo.setReservSeq(id);
		MeetingVO vo2 = null;
		try {
			vo2 = meetingService.selectMeeting(vo);
			logger.debug("meetingService스케줄 : {}", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("selectMeeting", vo2);
		
		return "meeting/selectMeeting";
	}
	
	@RequestMapping("/deleteMeeting")
	public String deleteMeeting(MeetingVO vo,HttpSession session) {
		logger.debug("deleteSchedule스케줄 : {}", vo);
		try {
			meetingService.deleteMeeting(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "jsonView";
	}
	@RequestMapping("/updateMeetingView")
	public String updateMeetingView(MeetingVO vo,HttpSession session, Model model) {
		logger.debug("updateMeetingView 스케줄 : {}", vo);
		
		MeetingVO vo2 = null;
		try {
			vo2 = meetingService.selectMeeting(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("updateScheduleView 스케줄 : {}", vo);
		model.addAttribute("meeting",vo2);
		
		return "meeting/meetingUpdate";
	}
	
	@RequestMapping("/updateMeeting")
	public String updateMeeting(MeetingVO vo, Model model) {
		logger.debug("updateMeeting 스케줄 : {}", vo);
		try {
			meetingService.updateMeeting(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("updateMeeting 스케줄2222 : {}", vo);
		
		return "jsonView";
	}

}
