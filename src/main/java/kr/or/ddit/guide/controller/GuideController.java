package kr.or.ddit.guide.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GuideController {
	
	@RequestMapping("/guide")
	public String guideView() {
		return "tiles/guide/guide";
	}
	
	
	@RequestMapping("/mailguide")
	public String mailguideView() {
		return "tiles/guide/mailguide";
	}
	
	@RequestMapping("/addrguide")
	public String addrguideView() {
		return "tiles/guide/addrguide";
	}
	
	@RequestMapping("/mypageguide")
	public String mypageguideView() {
		return "tiles/guide/mypageguide";
	}
	
	@RequestMapping("/noticeguide")
	public String noticeView() {
		return "tiles/guide/noticeguide";
	}
	
	@RequestMapping("/memoguide")
	public String memoguideView() {
		return "tiles/guide/memoguide";
	}
	
	@RequestMapping("/taskguide")
	public String taskguideView() {
		return "tiles/guide/taskguide";
	}
	
	@RequestMapping("/commuguide")
	public String commuguideView() {
		return "tiles/guide/commuguide";
	}
	
	@RequestMapping("/facemeetguide")
	public String facemeetguideView() {
		return "tiles/guide/facemeetguide";
	}
	
	@RequestMapping("/alarmguide")
	public String alarmguideView() {
		return "tiles/guide/alarmguide";
	}
	
	@RequestMapping("/signguide")
	public String signguideView() {
		return "tiles/guide/signguide";
	}
}
