package kr.or.ddit.vote.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.comm.vo.PaginationVO;
import kr.or.ddit.dept.vo.DeptVO;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.jobTitle.vo.JobTitleVO;
import kr.or.ddit.vote.service.VoteService;
import kr.or.ddit.vote.vo.EmpVoteVO;
import kr.or.ddit.vote.vo.VoteItemVO;
import kr.or.ddit.vote.vo.VotePostEmpDeptVO;
import kr.or.ddit.vote.vo.VotePostVO;
import kr.or.ddit.vote.vo.VoteRepleVO;

@Controller
public class VoteController {

	private static final Logger logger = LoggerFactory.getLogger(VoteController.class);
	
	@Resource(name = "voteService")
	private VoteService voteService;
	
	
	
	
	
	@RequestMapping("/vote/votePostListView")
	public String votePostListView(VotePostVO votePostVO, Model model, HttpSession session) {
		
		session.setAttribute("vPCToken", "vPCToken");
		
		List<VotePostVO> votePostList = voteService.selectVotePostList(votePostVO);
		model.addAttribute("votePostList", votePostList);
		logger.debug("votePostList : {}", votePostList);
		
		
		// 해당 투표 작성자의 직급
		List<String> empTitleList = null;
		
		// 해당 투표 작성자의 부서, 팀명
		List<VotePostEmpDeptVO> empDeptInfoList = null;
		
		if(votePostList.size() > 0 && votePostList != null) {
			
			empTitleList = new ArrayList<String>();
			empDeptInfoList = new ArrayList<VotePostEmpDeptVO>();
			
			for(VotePostVO tempVO  : votePostList) {
				
				JobTitleVO empJobTitleVO = voteService.selectVotePostEmpJobTitle(tempVO.getEmpId());
				empJobTitleVO.setEmpId(tempVO.getEmpId());
				
				VotePostEmpDeptVO empDeptVO = voteService.selectVotePostEmpDeptInfo(empJobTitleVO);
				empTitleList.add(empJobTitleVO.getJobtitleNm());
				empDeptInfoList.add(empDeptVO);
			}
			model.addAttribute("empTitleList", empTitleList);
			model.addAttribute("empDeptInfoList", empDeptInfoList);
			logger.debug("empDeptInfoList : {}", empDeptInfoList);
		}
		
		// 투표 게시판 전체 페이지 수
		int votePostListCount = voteService.selectVotePostPageAllCount(votePostVO);
		
		PaginationVO pagination = new PaginationVO(votePostVO.getPageIndex(), votePostVO.getRecordCountPerPage(), 
												   votePostVO.getPageSize(), votePostListCount);
		model.addAttribute("pagination", pagination);
		
		
		int votePostFrontNum = ((votePostVO.getPageIndex() - 1) * votePostVO.getRecordCountPerPage());
		model.addAttribute("votePostSeq", votePostVO.getVotePostSeq());
		model.addAttribute("votePostList", votePostList);
		model.addAttribute("searchCondition", votePostVO.getSearchCondition());
		model.addAttribute("searchKeyword", votePostVO.getSearchKeyword());
		model.addAttribute("votePostFrontNum", votePostFrontNum);
		
		model.addAttribute("myORall", "all");
		
		return "tiles/vote/votePostList";
	}
	
	
	
	
	
	
	
	
	
