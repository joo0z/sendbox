package kr.or.ddit.attend.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.attend.dao.AttendMapperDao;
import kr.or.ddit.attend.vo.AttendVO;
import kr.or.ddit.attend.vo.WeekVO;
import kr.or.ddit.memo.dao.MemoMapper;

@Service("attendService")
public class AttendService{
	
	@Resource(name="attendMapperDao")
	private AttendMapperDao attendMapperDao;
	
	
	public int insertAttend(AttendVO attendVO) throws Exception {
		return attendMapperDao.insertAttend(attendVO);
	}
	
	public AttendVO getAttend(AttendVO attendVO) throws Exception {
		return attendMapperDao.getAttend(attendVO);
	}
	
	public int updateAttend(AttendVO attendVO) throws Exception {
		return attendMapperDao.updateAttend(attendVO);
	}
	
	public List<AttendVO> getAttendList(AttendVO attendVO) throws Exception {
		return attendMapperDao.getAttendList(attendVO);
	}

	public int selectAttendTotCnt() throws Exception{
		return attendMapperDao.selectAttendTotCnt();
	}

	public List<AttendVO> selectAttend(AttendVO attendVO) throws Exception{
		return attendMapperDao.selectAttend(attendVO);
	}
	
	public Double myMonthPlusAttend(AttendVO attendVO) throws Exception{
		return attendMapperDao.myMonthPlusAttend(attendVO);
	}
	
	public Double myWeekPlusAttend(AttendVO attendVO) throws Exception{
		return attendMapperDao.myWeekPlusAttend(attendVO);
	}
	
	public Double myMonthAttend(AttendVO attendVO) throws Exception{
		return attendMapperDao.myMonthAttend(attendVO);
	}
	
	public Double myWeekAttend(AttendVO attendVO) throws Exception{
		return attendMapperDao.myWeekAttend(attendVO);
	}
	
	public String monday(String empId) throws Exception{
		return attendMapperDao.monday(empId);
	}
	
	public String tuesday(String empId) throws Exception{
		return attendMapperDao.tuesday(empId);
	}
	
	public String wednesday(String empId) throws Exception{
		return attendMapperDao.wednesday(empId);
	}
	
	public String thursday(String empId) throws Exception{
		return attendMapperDao.thursday(empId);
	}
	
	public String friday(String empId) throws Exception{
		return attendMapperDao.friday(empId);
	}
}
