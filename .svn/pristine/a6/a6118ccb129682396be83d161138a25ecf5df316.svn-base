package kr.or.ddit.facemeeting.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.facemeeting.service.FaceMeetingService;

@Controller
public class FaceMeetingController {

	
	@Resource(name = "faceMeetingService")
	private FaceMeetingService faceMeetingService;
	
	@RequestMapping("/faceMeet/facemeetingView")
	public String facemeetingView(String faceChatRoomId, Model model, HttpSession session) {
		/* 화상 회의 홈페이지 연결 */
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		
		String jobTitleName = faceMeetingService.selectEmpJobTitleName(empVO);
		
		model.addAttribute("faceChatRoomId", faceChatRoomId);
		model.addAttribute("jobTitleName", jobTitleName);
		return "faceMeet/faceMeetViewer";
	}
	
}
