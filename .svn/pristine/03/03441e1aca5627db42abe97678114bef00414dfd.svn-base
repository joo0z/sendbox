package kr.or.ddit.business.meeting.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.business.meeting.vo.MeetingVO;
import kr.or.ddit.business.meeting.vo.UsingVO;

@Mapper("meetingMapperDao")
public interface MeetingMapperDao {
	
	List<MeetingVO> getMeeting() throws Exception;
	
	int addMeeting(MeetingVO vo) throws Exception;

	int deleteMeeting(MeetingVO vo) throws Exception;

	MeetingVO selectMeeting(MeetingVO vo) throws Exception;
	
	int updateMeeting(MeetingVO vo) throws Exception;
	
	int checkMeeting(MeetingVO vo) throws Exception;
	
	List<MeetingVO> revMeeting() throws Exception;
	
	MeetingVO usingMR(String meetroomId) throws Exception;
	
	List<UsingVO> allMR() throws Exception;
}
