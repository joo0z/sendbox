package kr.or.ddit.freeboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.comm.util.FileUtils;
import kr.or.ddit.comm.vo.PaginationVO;
import kr.or.ddit.emp.controller.FileUploadUtil;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.freeboard.service.FreeBoardService;
import kr.or.ddit.freeboard.vo.FreeBoardVO;
import kr.or.ddit.freeboard.vo.FreeFileVO;
import kr.or.ddit.freeboard.vo.FreeRepleVO;

@Controller
public class FreeBoardController {

	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);

	@Resource(name = "freeBoardService")
	private FreeBoardService freeBoardService;

	@RequestMapping("/freeBoard/freeBoardList")
	public String freeBoardView(FreeBoardVO freeBoardVO, Model model, HttpSession session,
			@RequestParam(name = "searchCondition", required = false) String searchCondition,
			@RequestParam(name = "searchKeyword", required = false) String searchKeyword) {

		if (searchCondition != null) {
			freeBoardVO.setSearchCondition(searchCondition);
		}
		if (searchKeyword != null) {
			freeBoardVO.setSearchKeyword(searchKeyword);
		}

		try {
			// 자유게시판 리스트
			List<FreeBoardVO> freeBoardList = freeBoardService.selectListFreePost(freeBoardVO);

			// 자유게시판 전체 페이지 수
			int freeListCount = freeBoardService.selectFreeBoardPageAllCount(freeBoardVO);

			freeBoardVO.setPostSeq(freeBoardVO.getPostSeq());

			model.addAttribute("freeBoardList", freeBoardList);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("searchCondition", searchCondition);

			PaginationVO pagination = new PaginationVO(freeBoardVO.getPageIndex(), freeBoardVO.getRecordCountPerPage(),
					freeBoardVO.getPageSize(), freeListCount);
			model.addAttribute("pagination", pagination);

			int boardFrontNum = ((freeBoardVO.getPageIndex() - 1) * freeBoardVO.getRecordCountPerPage());
			model.addAttribute("boardFrontNum", boardFrontNum);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "tiles/freeBoard/freeBoard";
	}

	@RequestMapping("/freeBoard/freePostInsertView")
	public String freeBoardInsertView(FreeBoardVO freeBoardVO) {
		return "tiles/freeBoard/freePostInsert";
	}

	@RequestMapping("/freeBoard/insertPost")
	public String insertPost(@RequestPart(name = "file", required = false) List<MultipartFile> fileList,
			FreeBoardVO freeBoardVO, HttpSession session) {

		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		freeBoardVO.setEmpId(dbEmp.getEmpId());
		freeBoardVO.setEmpNm(dbEmp.getEmpNm());

		int insertRes = 0;
		logger.debug("freeBoardVO : {}", freeBoardVO);
		try {
			int insertFreeBoardRes = freeBoardService.insertFreeBoard(fileList, freeBoardVO, dbEmp);
			if (insertFreeBoardRes == 1) {
				insertRes = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (insertRes == 1) {
			int freeBoardCurrval = 0;
			try {
				freeBoardCurrval = freeBoardService.selectCurrval();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/freeboard/freePostView?postSeq=" + freeBoardCurrval;
		} else {
			return "/freeBoard/insertPost";
		}
	}

	@RequestMapping("/freeboard/freePostView")
	public String freePostView(FreeBoardVO freeBoardVO, Model model) {

		logger.debug("test freePost view");

		Map<String, Object> freeBoardMap = freeBoardService.selectFreeBoard(freeBoardVO);
		if (freeBoardMap != null) {
			model.addAttribute("freeBoard", freeBoardMap.get("dbFreeBoard"));
			model.addAttribute("freeBoardFileList", freeBoardMap.get("freeBoardFileList"));
			model.addAttribute("repleList", freeBoardMap.get("freeBoardRepleList"));
		}

		return "tiles/freeBoard/freePostView";
	}

	@RequestMapping("/freeBoard/updateBoardView")
	public String updateBoard(FreeBoardVO freeBoardVO, Model model) {

		logger.debug("===========================================================================================");
		logger.debug("");
		logger.debug("");
		logger.debug("freeBoardVO : {}", freeBoardVO);
		logger.debug("");
		logger.debug("");
		logger.debug("===========================================================================================");

		try {
			Map<String, Object> freeBoardMap = freeBoardService.selectFreeBoard(freeBoardVO);
			FreeBoardVO dbFreeBoardVO = (FreeBoardVO) freeBoardMap.get("dbFreeBoard");

			List<FreeFileVO> freeBoardFileList = (List<FreeFileVO>) freeBoardMap.get("freeBoardFileList");

			if (dbFreeBoardVO != null) {
				model.addAttribute("freeBoard", dbFreeBoardVO);
				model.addAttribute("freeBoardFileList", freeBoardFileList);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "tiles/freeBoard/freePostUpdate";
	}

	@RequestMapping("/freeBoard/updatePost")
	public String postUpdateForm(HttpSession session, FreeBoardVO freeBoardVO,
			@RequestPart(name = "file", required = false) List<MultipartFile> fileList,
			@RequestParam(name = "delFile", required = false) List<Integer> delFileList) {

		logger.debug("==========================================================================");
		logger.debug("");
		logger.debug("");
		logger.debug("fileList : {}", fileList);
		logger.debug("freeBoardVO : {}", freeBoardVO);

		// size or null
		logger.debug("delFileList : {}", delFileList);
		logger.debug("");
		logger.debug("");
		logger.debug("==========================================================================");

		int updatePostResult = 0;
		try {
			updatePostResult = freeBoardService.updatePost(session, freeBoardVO, fileList, delFileList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (updatePostResult == 1) {
			return "redirect:/freeboard/freePostView?postSeq=" + freeBoardVO.getPostSeq();
		} else {
			return "/freeBoard/updatePost";
		}
	}

	@RequestMapping("/freeBoard/deleteFreeBoard")
	public String deleteFreeBoard(HttpSession session, FreeBoardVO freeBoardVO) {

		logger.debug("============================================");
		logger.debug("");
		logger.debug("");
		logger.debug("freeBoardVO : {}", freeBoardVO);
		logger.debug("");
		logger.debug("");
		logger.debug("============================================");

		int delUpPostResult = 0;

		try {
			delUpPostResult = freeBoardService.delUpFreeBoard(session, freeBoardVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (delUpPostResult == 1) {

			logger.debug("del 잘옴");

			return "redirect:/freeBoard/freeBoardList";
		} else {
			return "/freeBoard/deleteFreeBoard";
		}
	}

	@RequestMapping("/freeBoard/repleRegist")
	public String repleRegist(FreeRepleVO freeRepleVO, HttpSession session) {

		// textarea 줄바꿈, 공백처리
		freeRepleVO.setRepleCont(freeRepleVO.getRepleCont().replace("\r\n", "<br>"));
		freeRepleVO.setRepleCont(freeRepleVO.getRepleCont().replace(" ", "&nbsp;"));

		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		freeRepleVO.setEmpId(dbEmp.getEmpId());
		freeRepleVO.setEmpNm(dbEmp.getEmpNm());

		int insertRepleRes = 0;
		try {
			insertRepleRes = freeBoardService.insertFreeReple(session, freeRepleVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (insertRepleRes == 1) {
			return "redirect:/freeboard/freePostView?postSeq=" + freeRepleVO.getPostSeq();
		} else {
			return "/freeBoard/repleRegist";
		}
	}

	@RequestMapping("/freeBoard/deleteFreeReple")
	public String deleteFreeReple(HttpSession session, FreeRepleVO freeRepleVO) {

		int deleteFreeRepleCnt = 0;
		try {
			deleteFreeRepleCnt = freeBoardService.updateRepleSt(session, freeRepleVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (deleteFreeRepleCnt == 1) {
			return "redirect:/freeboard/freePostView?postSeq=" + freeRepleVO.getPostSeq();
		} else {
			return "/freeBoard/deleteFreeReple";
		}
	}

	@RequestMapping("/freeBoard/fileDown")
	public String freeBoardFileDown(FreeFileVO freeFile, Model model) {

		List<FreeFileVO> dbFileList = null;
		try {
			dbFileList = freeBoardService.selectFreeBoardFile(freeFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (dbFileList != null && dbFileList.size() > 0) {
			model.addAttribute("dbFile", dbFileList.get(0));
			return "freeBoardFileDownView";
		} else {
			return "/freeBoard/freePostView?postSeq=" + freeFile.getPostSeq();
		}

	}

}
