package kr.or.ddit.vote.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class VoteRepleVO {

	private int voteRepleSeq;
	private int votePostSeq;
	private String empId;
	private String empNm;
	private String voteRepleSt;
	private String voteRepleCont;
	private Date voteRepleDt;
	
	
	
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm; 
	}
	public String getEmpNm() {
		return empNm; 
	}
	public void setVoteRepleSeq(int voteRepleSeq) {
		this.voteRepleSeq = voteRepleSeq; 
	}
	public int getVoteRepleSeq() {
		return voteRepleSeq; 
	}
	public void setVoteRepleSt(String voteRepleSt) {
		this.voteRepleSt = voteRepleSt; 
	}
	public String getVoteRepleSt() {
		return voteRepleSt; 
	}
	public void setVoteRepleCont(String voteRepleCont) {
		this.voteRepleCont = voteRepleCont; 
	}
	public String getVoteRepleCont() {
		return voteRepleCont; 
	}
	public void setVoteRepleDt(Date voteRepleDt) {
		this.voteRepleDt = voteRepleDt; 
	}
	public String getVoteRepleDt() {
		if(voteRepleDt != null) {
			return new SimpleDateFormat("yyyy-MM-dd").format(voteRepleDt);
		}else {
			return "";
		}
	}
	public void setVotePostSeq(int votePostSeq) {
		this.votePostSeq = votePostSeq; 
	}
	public int getVotePostSeq() {
		return votePostSeq; 
	}

}
