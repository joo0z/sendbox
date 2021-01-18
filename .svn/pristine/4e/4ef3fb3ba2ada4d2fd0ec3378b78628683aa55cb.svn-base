package kr.or.ddit.attend.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.attend.vo.AttendVO;
import kr.or.ddit.attend.vo.WeekVO;

@Mapper("attendMapperDao")
public interface AttendMapperDao {
	
	int insertAttend(AttendVO attendVO) throws Exception;
	
	AttendVO getAttend(AttendVO attendVO) throws Exception;
	
	int updateAttend(AttendVO attendVO) throws Exception;
	
	List<AttendVO> getAttendList(AttendVO attendVO) throws Exception;

	int selectAttendTotCnt() throws Exception;

	List<AttendVO> selectAttend(AttendVO attendVO) throws Exception;
	
	
	Double myMonthPlusAttend(AttendVO attendVO) throws Exception;
	
	Double myWeekPlusAttend(AttendVO attendVO) throws Exception;
	
	Double myMonthAttend(AttendVO attendVO) throws Exception;
	
	Double myWeekAttend(AttendVO attendVO) throws Exception;
	
	String monday(String empId) throws Exception;
	
	String tuesday(String empId) throws Exception;
	
	String wednesday(String empId) throws Exception;
	
	String thursday(String empId) throws Exception;
	
	String friday(String empId) throws Exception;
}
