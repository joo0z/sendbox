package kr.or.ddit.community.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class CommuBKMKVO extends BaseVO{

	private String empId;
	private int commuSeq;
	private String commuNm;
	
	
	
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setCommuSeq(int commuSeq) {
		this.commuSeq = commuSeq; 
	}
	public int getCommuSeq() {
		return commuSeq; 
	}
	public String getCommuNm() {
		return commuNm;
	}
	public void setCommuNm(String commuNm) {
		this.commuNm = commuNm;
	}

}