	@RequestMapping("/vote/votePostView")
	public String votePostView(VotePostVO votePostVO, Model model) {
		
		VotePostVO dbVotePost = voteService.selectVotePostInfo(votePostVO);
		logger.debug("dbVotePost : {}", dbVotePost);
		
		List<VoteItemVO> dbVoteItemList = null;
		List<VoteRepleVO> dbVoteRepleList = null;
		List<EmpVoteVO> dbEmpVoteList = null;
		
		// 해당 투표 게시글이 있을경우 실행
		if(dbVotePost != null) {
			dbVoteItemList = voteService.selectVotePostItemList(votePostVO);
			dbVoteRepleList = voteService.selectVoteRepleList(votePostVO);
			dbEmpVoteList = voteService.selectEmpVoteList(votePostVO);
		}
		model.addAttribute("votePost", dbVotePost);
		model.addAttribute("voteItemList", dbVoteItemList);			// 목록 정보 리스트
		model.addAttribute("voteRepleList", dbVoteRepleList);		// 댓글 리스트
		
		logger.debug("dbVoteItemList 사이즈 : {}", dbVoteItemList.size());
		logger.debug("dbVoteRepleList 사이즈 : {}", dbVoteRepleList.size());
		logger.debug("empVoteList 사이즈 : {}", dbEmpVoteList.size());
		
		
		// 해당 투표 게시글에 투표선택항목이 있을경우 실행
		if(dbVoteItemList != null && dbVoteItemList.size() > 0) {
			
			List<Integer> voteItemCodeList = new ArrayList<Integer>();
			List<String> voteItemNmList = new ArrayList<String>();
			
			for(VoteItemVO voteItemInfo : dbVoteItemList) {
				
				// 투표목록 리스트
				voteItemCodeList.add(voteItemInfo.getVoteItemCode());
				voteItemNmList.add(voteItemInfo.getVoteItemNm());
			}
			model.addAttribute("voteItemCodeList", voteItemCodeList);	// 목록 번호 리스트
			model.addAttribute("voteItemNmList", voteItemNmList);		// 목록 이름 리스트
		}
		
		
		// 해당 투표 게시글에 사원들이 투표한 정보 리스트가 있을경우 실행
		if(dbEmpVoteList.size() > 0 && dbEmpVoteList != null) {
			List<String> empVoteEmpIdList = new ArrayList<String>();
			List<Integer> empVoteItemCodeList = new ArrayList<Integer>();
			for(int i=0; i<dbEmpVoteList.size(); i++) {
				empVoteEmpIdList.add(dbEmpVoteList.get(i).getEmpId());
				empVoteItemCodeList.add(dbEmpVoteList.get(i).getVoteItemCode());
			}
			model.addAttribute("empVoteEmpIdList", empVoteEmpIdList);		// 해당 투표 게시글에 투표한 사원id 리스트
			model.addAttribute("empVoteCodeList", empVoteItemCodeList);		// 사원이 선택한 투표번호 리스트
			model.addAttribute("empVoteList", dbEmpVoteList);				// 사원이 선택한 투표정보 리스트
		}
		return "tiles/vote/votePostView";
	}
	
	

	
	
