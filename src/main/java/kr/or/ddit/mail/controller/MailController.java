package kr.or.ddit.mail.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.Gson;

import kr.or.ddit.comm.vo.PaginationVO;
import kr.or.ddit.community.controller.FileUploadUtil;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.mail.service.MailService;
import kr.or.ddit.mail.vo.MailBackVO;
import kr.or.ddit.mail.vo.MailFileVO;
import kr.or.ddit.mail.vo.MailVO;

@Controller
public class MailController {

	@Resource
	MailService mailService;

	private static final Logger logger = LoggerFactory.getLogger(MailController.class);

	// 받은메일함 (안지워진거)
	@RequestMapping("/mail/list")
	public String mailList(HttpSession session, Model model, MailVO mailVO, String searchCondition,
			String searchKeyword) {

		EmpVO empVO = (EmpVO) session.getAttribute("EMP");

		mailVO.setMailSt("RY");
		mailVO.setRecordCountPerPage(15);
		mailVO.setReceiver(empVO.getEmpId());
		mailVO.setSearchCondition(searchCondition);
		mailVO.setSearchKeyword(searchKeyword);

		logger.debug("VO 확인 !?!? : {}", mailVO);

		List<MailVO> mailList = null;
		int cnt = 1;
		try {
			mailList = mailService.mailList(mailVO);
			cnt = mailService.selectMailTotCnt(mailVO);

			logger.debug("몇개 ?? {}", mailList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		PaginationVO pagination = new PaginationVO(mailVO.getPageIndex(), mailVO.getRecordCountPerPage(),
				mailVO.getPageSize(), cnt);

		model.addAttribute("MailList", mailList);
		model.addAttribute("pagination", pagination);

		return "tiles2/mail/mailList";
	}

	// 받은메일함 (5개출력)
	@RequestMapping("/mail/list5")
	public String mailList5(HttpSession session, Model model, MailVO mailVO) {

		EmpVO empVO = (EmpVO) session.getAttribute("EMP");

		mailVO.setMailSt("RY");
		mailVO.setRecordCountPerPage(5);
		mailVO.setReceiver(empVO.getEmpId());

		logger.debug("VO 확인 !?!? : {}", mailVO);

		List<MailVO> mailList = null;
		int cnt = 1;
		try {
			mailList = mailService.mailList(mailVO);
			cnt = mailService.selectMailTotCnt(mailVO);

			logger.debug("몇개 ?? {}", mailList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		PaginationVO pagination = new PaginationVO(mailVO.getPageIndex(), mailVO.getRecordCountPerPage(),
				mailVO.getPageSize(), cnt);

		model.addAttribute("MailList", mailList);
		model.addAttribute("pagination", pagination);

		return "jsonView";
	}

	// 안읽은메일함
	@RequestMapping("/mail/notlist")
	public String mailNoList(HttpSession session, Model model, MailVO mailVO) {

		EmpVO empVO = (EmpVO) session.getAttribute("EMP");

		mailVO.setReceiver(empVO.getEmpId());
		mailVO.setMailCnt("N");
		mailVO.setMailSt("RY");
		mailVO.setRecordCountPerPage(15);

		logger.debug("수신인 {}", mailVO.getReceiver());

		List<MailVO> mailList = null;
		int cnt = 1;
		try {
			mailList = mailService.mailList(mailVO);
			cnt = mailService.selectMailTotCnt(mailVO);
			logger.debug("메일 개수 : {}", mailList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		PaginationVO pagination = new PaginationVO(mailVO.getPageIndex(), mailVO.getRecordCountPerPage(),
				mailVO.getPageSize(), cnt);

		model.addAttribute("MailList", mailList);
		model.addAttribute("pagination", pagination);

		return "tiles2/mail/mailNotList";
	}

	// 메일작성
	@RequestMapping("/mail/write")
	public String mailWrite() {
		return "tiles2/mail/mailWrite";
	}

	// 보낸메일함
	@RequestMapping("/mail/sendList")
	public String mailSendList(HttpSession session, Model model, MailVO mailVO) {

		EmpVO empVO = (EmpVO) session.getAttribute("EMP");

		mailVO.setSender(empVO.getEmpId());
		mailVO.setMailSt("SY");
		mailVO.setRecordCountPerPage(15);

		logger.debug("발신인 {}", mailVO.getSender());

		List<MailVO> mailList = null;
		int cnt = 1;
		try {
			mailList = mailService.mailList(mailVO);
			cnt = mailService.selectMailTotCnt(mailVO);
			logger.debug("메일 개수 : {}", mailList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		PaginationVO pagination = new PaginationVO(mailVO.getPageIndex(), mailVO.getRecordCountPerPage(),
				mailVO.getPageSize(), cnt);

		model.addAttribute("MailList", mailList);
		model.addAttribute("pagination", pagination);
		return "tiles2/mail/mailSendList";
	}

	// 휴지통
	@RequestMapping("/mail/bin")
	public String mailBin(HttpSession session, Model model, MailVO mailVO) {

		logger.debug("휴지통 메일 VO : {}", mailVO);

		EmpVO empVO = (EmpVO) session.getAttribute("EMP");

		mailVO.setReceiver(empVO.getEmpId());
		mailVO.setRecordCountPerPage(15);
		mailVO.setSender(empVO.getEmpId());

		logger.debug("휴지통 메일 VO : {}", mailVO);

		logger.debug("수신인 {}", mailVO.getReceiver());
		int cnt = 1;

		List<MailVO> mailList = null;
		try {
			mailList = mailService.mailList(mailVO);
			cnt = mailService.selectMailTotCnt(mailVO);
			logger.debug("cnt :????????????????{}", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		PaginationVO pagination = new PaginationVO(mailVO.getPageIndex(), mailVO.getRecordCountPerPage(),
				mailVO.getPageSize(), cnt);

		model.addAttribute("MailList", mailList);
		model.addAttribute("pagination", pagination);

		return "tiles2/mail/mailBin";
	}

	@RequestMapping("/testtest")
	public String test() {
		return "mail/complete";
	}

	// 스프링 컨트롤러 부분
	@RequestMapping(value = "/json", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String json(Locale locale, Model model) {
		String[] array = { "김치 볶음밥", "신라면", "진라면", "라볶이", "팥빙수", "너구리", "삼양라면", "안성탕면", "불닭볶음면", "짜왕", "라면사리" };

		Gson gson = new Gson();

		return gson.toJson(array);// ["김치 볶음밥","신라면","진라면","라볶이","팥빙수","너구리","삼양라면","안성탕면","불닭볶음면","짜왕","라면사리"]
	}

	@RequestMapping("/mail/success")
	public String mailSuccess() {
		return "tiles2/mail/mailSuccess";
	}

	@RequestMapping("/mailSend")
	public String mailSend(MailVO mailVO, Model model, HttpServletRequest files, String[] receiver) {

		logger.debug("mailVO ? {}", mailVO);
		logger.debug("ㅇㅇㅇㅇ{}", receiver[0]);
		logger.debug("받는사람 ? {}", receiver.length);

		for (int i = 0; i < receiver.length; i++) {

			if (receiver[i] != null && !(receiver[i].equals(""))) {

				receiver[i] = receiver[i].replaceAll("@sendbox.com", "");

				mailVO.setReceiver(receiver[i]);

				try {
					logger.debug("mailVO ? {}", mailVO);
					String mailSeq = mailService.mailSend(mailVO);

					List<MultipartFile> list = (List<MultipartFile>) ((MultipartRequest) files)
							.getFiles("realfilename");
					logger.debug("업로드할 파일 개수 : {}", list.size());

					String filename = "";
					String filePath = "";
					String extension = "";

					for (int j = 0; j < list.size(); j++) {
						if (list.get(j).getOriginalFilename() != null
								&& !(list.get(j).getOriginalFilename().equals(""))) {
							try {
								filename = UUID.randomUUID().toString();
								extension = FileUploadUtil.getExtension(list.get(j).getOriginalFilename());
								filePath = "D:\\files\\" + filename + "." + extension;
								File uploadFile = new File(filePath);
								list.get(j).transferTo(uploadFile);
							} catch (IllegalStateException | IOException e1) {
								e1.printStackTrace();
							}

							MailFileVO mailFileVO = new MailFileVO();
							mailFileVO.setMailSeq(mailSeq);
							mailFileVO.setRealfilename(list.get(j).getOriginalFilename());
							mailFileVO.setFilepath(filePath);

							mailService.mailFileUpload(mailFileVO);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return "redirect:/mail/success";
	}

	@RequestMapping("/mail/detail")
	public String mailDetail(MailVO mailVO, Model model, MailFileVO mailFileVO) {

		logger.debug("메일 번호 {},", mailVO.getMailSeq());
		logger.debug("메일파일VO {}", mailFileVO);
		List<MailFileVO> mailFileList = new ArrayList<MailFileVO>();
		MailVO dbVO = new MailVO();
		try {
			dbVO = mailService.mailDetail(mailVO);
			mailFileList = mailService.mailFileList(mailFileVO);
			logger.debug("*******************************파일 개수 : {}", mailFileList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.debug("상세보기 할 메일 정보 : {}", dbVO);
		model.addAttribute("mailVO", dbVO);
		model.addAttribute("mailFileList", mailFileList);

		return "tiles2/mail/mailDetail";
	}

	@RequestMapping("/mail/fileDown")
	public String mailFileDownload(MailFileVO mailFileVO, Model model) throws IOException {
		logger.debug("파일번호 : {}", mailFileVO.getAttachfileSeq());
		MailFileVO dbVO = null;
		try {
			dbVO = mailService.mailFileDetail(mailFileVO);
			logger.debug("파일 정보 : {}", dbVO.getFilepath());
			model.addAttribute("filepath", dbVO.getFilepath());
			model.addAttribute("realfilename", dbVO.getRealfilename());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mailFileDownloadView";
	}

	@RequestMapping("/mail/read")
	public String mailread(MailVO mailVO) {
		logger.debug("메일 정보 : {}", mailVO);
		try {
			mailService.mailUpdate(mailVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}

	//받은메일함에서 삭제하는거
	//근데 보낸메일 상태는 그대로여야하니까 일단 그 메일의 지워진 상태값 가져와서
	//RN + 뒷 두글자 해야함
	@RequestMapping("/mail/delete")
	public String delete(MailVO mailVO, HttpSession session) {

		EmpVO sessionVO = (EmpVO) session.getAttribute("EMP");
		String[] mailSeq = mailVO.getMailSeq().split(",");
		String mailSt = "";

		for (int i = 0; i < mailSeq.length; i++) {
			MailVO deleteVO = new MailVO();
			MailVO inputVO = new MailVO();
			inputVO.setMailSeq(mailSeq[i]);
			MailVO dbVO = null;
			try {
				dbVO = mailService.mailDetail(inputVO);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			mailSt = dbVO.getMailSt();
			
			if(sessionVO.getEmpId().equals(dbVO.getReceiver())) {
				logger.debug("받은메일함에서 삭제");
				mailSt = mailSt.substring(2);
				mailSt = "RN" + mailSt;
			} else if(sessionVO.getEmpId().equals(dbVO.getSender())) {
				logger.debug("보낸메일함에서 삭제");
				mailSt = mailSt.substring(0,2);
				mailSt = mailSt + "SN";
			}
			deleteVO.setMailSt(mailSt);
			deleteVO.setMailSeq(mailSeq[i]);
			logger.debug("deleteVO********************************************* ? {}",deleteVO);
			try {
				mailService.mailDelete(deleteVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "jsonView";
	}
	

	@RequestMapping("/mail/delete2")
	public String mailDelete2(MailVO mailVO, HttpSession session) {
		EmpVO sessionVO = (EmpVO) session.getAttribute("EMP");
		logger.debug("지울 메일 번호 : {}", mailVO.getMailSeq());
		String[] mailSeq = mailVO.getMailSeq().split(",");
		logger.debug("스트링 배열 사이즈 : {}", mailSeq.length);
		logger.debug("첫번째 : {}", mailSeq[0]);
		String mailSt = "";
		for (int i = 0; i < mailSeq.length; i++) {
			MailVO deleteVO = new MailVO();
			MailVO inputVO = new MailVO();
			inputVO.setMailSeq(mailSeq[i]);
			MailVO dbVO = null;
			try {
				dbVO = mailService.mailDetail(inputVO);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			mailSt = dbVO.getMailSt();
			if(sessionVO.getEmpId().equals(dbVO.getReceiver())) {
				logger.debug("받은메일함에서 삭제");
				mailSt = mailSt.substring(2);
				mailSt = "RD" + mailSt;
			} else if(sessionVO.getEmpId().equals(dbVO.getSender())) {
				logger.debug("보낸메일함에서 삭제");
				mailSt = mailSt.substring(0,2);
				mailSt = mailSt + "SD";
			}
			deleteVO.setMailSt(mailSt);
			deleteVO.setMailSeq(mailSeq[i]);
			logger.debug("deleteVO********************************************* ? {}",deleteVO);
			try {
				mailService.mailDelete(deleteVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "jsonView";
	}

	@RequestMapping("/mail/count")
	public String mailCount(HttpSession session, Model model) {

		EmpVO sessionVO = (EmpVO) session.getAttribute("EMP");
		MailVO mailVO = new MailVO();
		mailVO.setReceiver(sessionVO.getEmpId());
		mailVO.setMailCnt("N");
		mailVO.setMailSt("RY");

		logger.debug("???????????? : {}", mailVO);

		int cnt = 0;

		try {
			cnt = mailService.selectMailTotCnt(mailVO);
			logger.debug("안읽은 메일 개수 : {}", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("cnt", cnt);

		return "jsonView";
	}

	@RequestMapping("/mail/history")
	public String mailHistory(MailVO mailVO, Model model) {
		logger.debug("메일 기록 정보 !!!!!!!!!!!!!!!!!!!!!! {}", mailVO);
		List<MailVO> mailList = null;
		try {
			mailList = mailService.mailList(mailVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.debug("개수 ? {}", mailList.size());

		model.addAttribute("MailList", mailList);

		return "jsonView";
	}

	// 스프링 컨트롤러 부분
	@RequestMapping(value = "/mail/autocomplete", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String autocomplete(Locale locale, Model model, String keyword, HttpSession session) {
		List<kr.or.ddit.mail.vo.EmpVO> dbList = null;
		EmpVO sessionVO = (EmpVO) session.getAttribute("EMP");
		Map<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("empId", sessionVO.getEmpId());
		try {
			dbList = mailService.autocomplete(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		Gson gson = new Gson();

		return gson.toJson(dbList);
	}
	
	@RequestMapping("/mail/addrwrite")
	public String addrSend(String mailInput, Model model) {
		logger.debug("mailInput : {}",mailInput);
		List<String> receiverList = Arrays.asList(mailInput.split(","));
		model.addAttribute("receiverList",receiverList);
		return "tiles2/mail/mailWriteAddr";
	}
	
	@RequestMapping("/mail/back")
	public String mailBack(String mailSeq, HttpSession session, Model model) {
		
		MailBackVO dbVO = null;
		try {
			dbVO = mailService.mailBack(mailSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		EmpVO sessionVO = (EmpVO) session.getAttribute("EMP");
		String empId = sessionVO.getEmpId();
		String mailSt = dbVO.getMailSt();
		// 받은메일함
		if(dbVO.getReceiver().equals(empId) && (mailSt.contains("RY"))) {
			logger.debug("받은메일함");
			model.addAttribute("url","/mail/list");
		} else if(dbVO.getSender().equals(empId) && (mailSt.contains("SY"))) {
			logger.debug("보낸메일함");
			model.addAttribute("url","/mail/sendList");
		} else if((dbVO.getReceiver().equals(empId) && mailSt.contains("RN")) || (dbVO.getSender().equals(empId) && mailSt.contains("SN"))) {
			logger.debug("휴지통");
			model.addAttribute("url","/mail/bin");
		}
		return "jsonView";
	}
}
