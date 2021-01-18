package kr.or.ddit.alarm.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.alarm.dao.AlarmMapperDao;
import kr.or.ddit.alarm.vo.AlarmVO;
import kr.or.ddit.emp.vo.EmpVO;

@Service("alarmService")
public class AlarmService {
	
	@Resource(name = "alarmMapperDao")
	private AlarmMapperDao alarmMapperDao;

	private static final Logger logger = LoggerFactory.getLogger(AlarmService.class);
	
	
	
	public List<String> selectEmpIdList(String chatRoomId) throws Exception {
		return alarmMapperDao.selectEmpIdList(chatRoomId);
	}
	
	
	
	
	

	public List<AlarmVO> selectAlarmInfoList(String empId) {
		List<AlarmVO> alarmList = null;
		try {
			alarmList = alarmMapperDao.selectAlarmInfoList(empId);
		} catch (Exception e) { e.printStackTrace(); }
		return alarmList;
	}
	
	
	
	
	

	public int insertChatAlarm(String chatRoomId, String alarmCont, String senderId, String alarmLinkCont) {
		
		int insertAlarmCtn = 0;
		int empListLen = 0;

		List<String> empList = null;
		try {
			empList = alarmMapperDao.selectEmpIdList(chatRoomId);
			
			if(empList.size() > 0 && empList != null) {
				int insertCtn = 0;
				empListLen = empList.size();
				for(String empId : empList) {
					
					if(!senderId.equals(empId)) {
						
						logger.debug("senderId : {}, empId : {}", senderId, empId);
						
						AlarmVO alarm = new AlarmVO();
						alarm.setEmpId(empId);
						alarm.setAlarmCont(alarmCont);
						alarm.setAlarmSender(senderId);
						alarm.setAlarmLinkCont(alarmLinkCont);
						
						insertCtn = alarmMapperDao.insertAlarm(alarm);
						if(insertCtn == 1) {
							insertAlarmCtn++;
						}
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(empListLen == insertAlarmCtn) {
			return 1;
		}else {
			return 0;			
		}
	}






	public int insertPostAlarm(String sender, String receiverId, String alarmCont, String alarmLinkCont) throws Exception {
		
		AlarmVO alarm = new AlarmVO();
		alarm.setAlarmSender(sender);
		alarm.setEmpId(receiverId);
		alarm.setAlarmCont(alarmCont);
		alarm.setAlarmLinkCont(alarmLinkCont);
		
		return alarmMapperDao.insertAlarm(alarm);
	}






	public int updateMyAlarmStatus(EmpVO empVO) throws Exception {
		return alarmMapperDao.updateMyAlarmStatus(empVO);
	}






	public int updateReadMyAlarm(AlarmVO alarm) {
		
		int myAlarmYCnt = 0;
		int alarmUpdateReadChck;
		try {
			alarmUpdateReadChck = alarmMapperDao.updateReadMyAlarm(alarm);
			
			if(alarmUpdateReadChck == 1) {
				myAlarmYCnt = alarmMapperDao.selectMyAlarmYCnt(alarm.getEmpId());
			}
		} catch (Exception e) { e.printStackTrace(); }
		return myAlarmYCnt;
	}






	public int selectMyAlarmYCnt(String empId) {
		int myAlarmYCnt = 0;
		try {
			myAlarmYCnt = alarmMapperDao.selectMyAlarmYCnt(empId);
		} catch (Exception e) { e.printStackTrace(); }
		return myAlarmYCnt;
	}






	public List<AlarmVO> selectChatAlarmInfoList(String empId) {
		List<AlarmVO> alarmList = null;
		try {
			alarmList = alarmMapperDao.selectChatAlarmInfoList(empId);
		} catch (Exception e) { e.printStackTrace(); }
		return alarmList;
	}

	

}
