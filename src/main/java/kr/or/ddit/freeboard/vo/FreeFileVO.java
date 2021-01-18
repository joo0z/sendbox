package kr.or.ddit.freeboard.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class FreeFileVO extends BaseVO{
	
	private int attachfileSeq;			//파일번호(PK)
	private int postSeq;				//게시글번호(FK)
	private String filepath;			//저장경로명
	private String realfilename;		//파일명
	private String attachfileSt;		//파일상태
	
	public FreeFileVO() {
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
