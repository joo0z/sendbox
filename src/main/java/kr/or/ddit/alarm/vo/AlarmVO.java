package kr.or.ddit.alarm.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import kr.or.ddit.comm.vo.BaseVO;

public class AlarmVO extends BaseVO {

	private int alarmSeq;
	private String empId;
	private String alarmSender;
	private String alarmSt;
	private String alarmLinkCont;
	private String alarmCont;
	private Date alarmDt;
	
	
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getAlarmSender() {
		return alarmSender;
	}
	public void setAlarmSender(String alarmSender) {
		this.alarmSender = alarmSender;
	}
	public String getAlarmSt() {
		return alarmSt;
	}
	public void setAlarmSt(String alarmSt) {
		this.alarmSt = alarmSt;
	}
	public int getAlarmSeq() {
		return alarmSeq;
	}
	public void setAlarmSeq(int alarmSeq) {
		this.alarmSeq = alarmSeq;
	}
	public String getAlarmLinkCont() {
		return alarmLinkCont;
	}
	public void setAlarmLinkCont(String alarmLinkCont) {
		this.alarmLinkCont = alarmLinkCont;
	}
	public String getAlarmCont() {
		return alarmCont;
	}
	public void setAlarmCont(String alarmCont) {
		this.alarmCont = alarmCont;
	}
	public String getAlarmDt() {
		if(alarmDt != null) {
			return new SimpleDateFormat("yyyy-MM-dd").format(alarmDt);
		}else {
			return "";
		}
	}
	public void setAlarmDt(Date alarmDt) {
		this.alarmDt = alarmDt;
	}
	
	

}
