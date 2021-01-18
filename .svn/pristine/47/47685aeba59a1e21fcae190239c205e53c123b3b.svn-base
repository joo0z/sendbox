package kr.or.ddit.community.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.comm.vo.PaginationVO;
import kr.or.ddit.community.service.CommuService;
import kr.or.ddit.community.vo.CommuBKMKVO;
import kr.or.ddit.community.vo.CommuBoardFileVO;
import kr.or.ddit.community.vo.CommuBoardRepleVO;
import kr.or.ddit.community.vo.CommuBoardVO;
import kr.or.ddit.community.vo.CommuVO;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.jobTitle.vo.JobTitleVO;
import kr.or.ddit.vote.vo.VotePostEmpDeptVO;
import kr.or.ddit.vote.vo.VotePostVO;

@Controller
public class CommuController {

	
	private static final Logger logger = LoggerFactory.getLogger(CommuController.class);
	
	@Resource(name = "commuService")
	private CommuService commuService;
	
	
	
	
	
	
	
	@RequestMapping("/commu/myCommuManage")
	public String  myCommuManage(HttpSession session, Model model) {
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		CommuVO commuVO = new CommuVO();
		commuVO.setEmpId(empVO.getEmpId());
		
		List<CommuVO> commuList = commuService.selectMyCommu(commuVO);
		model.addAttribute("commuList", commuList);
		return "tiles/commu/myCommuManage";
	}
	
	
	
	
	
	
	
	@RequestMapping("/commu/createCommuView")
	public String createCommuVIew() {
		return "tiles/commu/createCommu";
	}
	
	
	
	
	
	
	
