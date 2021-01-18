package kr.or.ddit.notice.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class NoticeFileVO extends BaseVO{

	private int attachfileSeq;   // 파일번호
	private String realfilename; // 파일명
	private String filepath;	 // 파일경로
	private int noticeSeq;		 // 글번호
	
	// 생성자
	public NoticeFileVO() {
	}
	
	public NoticeFileVO(int attachfileSeq,String realfilename,String filepath,int noticeSeq) {
		this.attachfileSeq = attachfileSeq;
		this.filepath = filepath;
		this.realfilename = realfilename;
		this.noticeSeq = noticeSeq;
	}
	
	public int getAttachfileSeq() {
		return attachfileSeq;
	}
	public void setAttachfileSeq(int attachfileSeq) {
		this.attachfileSeq = attachfileSeq;
	}
	public String getRealfilename() {
		return realfilename;
	}
	public void setRealfilename(String realfilename) {
		this.realfilename = realfilename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getNoticeSeq() {
		return noticeSeq;
	}
	public void setNoticeSeq(int noticeSeq) {
		this.noticeSeq = noticeSeq;
	}
	
	

}