	@RequestMapping("/vote/createVotePost")
	public String createVotePost(HttpSession session, 
								 VotePostVO votePostVO, 
								 @RequestParam(name = "voteItemInfo") List<String> voteItemInfoList,
								 String vPCToken) {
		
		String sessionToken = (String) session.getAttribute("vPCToken");
		if(sessionToken != null && sessionToken.equals(vPCToken)) {
			String votePostContText = votePostVO.getVotePostCont().replace("\n", "<br>");
			votePostVO.setVotePostCont(votePostContText);
			
			logger.debug("******************************************");
			logger.debug("");
			logger.debug("");
			logger.debug("votePostVO : {}",votePostVO);
			logger.debug("");
			logger.debug("");
			logger.debug("******************************************");
			
			if(voteItemInfoList.size() > 0) {
				for(int i=0; i<voteItemInfoList.size(); i++) {
					logger.debug(i + "번째 값 : {}", voteItemInfoList.get(i));
				}
			}
			session.removeAttribute("vPCToken");
			
			int votePostCreateResult = voteService.createVotePost(session, votePostVO, voteItemInfoList);
			if(votePostCreateResult == 1) {
				return "redirect:/vote/votePostListView";
			}else {
				return "tiles/vote/votePostCreateView";
			}
		}else {
			return "tiles/vote/votePostCreateView";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/vote/voteRepleRegist")
	public String voteRepleRegist(HttpSession session, VoteRepleVO voteReple, String myORall) {
		int voteRepleInsertRes = voteService.insertVoteReple(session, voteReple);
		return "redirect:/vote/votePostView?myORall="+myORall+"&votePostSeq="+voteReple.getVotePostSeq();
	}
	
	
	
	
	@RequestMapping("/vote/voteEmpInsert")
	public String voteEmpInsert(EmpVoteVO empVoteVO, HttpSession session, String myORall) {
		int voteEmpInsertRes = voteService.insertVoteEmpInfo(session, empVoteVO);
		return "redirect:/vote/votePostView?myORall="+myORall+"&votePostSeq="+empVoteVO.getVotePostSeq();
	}
	
	
	
	@RequestMapping("/vote/votePostCompleate")
	public String votePostCompleate(VotePostVO votePost, String myORall) {
		int votePostCompleateRes = voteService.votePostCompleate(votePost);
		String path = "redirect:/vote/votePostView?myORall="+myORall+"&votePostSeq="+votePost.getVotePostSeq();
		return path;
	}
	
	
	
	@RequestMapping("/vote/votePostCancel")
	public String votePostCancel(VotePostVO votePost, String myORall) {
		int votePostCancelRes = voteService.votePostCancel(votePost);
		String path = "redirect:/vote/votePostView?myORall="+myORall+"&votePostSeq="+votePost.getVotePostSeq();
		return path;
	}
	
	
	
	@RequestMapping("/vote/myVotePostListView")
	public String myVotePOstListView(VotePostVO votePostVO, HttpSession session, Model model) {
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		votePostVO.setEmpId(empVO.getEmpId());
		
		List<VotePostVO> votePostList = voteService.selectVotePostList(votePostVO);
		model.addAttribute("votePostList", votePostList);
		logger.debug("votePostList : {}", votePostList);
		
		
		// 해당 투표 작성자의 직급
		List<String> empTitleList = null;
		
		// 해당 투표 작성자의 부서, 팀명
		List<VotePostEmpDeptVO> empDeptInfoList = null;
		
		if(votePostList.size() > 0 && votePostList != null) {
			
			empTitleList = new ArrayList<String>();
			empDeptInfoList = new ArrayList<VotePostEmpDeptVO>();
			
			for(VotePostVO tempVO  : votePostList) {
				
				JobTitleVO empJobTitleVO = voteService.selectVotePostEmpJobTitle(tempVO.getEmpId());
				empJobTitleVO.setEmpId(tempVO.getEmpId());
				
				VotePostEmpDeptVO empDeptVO = voteService.selectVotePostEmpDeptInfo(empJobTitleVO);
				empTitleList.add(empJobTitleVO.getJobtitleNm());
				empDeptInfoList.add(empDeptVO);
			}
			model.addAttribute("empTitleList", empTitleList);
			model.addAttribute("empDeptInfoList", empDeptInfoList);
			logger.debug("empDeptInfoList : {}", empDeptInfoList);
		}
		
		// 투표 게시판 전체 페이지 수
		int votePostListCount = voteService.selectVotePostPageAllCount(votePostVO);
		
		PaginationVO pagination = new PaginationVO(votePostVO.getPageIndex(), votePostVO.getRecordCountPerPage(), 
												   votePostVO.getPageSize(), votePostListCount);
		model.addAttribute("pagination", pagination);
		
		
		int votePostFrontNum = ((votePostVO.getPageIndex() - 1) * votePostVO.getRecordCountPerPage());
		model.addAttribute("votePostSeq", votePostVO.getVotePostSeq());
		model.addAttribute("votePostList", votePostList);
		model.addAttribute("searchCondition", votePostVO.getSearchCondition());
		model.addAttribute("searchKeyword", votePostVO.getSearchKeyword());
		model.addAttribute("votePostFrontNum", votePostFrontNum);
		
		model.addAttribute("myORall", "my");
		
		return "tiles/vote/myVotePostList";
	}
	
	
	
	
	
}
