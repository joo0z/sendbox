package kr.or.ddit.community.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.community.vo.CommuBKMKVO;
import kr.or.ddit.community.vo.CommuBoardFileVO;
import kr.or.ddit.community.vo.CommuBoardRepleVO;
import kr.or.ddit.community.vo.CommuBoardVO;
import kr.or.ddit.community.vo.CommuVO;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.jobTitle.vo.JobTitleVO;
import kr.or.ddit.vote.vo.VotePostEmpDeptVO;

@Mapper("commuMapperDao")
public interface CommuMapperDao {
	
	
	List<CommuVO> selectMyCommuList(CommuVO commuVO) throws Exception;

	List<CommuVO> selectListCommu(CommuVO commuVO) throws Exception;
	
	int selectCommuBoardPageAllCount(CommuBoardVO commuBoardVO) throws Exception;
	
	CommuVO selectCommuIcon(CommuVO commuVO) throws Exception;
	
	CommuBoardVO selectCommuBoard(CommuBoardVO commuBoardVO) throws Exception;
	
	int insertCommu(CommuVO commuVO) throws Exception;
	
	int updateCommu(CommuVO commuVO) throws Exception;
	
	List<CommuBKMKVO> selectListCommuBKMK(EmpVO empVO) throws Exception;
	
	List<CommuBoardVO> selectListCommuPost(CommuBoardVO commuBoardVO) throws Exception;
	
	List<CommuBoardFileVO> selectListCommuBoardFile(CommuBoardFileVO commuBF) throws Exception;
	
	int insertCommuBoard(CommuBoardVO commuBoardVO) throws Exception;
	
	int insertCommuBoardFile(CommuBoardFileVO commuBoardFileVO) throws Exception;
	
	int selectCurrval() throws Exception;
	
	int updateCommuBoard(CommuBoardVO commuBoardVO) throws Exception;
	
	int updateCommuBoardFile(CommuBoardFileVO commuBoardFileVO) throws Exception;
	
	List<CommuBoardRepleVO> selectListReple(CommuBoardRepleVO commuBoardRepleVO) throws Exception;
	
	int insertCommuReple(CommuBoardRepleVO commuRepleVO) throws Exception;
	
	int updateCommuRepleSt(CommuBoardRepleVO commuRepleVO) throws Exception;

	CommuBKMKVO selectMyBookMarkInfo(CommuBKMKVO commuBkmk) throws Exception;

	int insertCommuBKMK(CommuBKMKVO commuBkmk) throws Exception;

	int deleteCommuBKMK(CommuBKMKVO commuBkmk) throws Exception;

	String selectEmpTitle(String empId) throws Exception;

	JobTitleVO selectCommuBoardListEmpJobTitle(String empId) throws Exception;

	VotePostEmpDeptVO selectCommuBoardListEmpDeptInfo(JobTitleVO empJobTitleVO) throws Exception;

}
