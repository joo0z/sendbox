package kr.or.ddit.business.busiboard.vo;

import kr.or.ddit.comm.vo.FileVO;

public class BusiFileVO extends FileVO {
	
	private int attachfileSeq;		//파일번호
	private int postSeq;			//게시글번호
	private String filepath;		//저장경로명
	private String realfilename;	//파일명
	private String attachfileSt;	//파일상태
	
	
	public BusiFileVO() {
	}

	

	public BusiFileVO(int attachfileSeq, int postSeq, String filepath, String realfilename, String attachfileSt) {
		super();
		this.attachfileSeq = attachfileSeq;
		this.postSeq = postSeq;
		this.filepath = filepath;
		this.realfilename = realfilename;
		this.attachfileSt = attachfileSt;
	}
	
	
	public BusiFileVO(FileVO fileVo, int postSeq) {
		super();
		this.setFilepath(fileVo.getFilepath());
		this.setAttachfileSt(fileVo.getAttachfileSt());
		this.setRealfilename(fileVo.getRealfilename());
		this.setPostSeq(fileVo.getPostSeq());
		this.postSeq = postSeq;
	}
	



	public int getAttachfileSeq() {
		return attachfileSeq;
	}

	public void setAttachfileSeq(int attachfileSeq) {
		this.attachfileSeq = attachfileSeq;
	}

	public int getPostSeq() {
		return postSeq;
	}

	public void setPostSeq(int postSeq) {
		this.postSeq = postSeq;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getRealfilename() {
		return realfilename;
	}

	public void setRealfilename(String realfilename) {
		this.realfilename = realfilename;
	}



	public String getAttachfileSt() {
		return attachfileSt;
	}



	public void setAttachfileSt(String attachfileSt) {
		this.attachfileSt = attachfileSt;
	}
	
	
	
}
