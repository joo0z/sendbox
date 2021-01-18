package kr.or.ddit.attend.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class AttendVO extends BaseVO{

	private String workTime;
	private String homeTime;
	private String empId;
	private String attendSeq;
	private String attendDt;
	private String remark;
	private String loginIp;
	public void setWorkTime(String workTime) {
		this.workTime = workTime; 
	}
	public String getWorkTime() {
		return workTime; 
	}
	public void setHomeTime(String homeTime) {
		this.homeTime = homeTime; 
	}
	public String getHomeTime() {
		return homeTime; 
	}
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setAttendSeq(String attendSeq) {
		this.attendSeq = attendSeq; 
	}
	public String getAttendSeq() {
		return attendSeq; 
	}
	public void setAttendDt(String attendDt) {
		this.attendDt = attendDt; 
	}
	public String getAttendDt() {
		return attendDt; 
	}
	public void setRemark(String remark) {
		this.remark = remark; 
	}
	public String getRemark() {
		return remark; 
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
}
