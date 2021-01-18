package kr.or.ddit.vote.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.jobTitle.vo.JobTitleVO;
import kr.or.ddit.vote.vo.EmpVoteVO;
import kr.or.ddit.vote.vo.VoteItemVO;
import kr.or.ddit.vote.vo.VotePostEmpDeptVO;
import kr.or.ddit.vote.vo.VotePostVO;
import kr.or.ddit.vote.vo.VoteRepleVO;


@Mapper("voteMapperDao")
public interface VoteMapperDao {

	
	// 투표 게시판 리스트
	List<VotePostVO> selectVotePostList(VotePostVO votePostVO) throws Exception;

	// 투표 게시판 전체 길이
	int selectVotePostPageAllCount(VotePostVO votePostVO) throws Exception;

	// 투표 게시글 작성자의 직급정보
	JobTitleVO selectVotePostEmpJobTitle(String empId) throws Exception;

	// 투표 게시글 작성자의 직급에 따른 부서정보
	VotePostEmpDeptVO selectVotePostEmpDeptInfo(JobTitleVO empJobTitleVO) throws Exception;

	// 투표 게시글 정보
	VotePostVO selectVotePostInfo(VotePostVO votePostVO) throws Exception;

	// 투표 게시글의 투표선택 목록 리스트 정보
	List<VoteItemVO> selectVotePostItemList(VotePostVO votePostVO) throws Exception;

	// 투표 게시글의 댓글 리스트 정보 
	List<VoteRepleVO> selectVoteRepleList(VotePostVO votePostVO) throws Exception;
	
	// 투표 게시글에서 사원이 투표한 정보 리스트
	List<EmpVoteVO> selectEmpVoteList(VotePostVO votePostVO) throws Exception;
	
	// 투표 게시글 시퀀스 정보 
	int selectVotePostSeqInfo() throws Exception;

	// 투표 게시글 작성 메서드
	int insertVotePostInfo(VotePostVO votePostVO) throws Exception;

	// 투표 게시글의 투표 항목 insert
	int insertVoteItemInfo(VoteItemVO voteItemVO) throws Exception;

	// 투표 게시글의 댓글 insert
	int insertVoteReple(VoteRepleVO voteReple) throws Exception;

	// 사원이 해당 투표 게시글에 투표한 정보를 insert
	int insertVoteEmp(EmpVoteVO empVoteVO) throws Exception;

	// 투표 진행자의 진행 투표 게시글의 상태를 받아온 상태코드로 변경
	int votePostStatusUpdate(VotePostVO votePost) throws Exception;


}
