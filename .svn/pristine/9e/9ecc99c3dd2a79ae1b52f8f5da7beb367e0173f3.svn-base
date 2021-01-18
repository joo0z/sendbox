package kr.or.ddit.test;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Sample {
	
	private static final Logger logger = LoggerFactory.getLogger(Sample.class);
	
	@Resource(name="memberService")
	private MemberServiceImpl memberService;
	
	
	// svn commit test
	
	
	
	@RequestMapping("/test")
	public String sampleView(String userId, Model model) {
		logger.debug("테스트");
		
		MemberVO member = memberService.getMember(userId);
		model.addAttribute("member", member);
		return "tiles/test/sample";
	}
	
	
	
	
}
