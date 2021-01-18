package kr.or.ddit.report.vo;

public class ReportSignVO {
		
	private String signSeq;			//사인번호
	private String reportId;		//기안번호
	private String empId;			//사원번호
	private String signInfo;		//서명 정보
	public String getSignSeq() {
		return signSeq;
	}
	public void setSignSeq(String signSeq) {
		this.signSeq = signSeq;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getSignInfo() {
		return signInfo;
	}
	public void setSignInfo(String signInfo) {
		this.signInfo = signInfo;
	}
	@Override
	public String toString() {
		return "ReportSignVO [signSeq=" + signSeq + ", reportId=" + reportId + ", empId=" + empId + ", signInfo="
				+ signInfo + "]";
	}
	

}
