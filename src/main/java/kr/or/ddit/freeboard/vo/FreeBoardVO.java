package kr.or.ddit.freeboard.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import kr.or.ddit.comm.vo.BaseVO;

public class FreeBoardVO extends BaseVO{
	
	private int postSeq;			//게시글번호(PK)			
	private String empId;			//작성자(FK)
	private String empNm; 			//작성자 이름
	private String title;			//제목
	private String cont;			//내용
	private Date regDt;				//등록일자	
	private Date updDt;				//수정일자
	private String postSt;			//상태
	
	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}
	public int getPostSeq() {
		return postSeq;
	}
	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getRegDt() {
		if(regDt != null) {
			return new SimpleDateFormat("yyyy-MM-dd").format(regDt);
		}else {
			return "";
		}
	}
	public void setRegDt(Date regDt) {
		this.regDt = regDt;
	}
	public Date getUpdDt() {
		return updDt;
	}
	public void setUpdDt(Date updDt) {
		this.updDt = updDt;
	}
	public String getPostSt() {
		return postSt;
	}
	public void setPostSt(String postSt) {
		this.postSt = postSt;
	}
	
}
