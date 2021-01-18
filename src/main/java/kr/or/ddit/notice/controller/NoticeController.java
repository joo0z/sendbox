package kr.or.ddit.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.comm.vo.PaginationVO;
import kr.or.ddit.emp.controller.FileUploadUtil;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.notice.service.NoticeService;
import kr.or.ddit.notice.vo.NoticeFileVO;
import kr.or.ddit.notice.vo.NoticeVO;

@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Resource(name = "noticeService")
	NoticeService noticeService;

	@RequestMapping("/notice")
	public String boardView(Model model, NoticeVO noticeVO) {
		logger.debug("noticeVO : {}", noticeVO);
		noticeVO.setRecordCountPerPage(noticeVO.getRecordCountPerPage()); // 게시글 수
		noticeVO.setPageSize(10); // 페이징 수
		int cnt = 0;
		try {
			
			model.addAttribute("NoticeList", noticeService.retrieveNoticeList(noticeVO));
			cnt = noticeService.noticeCount(noticeVO);
			logger.debug("NoticeList : {}", noticeService.retrieveNoticeList(noticeVO));
			logger.debug("cnt : {}", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		PaginationVO pagination = new PaginationVO(noticeVO.getPageIndex(), 
													noticeVO.getRecordCountPerPage(), 
													noticeVO.getPageSize(), 
													cnt);
		model.addAttribute("pagination", pagination);
		
		return "tiles/notice/notice";
	}

	// 등록
	@RequestMapping("/noticeInsertView")
	public String noticeInsertView(NoticeVO noticeVO) {
		return "tiles/notice/noticeForm";
	}

	@RequestMapping("/noticeInsert")
	public String noticeInsert(NoticeVO noticeVO, Model model, HttpServletRequest files,  HttpSession session) {
		
		EmpVO sessionEmpVO = (EmpVO)session.getAttribute("EMP");
		noticeVO.setEmpId(sessionEmpVO.getEmpId());
		
//		noticeVO.setEmpId(empId);
		noticeVO.setTitle("[공지] "+noticeVO.getTitle());
		logger.debug("noticeVO : {}", noticeVO);
		logger.debug("files : {}", files);

		int insertCnt = 0;

		try {
			insertCnt = noticeService.noticeInsert(noticeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<MultipartFile> list = (List<MultipartFile>) ((MultipartRequest) files).getFiles("realfilename");
		logger.debug("개수 : {}", list.size());

		String filename = "";
		String filePath = "";
		String extension = "";

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getOriginalFilename() != null && !(list.get(i).getOriginalFilename().equals(""))) {
				try {
					filename = UUID.randomUUID().toString();
					extension = FileUploadUtil.getExtension(list.get(i).getOriginalFilename());
					logger.debug("확장자 : {}", extension);
					filePath = "D:\\files\\" + filename + "." + extension;
					File uploadFile = new File(filePath);
					list.get(i).transferTo(uploadFile);
				} catch (IllegalStateException | IOException e1) {
					e1.printStackTrace();
				}

				NoticeFileVO noticeFileVO = new NoticeFileVO();
				noticeFileVO.setNoticeSeq(noticeVO.getNoticeSeq());
				noticeFileVO.setRealfilename(list.get(i).getOriginalFilename());
				noticeFileVO.setNoticeSeq(noticeVO.getNoticeSeq());
				noticeFileVO.setFilepath(filePath);

				int insertFileCnt;
				try {
					insertFileCnt = noticeService.noticeFileInsert(noticeFileVO);
					logger.debug("파일 업로드 : {}", insertFileCnt);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return "redirect:/notice";
	}

	// 상세보기
	@RequestMapping("/noticeDetail")
	public String noticeDetail(NoticeVO noticeVO, Model model, int noticeSeq) {
		logger.debug("noticeSeq : {}", noticeSeq);
		try {
			model.addAttribute("noticeSeq", noticeSeq);
			model.addAttribute("noticeFileList", noticeService.noticeFileList(noticeSeq));
			logger.debug("noticeFileList : {}", noticeService.noticeFileList(noticeSeq));
			model.addAttribute("NoticeList", noticeService.retrieveNoticeList(noticeVO));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "tiles/notice/noticeDetail";
	}

	// 첨부파일 다운로드
	@RequestMapping("/noticeFileDownload")
	public String noticeFileDownload(int attachfileSeq, Model model) throws IOException {
		NoticeFileVO noticeFileVO = null;
		logger.debug("attachfileSeq : {}", attachfileSeq);
		try {
			noticeFileVO = noticeService.getNoticeFile(attachfileSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("filepath", noticeFileVO.getFilepath());
		model.addAttribute("realfilename", noticeFileVO.getRealfilename());
		logger.debug("filepath : {} ", noticeFileVO.getFilepath());
		return "noticeFileDownloadView";
	}

	// 글 삭제
	@RequestMapping("/noticeDelete")
	public String noticeDelete(int noticeSeq) {
		logger.debug("noticeSeq : {}", noticeSeq);
		NoticeVO noticeVO = new NoticeVO();

		try {
			noticeVO = noticeService.getNotice(noticeSeq);
			logger.debug("noticeVO : {} ", noticeVO);
			noticeVO.setNoticeSt("N");
			int deleteCnt = noticeService.noticeUpdate(noticeVO);
			logger.debug("deleteCnt : {}", deleteCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/notice";
	}
	
	// 수정
	@RequestMapping("/noticeUpdateView")
	public String noticeUpdateView(Model model, int noticeSeq) {
		logger.debug("noticeSeq : {}", noticeSeq);
		NoticeVO noticeVO = new NoticeVO();
		try {
			noticeVO = noticeService.getNotice(noticeSeq);
			logger.debug("noticeVO : {}", noticeVO);
			model.addAttribute("noticeVO", noticeVO);
			model.addAttribute("noticeFileList", noticeService.noticeFileList(noticeSeq));
			logger.debug("noticeFileList : {}", noticeService.noticeFileList(noticeSeq));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "tiles/notice/noticeForm";
	}

	@RequestMapping(path = "/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(NoticeVO noticeVO, Model model, HttpServletRequest files) {
		logger.debug("noticeUpdate()");
		System.out.println("*********************************************");
		logger.debug("noticeVO : {}", noticeVO);
		logger.debug("files : {}", files);
		logger.debug("fileList : {}", Arrays.toString(noticeVO.getDeleteFile()));
		
		if(noticeVO.getDeleteFile() != null) {
			logger.debug("deleteFIle 개수 : {}",noticeVO.getDeleteFile().length);
			for(int i=0;i<noticeVO.getDeleteFile().length;i++) {
				NoticeFileVO inputVO = new NoticeFileVO();
				inputVO.setAttachfileSeq(Integer.parseInt(noticeVO.getDeleteFile()[i]));
				try {
					noticeService.deleteNoticeFile(inputVO);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		try {
			int updateCnt = noticeService.noticeUpdate(noticeVO);
			logger.debug("updateCnt : {}",updateCnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<MultipartFile> list = (List<MultipartFile>) ((MultipartRequest) files).getFiles("realfilename");
		logger.debug("개수 : {}", list.size());

		String filename = "";
		String filePath = "";
		String extension = "";

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getOriginalFilename() != null && !(list.get(i).getOriginalFilename().equals(""))) {
				try {
					filename = UUID.randomUUID().toString();
					extension = FileUploadUtil.getExtension(list.get(i).getOriginalFilename());
					logger.debug("확장자 : {}", extension);
					filePath = "D:\\files\\" + filename + "." + extension;
					File uploadFile = new File(filePath);
					list.get(i).transferTo(uploadFile);
				} catch (IllegalStateException | IOException e1) {
					e1.printStackTrace();
				}

				NoticeFileVO noticeFileVO = new NoticeFileVO();
				noticeFileVO.setNoticeSeq(noticeVO.getNoticeSeq());
				noticeFileVO.setRealfilename(list.get(i).getOriginalFilename());
				noticeFileVO.setNoticeSeq(noticeVO.getNoticeSeq());
				noticeFileVO.setFilepath(filePath);

				int insertFileCnt;
				try {
					insertFileCnt = noticeService.noticeFileInsert(noticeFileVO);
					logger.debug("파일 업로드 : {}", insertFileCnt);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return "redirect:/notice";
	}

	

}
