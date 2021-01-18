package kr.or.ddit.community.vo;

import java.util.Date;

import kr.or.ddit.comm.vo.BaseVO;

public class CommuBoardRepleVO extends BaseVO{

	private int repleSeq;
	private int boardSeq;
	private String empId;
	private String empNm;
	private String repleCont;
	private Date repleDt;
	private String repleSt;
	
	
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setRepleCont(String repleCont) {
		this.repleCont = repleCont; 
	}
	public String getRepleCont() {
		return repleCont; 
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq; 
	}
	public int getBoardSeq() {
		return boardSeq; 
	}
	public void setRepleDt(Date repleDt) {
		this.repleDt = repleDt; 
	}
	public Date getRepleDt() {
		return repleDt; 
	}
	public void setRepleSt(String repleSt) {
		this.repleSt = repleSt; 
	}
	public String getRepleSt() {
		return repleSt; 
	}
	public void setRepleSeq(int repleSeq) {
		this.repleSeq = repleSeq; 
	}
	public int getRepleSeq() {
		return repleSeq; 
	}
	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

}
