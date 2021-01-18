package kr.or.ddit.emp.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class EmpHistoryVO extends BaseVO{
	private String deptId;
	private String empId;
	private String empHisSeq;
	private String jobtitleId;
	private String updDt;
	private String endDt;
	private String startDt;
	private String managerId;
	private int authLv;
	
	public void setDeptId(String deptId) {
		this.deptId = deptId; 
	}
	public String getDeptId() {
		return deptId; 
	}
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setEmpHisSeq(String empHisSeq) {
		this.empHisSeq = empHisSeq; 
	}
	public String getEmpHisSeq() {
		return empHisSeq; 
	}
	public void setJobtitleId(String jobtitleId) {
		this.jobtitleId = jobtitleId; 
	}
	public String getJobtitleId() {
		return jobtitleId; 
	}
	public void setUpdDt(String updDt) {
		this.updDt = updDt; 
	}
	public String getUpdDt() {
		return updDt; 
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt; 
	}
	public String getEndDt() {
		return endDt; 
	}
	public void setStartDt(String startDt) {
		this.startDt = startDt; 
	}
	public String getStartDt() {
		return startDt; 
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public int getAuthLv() {
		return authLv;
	}
	public void setAuthLv(int authLv) {
		this.authLv = authLv;
	}

}
