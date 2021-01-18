package kr.or.ddit.freeboard.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.freeboard.vo.FreeBoardVO;
import kr.or.ddit.freeboard.vo.FreeFileVO;
import kr.or.ddit.freeboard.vo.FreeRepleVO;

@Mapper("freeBoardMapperDao")
public interface FreeBoardMapperDao { // throws Exception
	
	int selectFreeBoardPageAllCount(FreeBoardVO fbVO) throws Exception;
	
	FreeBoardVO selectFreeBoard(FreeBoardVO freeBoardVO) throws Exception;

	List<FreeBoardVO> selectListFreePost(FreeBoardVO freeBoardVO) throws Exception;

	List<FreeFileVO> selectListFreeBoardFile(FreeFileVO freeBF) throws Exception;

	int insertFreeBoard(FreeBoardVO freeBoardVO) throws Exception;

	int insertFreeBoardFile(FreeFileVO freeBoardFileVO) throws Exception;

	int selectCurrval() throws Exception;

	int updateFreeBoard(FreeBoardVO freeBoardVO) throws Exception;
	
	int deleteFreeBoard(FreeBoardVO freeBoardVO) throws Exception;

	int updateFreeBoardFile(FreeFileVO freeBoardFileVO) throws Exception;

	List<FreeRepleVO> selectListReple(FreeRepleVO freeBoardRepleVO) throws Exception;

	int insertFreeReple(FreeRepleVO freeRepleVO) throws Exception;

	int updateFreeRepleSt(FreeRepleVO freeRepleVO) throws Exception;

}
