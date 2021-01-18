package kr.or.ddit.vote.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.dept.vo.DeptVO;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.jobTitle.vo.JobTitleVO;
import kr.or.ddit.vote.dao.VoteMapperDao;
import kr.or.ddit.vote.vo.EmpVoteVO;
import kr.or.ddit.vote.vo.VoteItemVO;
import kr.or.ddit.vote.vo.VotePostEmpDeptVO;
import kr.or.ddit.vote.vo.VotePostVO;
import kr.or.ddit.vote.vo.VoteRepleVO;

@Service("voteService")
public class VoteService {

	
	private static final Logger logger = LoggerFactory.getLogger(VoteService.class);
	
	@Resource(name = "voteMapperDao")
	private VoteMapperDao voteMapperDao;

	
	
	
	
	public List<VotePostVO> selectVotePostList(VotePostVO votePostVO) {
		List<VotePostVO> votePostList = null;
		try {
			votePostList = voteMapperDao.selectVotePostList(votePostVO);
		} catch (Exception e) { e.printStackTrace(); }
		return votePostList;
	}

	
	
	
	
	public int selectVotePostPageAllCount(VotePostVO votePostVO) {
		int votePostPageAllCount = 0;
		try {
			votePostPageAllCount = voteMapperDao.selectVotePostPageAllCount(votePostVO);
		} catch (Exception e) { e.printStackTrace(); }
		return votePostPageAllCount;
	}





	public JobTitleVO selectVotePostEmpJobTitle(String empId) {
		JobTitleVO empJobTitleVO = null;
		try {
			empJobTitleVO = voteMapperDao.selectVotePostEmpJobTitle(empId);
		} catch (Exception e) { e.printStackTrace(); }
		return empJobTitleVO;
	}





	public VotePostEmpDeptVO selectVotePostEmpDeptInfo(JobTitleVO empJobTitleVO) {
		VotePostEmpDeptVO votePostEmpDeptInfoVO = null;
		try {
			votePostEmpDeptInfoVO = voteMapperDao.selectVotePostEmpDeptInfo(empJobTitleVO);
		} catch (Exception e) { e.printStackTrace(); }
		return votePostEmpDeptInfoVO;
	}





	public VotePostVO selectVotePostInfo(VotePostVO votePostVO) {
		VotePostVO votePostInfo = null;
		try {
			votePostInfo = voteMapperDao.selectVotePostInfo(votePostVO);
		} catch (Exception e) { e.printStackTrace(); }
		return votePostInfo;
	}





	public List<VoteItemVO> selectVotePostItemList(VotePostVO votePostVO) {
		List<VoteItemVO> voteItemList = null;
		try {
			voteItemList = voteMapperDao.selectVotePostItemList(votePostVO);
		} catch (Exception e) { e.printStackTrace(); }
		return voteItemList;
	}





	public List<VoteRepleVO> selectVoteRepleList(VotePostVO votePostVO) {
		List<VoteRepleVO> voteRepleList = null;
		try {
			voteRepleList = voteMapperDao.selectVoteRepleList(votePostVO);
		} catch (Exception e) { e.printStackTrace(); }
		return voteRepleList;
	}





	public List<EmpVoteVO> selectEmpVoteList(VotePostVO votePostVO) {
		List<EmpVoteVO> empVoteList = null;
		try {
			empVoteList = voteMapperDao.selectEmpVoteList(votePostVO);
		} catch (Exception e) {e.printStackTrace();}
		return empVoteList;
	}





	public int createVotePost(HttpSession session, VotePostVO votePostVO, List<String> voteItemInfoList) {
		
		
		int createVotePostRes = 0;
		int insertVoteItemRes = 0;
		int insertVoteItemCount = 0;
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		
		votePostVO.setEmpId(empVO.getEmpId());
		votePostVO.setEmpNm(empVO.getEmpNm());
		
		
		logger.debug("==============================================================================");
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("votePostInfo : {}", votePostVO);
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("==============================================================================");
		
		int votePostSeq = 0;
		int insertVotePost = 0;
		try {
			// 투표 게시글 번호
			votePostSeq = voteMapperDao.selectVotePostSeqInfo();
			votePostVO.setVotePostSeq(votePostSeq);
			
			// 투표 insert result
			insertVotePost = voteMapperDao.insertVotePostInfo(votePostVO);
			
			
			
			if(insertVotePost == 1) {
				for(int i=0; i<voteItemInfoList.size(); i++) {
					
					VoteItemVO voteItemVO = new VoteItemVO();
					voteItemVO.setVotePostSeq(votePostSeq);
					voteItemVO.setVoteItemCode(i);
					voteItemVO.setVoteItemNm(voteItemInfoList.get(i));
					
					insertVoteItemRes = voteMapperDao.insertVoteItemInfo(voteItemVO);
					if(insertVoteItemRes == 1) {
						insertVoteItemCount++;
					}
				}
			}
		} catch (Exception e1) { e1.printStackTrace(); }
		
		
		if(insertVotePost == 1 && insertVoteItemCount == voteItemInfoList.size()) {
			createVotePostRes = 1;
		}
		return createVotePostRes;
	}





	public int insertVoteReple(HttpSession session, VoteRepleVO voteReple) {
		
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		
		voteReple.setEmpId(empVO.getEmpId());
		voteReple.setEmpNm(empVO.getEmpNm());
		
		int insertVoteRepleRes = 0;
		try {
			insertVoteRepleRes = voteMapperDao.insertVoteReple(voteReple);
		} catch (Exception e) { e.printStackTrace(); }
		return insertVoteRepleRes;
	}





	public int insertVoteEmpInfo(HttpSession session, EmpVoteVO empVoteVO) {
		
		logger.debug("empVoteVO");
		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		
		empVoteVO.setEmpId(empVO.getEmpId());
		
		int empVoteInsertRes = 0;
		try {
			empVoteInsertRes = voteMapperDao.insertVoteEmp(empVoteVO);
		} catch (Exception e) { e.printStackTrace(); }
		return empVoteInsertRes;
	}





	public int votePostCompleate(VotePostVO votePost) {
		int votePostCompleateRes = 0;
		votePost.setVotePostSt("COM");
		try {
			votePostCompleateRes = voteMapperDao.votePostStatusUpdate(votePost);
		} catch (Exception e) { e.printStackTrace(); }
		return votePostCompleateRes;
	}





	public int votePostCancel(VotePostVO votePost) {
		int votePostCancelRes = 0;
		votePost.setVotePostSt("CAN");
		try {
			votePostCancelRes = voteMapperDao.votePostStatusUpdate(votePost);
		} catch (Exception e) { e.printStackTrace(); }
		return votePostCancelRes;
	}



	
	
	
	
}
