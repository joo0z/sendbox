package kr.or.ddit.sign.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.sign.service.SignService;
import kr.or.ddit.sign.vo.SignVO;

@Controller
public class SignController {
	
	private static final Logger logger = LoggerFactory.getLogger(SignController.class);
	
	@Resource(name="signService")
	SignService signService;
	
	@RequestMapping("/sign/insert")
	public String signInsert(HttpSession session, Model model) {
		EmpVO sessionVO = (EmpVO) session.getAttribute("EMP");
		logger.debug("사인 등록 아이디 : {}",sessionVO.getEmpId());

		SignVO dbVO = null;
		try {
			dbVO = signService.getSign(sessionVO.getEmpId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(dbVO == null) {
			//insert 해주기
			try {
				signService.insertSign(sessionVO.getEmpId());
				dbVO = signService.getSign(sessionVO.getEmpId());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("SignVO",dbVO);
		return "jsonView";
	}
	
	@RequestMapping("/sign/update")
	public String signUpdate(SignVO signVO) {
		logger.debug("signUpdate 진입 !");
		logger.debug("signVO ? {}",signVO);
		
		try {
			signService.updateSign(signVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage?empId=" + signVO.getEmpId();
	}
}
