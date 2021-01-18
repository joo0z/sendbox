package kr.or.ddit.business.meeting.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.business.meeting.dao.MeetingMapperDao;
import kr.or.ddit.business.meeting.vo.MeetingVO;
import kr.or.ddit.business.meeting.vo.UsingVO;

@Service("meetingService")
public class MeetingService{
	
	@Resource(name="meetingMapperDao")
	private MeetingMapperDao meetingMapperDao;
	
	public List<MeetingVO> getMeeting() throws Exception {
		return meetingMapperDao.getMeeting();
	}
	public List<MeetingVO> revMeeting() throws Exception {
		return meetingMapperDao.revMeeting();
	}
	
	public int addMeeting(MeetingVO vo) throws Exception {
		return meetingMapperDao.addMeeting(vo);
	}
	
	public int deleteMeeting(MeetingVO vo) throws Exception {
		return meetingMapperDao.deleteMeeting(vo);
	}
	
	public MeetingVO selectMeeting(MeetingVO vo) throws Exception {
		return meetingMapperDao.selectMeeting(vo);
	}
	
	public int updateMeeting(MeetingVO vo) throws Exception {
		return meetingMapperDao.updateMeeting(vo);
	}
	
	public int checkMeeting(MeetingVO vo) throws Exception {
		return meetingMapperDao.checkMeeting(vo);
	}

	public MeetingVO usingMR(String meetroomId) throws Exception{
		return meetingMapperDao.usingMR(meetroomId);
	}
	
	public List<UsingVO> allMR() throws Exception{
		return meetingMapperDao.allMR();
	}
	
	
	
}
