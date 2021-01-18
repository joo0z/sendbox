package kr.or.ddit.business.library.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class LibVO extends BaseVO{

	private int parFileId;		//부모자료번호
	private String fileSt;		//자료상태
	private String fileSize;	//파일크기
	private String fileInDt;	//파일등록일자
	private String fileRealNm;	//자료이름 
	private String empId;		//등록자
	private String libraryId;	//자료실번호
	private String filePath;	//자료경로
	private String fileIconId;	//자료타입아이콘번호
	private String fileFolder;	//파일폴더구분
	private int fileSeq;		//자료번호
	
	// LIBRARY 테이블
	private String deptId;		//부서번호
	private String libraryNm;	//자료실이름
	
	// FILE_ICON  테이블
	private String fileType;		//자료타입
	private String fileIconPath;	//아이콘경로
	
	public int getParFileId() {
		return parFileId;
	}
	public void setParFileId(int parFileId) {
		this.parFileId = parFileId;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getLibraryNm() {
		return libraryNm;
	}
	public void setLibraryNm(String libraryNm) {
		this.libraryNm = libraryNm;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileIconPath() {
		return fileIconPath;
	}
	public void setFileIconPath(String fileIconPath) {
		this.fileIconPath = fileIconPath;
	}
	public void setFileSt(String fileSt) {
		this.fileSt = fileSt; 
	}
	public String getFileSt() {
		return fileSt; 
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize; 
	}
	public String getFileSize() {
		return fileSize; 
	}
	public void setFileInDt(String fileInDt) {
		this.fileInDt = fileInDt; 
	}
	public String getFileInDt() {
		return fileInDt; 
	}
	public void setFileRealNm(String fileRealNm) {
		this.fileRealNm = fileRealNm; 
	}
	public String getFileRealNm() {
		return fileRealNm; 
	}
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setLibraryId(String libraryId) {
		this.libraryId = libraryId; 
	}
	public String getLibraryId() {
		return libraryId; 
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath; 
	}
	public String getFilePath() {
		return filePath; 
	}
	public void setFileIconId(String fileIconId) {
		this.fileIconId = fileIconId; 
	}
	public String getFileIconId() {
		return fileIconId; 
	}
	public void setFileFolder(String fileFolder) {
		this.fileFolder = fileFolder; 
	}
	public String getFileFolder() {
		return fileFolder; 
	}
	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq; 
	}
	public int getFileSeq() {
		return fileSeq; 
	}

}
