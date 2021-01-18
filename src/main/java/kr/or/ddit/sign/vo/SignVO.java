package kr.or.ddit.sign.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class SignVO extends BaseVO{

	private String empId;
	private String signSeq;
	private String signInfo;
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setSignSeq(String signSeq) {
		this.signSeq = signSeq; 
	}
	public String getSignSeq() {
		return signSeq; 
	}
	public void setSignInfo(String signInfo) {
		this.signInfo = signInfo; 
	}
	public String getSignInfo() {
		return signInfo; 
	}

}
