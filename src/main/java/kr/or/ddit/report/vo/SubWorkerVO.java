package kr.or.ddit.report.vo;

public class SubWorkerVO extends ReportVO {
	private String subWorkerSeq;				//대리근무자 시퀀스
	private String empId;						//원 근무자
	private String empNm;						//원 근무자 이름
	private String deptId;						//원 근무자의 부서 번호
	private String deptName;					//원 근무자의 부서명
	private String jobtitleId;					//원 근무자의 직급 아이디
	private String jobtitleNm;					//원 근무자의 직급명
	private String empAuthLv;					//원근무자 권한레벨
	private String reportId;					//기안번호
	private String subWorkerStartDt;			//대리근무 시작일
	private String subWorkerEndDt;				//대리근무 종료일
	private String subEmpId;					//대리 근무자 아이디
	private String subEmpNm;					//대리근무자 사원명
	private String subDeptId;					//대리근무자 부서 번호
	private String subDeptName;					//대리근무자 부서명
	private String subJobId;					//대리근무자 직급아이디
	private String subJobNm;					//대리근무자 직급명
	private String subEmpAuthLv;				//대리근무자 권한레벨
	private String status;						//상태
	private String subEmpStatus;				//대리근무 종료 여부
	
	

	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getJobtitleId() {
		return jobtitleId;
	}
	public void setJobtitleId(String jobtitleId) {
		this.jobtitleId = jobtitleId;
	}
	public String getJobtitleNm() {
		return jobtitleNm;
	}
	public void setJobtitleNm(String jobtitleNm) {
		this.jobtitleNm = jobtitleNm;
	}
	public String getSubDeptId() {
		return subDeptId;
	}
	public void setSubDeptId(String subDeptId) {
		this.subDeptId = subDeptId;
	}
	public String getSubDeptName() {
		return subDeptName;
	}
	public void setSubDeptName(String subDeptName) {
		this.subDeptName = subDeptName;
	}
	public String getSubJobId() {
		return subJobId;
	}
	public void setSubJobId(String subJobId) {
		this.subJobId = subJobId;
	}
	public String getSubJobNm() {
		return subJobNm;
	}
	public void setSubJobNm(String subJobNm) {
		this.subJobNm = subJobNm;
	}
	public String getSubEmpStatus() {
		return subEmpStatus;
	}
	public void setSubEmpStatus(String subEmpStatus) {
		this.subEmpStatus = subEmpStatus;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEmpAuthLv() {
		return empAuthLv;
	}
	public void setEmpAuthLv(String empAuthLv) {
		this.empAuthLv = empAuthLv;
	}
	public String getSubEmpAuthLv() {
		return subEmpAuthLv;
	}
	public void setSubEmpAuthLv(String subEmpAuthLv) {
		this.subEmpAuthLv = subEmpAuthLv;
	}
	public String getSubWorkerSeq() {
		return subWorkerSeq;
	}
	public void setSubWorkerSeq(String subWorkerSeq) {
		this.subWorkerSeq = subWorkerSeq;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public String getSubEmpId() {
		return subEmpId;
	}
	public void setSubEmpId(String subEmpId) {
		this.subEmpId = subEmpId;
	}
	public String getSubWorkerStartDt() {
		return subWorkerStartDt;
	}
	public void setSubWorkerStartDt(String subWorkerStartDt) {
		this.subWorkerStartDt = subWorkerStartDt;
	}
	public String getSubWorkerEndDt() {
		return subWorkerEndDt;
	}
	public void setSubWorkerEndDt(String subWorkerEndDt) {
		this.subWorkerEndDt = subWorkerEndDt;
	}
	public String getSubEmpNm() {
		return subEmpNm;
	}
	public void setSubEmpNm(String subEmpNm) {
		this.subEmpNm = subEmpNm;
	}
	
}