	@RequestMapping("/commu/createCommu")
	public String createCommu(HttpSession session, CommuVO commuVO, @RequestPart(name = "file") MultipartFile file) {
		
		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		commuVO.setEmpId(dbEmp.getEmpId());
		
		int insertCommu = commuService.insertCommu(commuVO, file);
		if(insertCommu == 1) {
			return "redirect:/commu/myCommuManage";
		}else {
			return "/commu/createCommu";
		}
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/commu/updateCommu")
	public String updateCommu(CommuVO commuVO) {
		
		int updateCommuRes = commuService.updateCommu(commuVO);
		return "redirect:/commu/myCommuManage";
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/commu/commuKindView")
	public String commuKindView(EmpVO empVO, Model model, HttpSession session) {
		
		// session의 emp정보에 담긴 사원id를 추출
		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		
		// 커뮤니티 전체 불러오기
		// 사원이 즐겨찾기에 추가한 커뮤니티 불러오기
		Map<String, Object> myCommuMap = commuService.selectCommuMap(dbEmp);
		model.addAttribute("commuList", myCommuMap.get("commuList")); 
		model.addAttribute("commuBKMKList", myCommuMap.get("commuBKMKList")); 
		
		return "tiles/commu/commuKindView";
	}
	
	
	
	
	@RequestMapping("/commu/commuIconView")
	public String commuIconView(CommuVO commuVO, Model model) {
		
		CommuVO DBcommuVO = commuService.selectCommuIcon(commuVO);
		if(DBcommuVO != null) {
			model.addAttribute("commuIconPath", DBcommuVO.getCommuIconPath());
		}
		return "commuIconView";
	}
	
	
	
	
	
	
	@RequestMapping("/commu/insertCommuBKMK")
	public String insertCommuBKMK(CommuBKMKVO commuBkmk, HttpSession session) {
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		commuBkmk.setEmpId(empVO.getEmpId());
		
		int insertCommuBKMK = commuService.insertCommuBKMK(commuBkmk);
		return "redirect:/commu/commuBoardList?commuSeq="+commuBkmk.getCommuSeq();
	}
	
	
	
	
	
	@RequestMapping("/commu/deleteCommuBKMK")
	public String deleteCommuBKMK(CommuBKMKVO commuBkmk, HttpSession session) {
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		commuBkmk.setEmpId(empVO.getEmpId());
		
		int deleteCommuBKMK = commuService.deleteCommuBKMK(commuBkmk);
		return "redirect:/commu/commuBoardList?commuSeq="+commuBkmk.getCommuSeq();
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/commu/commuBoardList")
	public String commuBoardView(CommuBoardVO commuBoardVO, Model model, HttpSession session,
								 @RequestParam(name = "searchCondition", required = false) String searchCondition,
								 @RequestParam(name = "searchKeyword", required = false) String searchKeyword) {
		
		logger.debug("=======================================");
		logger.debug("");
		logger.debug("");
		logger.debug("commuBoardVO : {}", commuBoardVO);
		logger.debug("searchCondition : {}", searchCondition);
		logger.debug("searchKeyword : {}", searchKeyword);
		logger.debug("");
		logger.debug("");
		logger.debug("=======================================");
		
		if(searchCondition != null) {
			commuBoardVO.setSearchCondition(searchCondition);
		}
		if(searchKeyword != null) {
			commuBoardVO.setSearchKeyword(searchKeyword);
		}
		
		
		
		try {
			// 커뮤니티 board 리스트
			List<CommuBoardVO> commuBoardList = commuService.selectListCommuPost(commuBoardVO);

			// 커뮤니티 전체 페이지 수
			int commuListCount = commuService.selectCommuBoardPageAllCount(commuBoardVO);
			
			CommuVO commuVO = new CommuVO();
			commuVO.setCommuSeq(commuBoardVO.getCommuSeq());
			
			// 커뮤니티 이름
			List<CommuVO> commuList = commuService.selectCommu(commuVO);
			
			
			// 커뮤니티 북마크 확인
			EmpVO emp = (EmpVO) session.getAttribute("EMP");
			
			CommuBKMKVO commuBkmk = new CommuBKMKVO();
			commuBkmk.setCommuSeq(commuBoardVO.getCommuSeq());
			commuBkmk.setEmpId(emp.getEmpId());
			
			CommuBKMKVO dbCommuBkmk = commuService.selectMyBookMark(commuBkmk);
			
			// 해당 게시글 작성자의 직급
			// 해당 게시 작성자의 부서, 팀명
			List<String> empTitleList = null;
			List<VotePostEmpDeptVO> empDeptInfoList = null;
			if(commuBoardList.size() > 0 && commuBoardList != null) {
				
				empTitleList = new ArrayList<String>();
				empDeptInfoList = new ArrayList<VotePostEmpDeptVO>();
				
				for(CommuBoardVO tempVO  : commuBoardList) {
					
					JobTitleVO empJobTitleVO = commuService.selectCommuBoardListEmpJobTitle(tempVO.getEmpId());
					empJobTitleVO.setEmpId(tempVO.getEmpId());
					
					VotePostEmpDeptVO empDeptVO = commuService.selectCommuBoardListEmpDeptInfo(empJobTitleVO);
					empTitleList.add(empJobTitleVO.getJobtitleNm());
					empDeptInfoList.add(empDeptVO);
				}
				model.addAttribute("empTitleList", empTitleList);
				model.addAttribute("empDeptInfoList", empDeptInfoList);
				logger.debug("empDeptInfoList : {}", empDeptInfoList);
			}
			
			
			
			
			
			// 페이징 처리
			PaginationVO pagination = new PaginationVO(commuBoardVO.getPageIndex(), commuBoardVO.getRecordCountPerPage(), 
					   								   commuBoardVO.getPageSize(), commuListCount);
			model.addAttribute("pagination", pagination);
			
			int boardFrontNum = ((commuBoardVO.getPageIndex() - 1) * commuBoardVO.getRecordCountPerPage());
			
			model.addAttribute("dbCommuBkmk", dbCommuBkmk);				
			model.addAttribute("commuNm", commuList.get(0).getCommuNm());				
			model.addAttribute("commuSeq", commuBoardVO.getCommuSeq());
			model.addAttribute("commuBoardList", commuBoardList);
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("searchCondition", searchCondition);
			model.addAttribute("boardFrontNum", boardFrontNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "tiles/commu/commuBoard";
	}
	
	
	
	
	
	
	
	@RequestMapping("/commu/commuPostInsertView")
	public String commuBoardInsertView(int commuSeq, Model model) {
		model.addAttribute("commuSeq", commuSeq);
		return "tiles/commu/commuPostInsert";
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/commu/insertPost")
	public String insertPost(@RequestPart(name = "file", required = false) List<MultipartFile> fileList, 
							 CommuBoardVO commuBoardVO, 
							 HttpSession session) {
		
		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		
		logger.debug("commuBoardVO : {}", commuBoardVO);
		int insertCommuBoardRes = commuService.insertCommuBoard(fileList, commuBoardVO, dbEmp);
		if(insertCommuBoardRes == 1) {
			int commuBoardCurrval = commuService.selectCurrval();
			return "redirect:/commu/commuPostView?boardSeq="+commuBoardCurrval;				
		}else {
			return "/commu/insertPost";	
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/commu/commuPostView")
	public String commuPostView(CommuBoardVO commuBoardVO, Model model) {
		
		Map<String, Object> commuBoardMap = commuService.selectCommuBoard(commuBoardVO);
		if(commuBoardMap != null) {
			model.addAttribute("commuBoard", commuBoardMap.get("dbCommuBoard"));
			model.addAttribute("commuBoardFileList", commuBoardMap.get("commuBoardFileList"));
			model.addAttribute("repleList", commuBoardMap.get("commuBoardRepleList"));
			model.addAttribute("empTitle", commuBoardMap.get("empTitle"));
			model.addAttribute("commuRepleEmpTitleList", commuBoardMap.get("commuRepleEmpTitleList"));
		}
		
		return "tiles/commu/commuPostView";
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/commu/updateBoardView")
	public String updateBoard(CommuBoardVO commuBoardVO, Model model) {
		
		logger.debug("===========================================================================================");
		logger.debug("");
		logger.debug("");
		logger.debug("commuBoardVO : {}", commuBoardVO);
		logger.debug("");
		logger.debug("");
		logger.debug("===========================================================================================");
		
		
		Map<String, Object> commuBoardMap = commuService.selectCommuBoard(commuBoardVO);
		
		CommuBoardVO dbCommuBoardVO = (CommuBoardVO) commuBoardMap.get("dbCommuBoard");
		List<CommuBoardFileVO> commuBoardFileList = (List<CommuBoardFileVO>) commuBoardMap.get("commuBoardFileList");
		
		if(dbCommuBoardVO != null) {
			model.addAttribute("commuBoard", dbCommuBoardVO);
			model.addAttribute("commuBoardFileList", commuBoardFileList);
		}
			
		return "tiles/commu/commuPostUpdate";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/commu/updatePost")
	public String postUpdateForm(HttpSession session, 
								 CommuBoardVO commuBoardVO, 
								 @RequestPart(name = "file", required = false) List<MultipartFile> fileList,
								 @RequestParam(name = "delFile", required = false) List<Integer> delFileList) {
	
		logger.debug("==========================================================================");
		logger.debug("");
		logger.debug("");
		logger.debug("fileList : {}", fileList);
		logger.debug("commuBoardVO : {}", commuBoardVO);
		
		// size or null
		logger.debug("delFileList : {}", delFileList);
		logger.debug("");
		logger.debug("");
		logger.debug("==========================================================================");
		
		
		int updatePostResult = commuService.updatePost(session, commuBoardVO, fileList, delFileList);
		
		if(updatePostResult == 1) {
			return "redirect:/commu/commuPostView?boardSeq="+commuBoardVO.getBoardSeq();						
		}else {
			return "/commu/updatePost";			
		}
	}
	
	
	
	
	
	@RequestMapping("/commu/deleteCommuBoard")
	public String deleteCommuBoard(HttpSession session, 
			 					   CommuBoardVO commuBoardVO) {
		
		int delUpPostResult = commuService.delUpCommuBoard(session, commuBoardVO);
		if(delUpPostResult == 1) {
			return "redirect:/commu/commuBoardList?commuSeq="+commuBoardVO.getCommuSeq();
		}else {
			return "redirect:/commu/commuPostView?boardSeq="+commuBoardVO.getBoardSeq();
		}
	}
	
	
	
	
	
	
	@RequestMapping("/commu/repleRegist")
	public String repleRegist(CommuBoardRepleVO commuRepleVO, HttpSession session) {
		
		String repleCont = commuRepleVO.getRepleCont().replace("\n", "<br>");
		logger.debug("repleCont : {}", repleCont);
		commuRepleVO.setRepleCont(repleCont);
		
		
		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		commuRepleVO.setEmpId(dbEmp.getEmpId());
		commuRepleVO.setEmpNm(dbEmp.getEmpNm());
		
		int insertRepleRes = commuService.insertCommuReple(commuRepleVO);
		return "redirect:/commu/commuPostView?boardSeq="+commuRepleVO.getBoardSeq();
	}
	
	
	
	
	
	@RequestMapping("/commu/deleteCommuReple")
	public String deleteCommuReple(CommuBoardRepleVO commuRepleVO) {

		int deleteCommuRepleCnt = commuService.updateRepleSt(commuRepleVO);
		if(deleteCommuRepleCnt == 1) {
			return "redirect:/commu/commuPostView?boardSeq="+commuRepleVO.getBoardSeq();
		}else {
			return "/commu/deleteCommuReple";			
		}
	}
	
	
	
	
	
	@RequestMapping("/commu/fileDown")
	public String commuBoardFileDown(CommuBoardFileVO commuBoardFile, Model model) {
		
		List<CommuBoardFileVO> dbFileList = commuService.selectCommuBoardFile(commuBoardFile);
		
		if(dbFileList != null && dbFileList.size() > 0) {
			model.addAttribute("dbFile", dbFileList.get(0));
			return "commuBoardFileDownView";
		}else {
			return "/commu/commuPostView?boardSeq="+commuBoardFile.getBoardSeq();
		}
		
	}
	
	
	
	
	
}
