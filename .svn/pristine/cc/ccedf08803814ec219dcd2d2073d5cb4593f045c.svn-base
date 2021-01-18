package kr.or.ddit.community.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import kr.or.ddit.comm.vo.BaseVO;

public class CommuBoardVO extends BaseVO{

	private int commuSeq;
	private int boardSeq;
	private String empId;
	private String empNm;
	private String boardTitle;
	private String boardCont;
	private Date boardDt;
	private String boardSt;
	
	
	public void setBoardDt(Date boardDt) {
		this.boardDt = boardDt; 
	}
	public String getBoardDt() {
		if(boardDt != null) {
			return new SimpleDateFormat("yyyy-MM-dd").format(boardDt);
		}else {
			return "";
		}
	}
	public void setBoardSt(String boardSt) {
		this.boardSt = boardSt; 
	}
	public String getBoardSt() {
		return boardSt; 
	}
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setBoardCont(String boardCont) {
		this.boardCont = boardCont; 
	}
	public String getBoardCont() {
		return boardCont; 
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq; 
	}
	public int getBoardSeq() {
		return boardSeq; 
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle; 
	}
	public String getBoardTitle() {
		return boardTitle; 
	}
	public void setCommuSeq(int commuSeq) {
		this.commuSeq = commuSeq; 
	}
	public int getCommuSeq() {
		return commuSeq; 
	}
	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}

}
