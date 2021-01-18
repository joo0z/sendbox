package kr.or.ddit.community.vo;

import java.util.Date;

import kr.or.ddit.comm.vo.BaseVO;

public class CommuVO extends BaseVO{

	private int commuSeq;
	private String commuNm;
	private String empId;
	private Date regDt;
	private String commuIconNm;
	private String commuIconPath;
	private String commuSt;
	
	
	
	

	
	
	public void setCommuNm(String commuNm) {
		this.commuNm = commuNm; 
	}
	public String getCommuNm() {
		return commuNm; 
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt; 
	}
	public Date getRegDt() {
		return regDt;
	}
	public void setCommuIconNm(String commuIconNm) {
		this.commuIconNm = commuIconNm; 
	}
	public String getCommuIconNm() {
		return commuIconNm; 
	}
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setCommuIconPath(String commuIconPath) {
		this.commuIconPath = commuIconPath; 
	}
	public String getCommuIconPath() {
		return commuIconPath; 
	}
	public void setCommuSeq(int commuSeq) {
		this.commuSeq = commuSeq; 
	}
	public int getCommuSeq() {
		return commuSeq; 
	}	
	public String getCommuSt() {
		return commuSt;
	}
	public void setCommuSt(String commuSt) {
		this.commuSt = commuSt;
	}

}
