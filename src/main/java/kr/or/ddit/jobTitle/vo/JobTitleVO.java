package kr.or.ddit.jobTitle.vo;

public class JobTitleVO {

	private int jobtitleId;
	private String jobtitleNm;
	private String empId;
	
	
	
	public void setJobtitleId(int jobtitleId) {
		this.jobtitleId = jobtitleId; 
	}
	public int getJobtitleId() {
		return jobtitleId; 
	}
	public void setJobtitleNm(String jobtitleNm) {
		this.jobtitleNm = jobtitleNm; 
	}
	public String getJobtitleNm() {
		return jobtitleNm; 
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}

}
