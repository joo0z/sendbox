package kr.or.ddit.comm.vo;

public class FileVO extends BaseVO {
	
	private int attachfileSeq;		//파일번호
	private int postSeq;			//게시글번호
	private String filepath;		//저장경로명
	private String realfilename;	//파일명
	private String attachfileSt;	//파일상태
	
	
	public FileVO() {
	}
		
	public FileVO(int attachfileSeq, int postSeq, String filepath, String realfilename, String attachfileSt) {
		super();
		this.attachfileSeq = attachfileSeq;
		this.postSeq = postSeq;
		this.filepath = filepath;
		this.realfilename = realfilename;
		this.attachfileSt = attachfileSt;
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
