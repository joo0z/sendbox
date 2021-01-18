package kr.or.ddit.business.schedule.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.business.schedule.dao.ScheduleMapperDao;
import kr.or.ddit.business.schedule.vo.DeptVO;
import kr.or.ddit.business.schedule.vo.ScheduleVO;

@Service("scheduleService")
public class ScheduleService{
	
	@Resource(name="scheduleMapperDao")
	private ScheduleMapperDao scheduleMapperDao;
	
	public List<ScheduleVO> getSchedule(ScheduleVO vo) throws Exception {
		return scheduleMapperDao.getSchedule(vo);
	}
	
	public int addSchedule(ScheduleVO vo) throws Exception {
		return scheduleMapperDao.addSchedule(vo);
	}
	
	public ScheduleVO selectSchedule(ScheduleVO vo) throws Exception {
		return scheduleMapperDao.selectSchedule(vo);
	}
	public int deleteSchedule(ScheduleVO vo) throws Exception {
		return scheduleMapperDao.deleteSchedule(vo);
	}

	public int updateSchedule(ScheduleVO vo) throws Exception {
		return scheduleMapperDao.updateSchedule(vo);
	}
	
	public List<DeptVO> getDeptList() throws Exception{
		return scheduleMapperDao.getDeptList();
	}
	
}
