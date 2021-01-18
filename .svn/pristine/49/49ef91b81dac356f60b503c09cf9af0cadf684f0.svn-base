package kr.or.ddit.business.schedule.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.business.schedule.vo.DeptVO;
import kr.or.ddit.business.schedule.vo.ScheduleVO;

@Mapper("scheduleMapperDao")
public interface ScheduleMapperDao {
	
	List<ScheduleVO> getSchedule(ScheduleVO vo) throws Exception;
	
	int addSchedule(ScheduleVO vo) throws Exception;
	
	ScheduleVO selectSchedule(ScheduleVO vo) throws Exception;

	int deleteSchedule(ScheduleVO vo) throws Exception;

	int updateSchedule(ScheduleVO vo) throws Exception; 
	
	List<DeptVO> getDeptList() throws Exception;
}
