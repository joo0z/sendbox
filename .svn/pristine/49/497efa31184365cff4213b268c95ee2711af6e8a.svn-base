package kr.or.ddit.memo.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.memo.service.MemoService;
import kr.or.ddit.memo.vo.MemoVO;

@Controller
public class MemoController {
	
	@Resource
	MemoService memoService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemoController.class);
	
	@RequestMapping("/memo/write")
	public String memoWrite(HttpSession session, Model model) {
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		
		MemoVO memoVO = new MemoVO();
		memoVO.setEmpId(empVO.getEmpId());
		
		logger.debug("메모 작성할 아이디 ???? {}",memoVO.getEmpId());
		
		String memoSeq = "";
		try {
			memoSeq = memoService.create(memoVO);
			model.addAttribute("memoSeq",memoSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "jsonView";
	}
	
	@RequestMapping("/memo/View")
	public String memoView(HttpSession session, Model model) {
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		MemoVO memoVO = new MemoVO();
		logger.debug("메모 가져올 아이디 : {}",empVO.getEmpId());
		memoVO.setEmpId(empVO.getEmpId());
		try {
			model.addAttribute("memoList",memoService.retrieveList(memoVO));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}
	
	@RequestMapping("/memo/detail")
	public String memoDetail(MemoVO memoVO, Model model) {
		
		logger.debug("메모 번호 : {}",memoVO.getMemoSeq());
		
		MemoVO dbVO = null;
		try {
			dbVO = memoService.retreive(memoVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.debug("메모 내용 : {}",dbVO.getContent());
		model.addAttribute("detail",dbVO);
		
		return "jsonView";
	}
	
	@RequestMapping("/memo/update")
	public String memoUpdate(MemoVO memoVO) {
		logger.debug("업데이트 글 번호랑 내용 : {},{}",memoVO.getMemoSeq(),memoVO.getContent());
		try {
			memoService.update(memoVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}
	
	@RequestMapping("/memo/delete")
	public String memoDelete(MemoVO memoVO) {
		logger.debug("삭제할 메모 번호 : {}", memoVO.getMemoSeq());
		try {
			memoService.delete(memoVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}
}
