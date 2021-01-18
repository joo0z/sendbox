package kr.or.ddit.vote.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class EmpVoteVO {

	private int empVoteSeq;
	private int votePostSeq;
	private int voteItemCode;
	private String empId;
	private Date empVoteDt;
	private String empVoteSt;
	
	
	
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setEmpVoteSeq(int empVoteSeq) {
		this.empVoteSeq = empVoteSeq; 
	}
	public int getEmpVoteSeq() {
		return empVoteSeq; 
	}
	public void setEmpVoteDt(Date empVoteDt) {
		this.empVoteDt = empVoteDt; 
	}
	public String getEmpVoteDt() {
		if(empVoteDt != null) {
			return new SimpleDateFormat("yyyy-MM-dd").format(empVoteDt);
		}else {
			return "";
		}
	}
	public void setEmpVoteSt(String empVoteSt) {
		this.empVoteSt = empVoteSt; 
	}
	public String getEmpVoteSt() {
		return empVoteSt; 
	}
	public void setVotePostSeq(int votePostSeq) {
		this.votePostSeq = votePostSeq; 
	}
	public int getVotePostSeq() {
		return votePostSeq; 
	}
	public int getVoteItemCode() {
		return voteItemCode;
	}
	public void setVoteItemCode(int voteItemCode) {
		this.voteItemCode = voteItemCode;
	}

}
