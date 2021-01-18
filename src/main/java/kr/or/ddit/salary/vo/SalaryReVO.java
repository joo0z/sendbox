package kr.or.ddit.salary.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class SalaryReVO extends BaseVO{

	private String deptName;
	private String empNm;
	private String salarySt;
	private String jobtitleNm;
	private String salaryDt;
	private String salaryAmt;
	private String basicAmt;
	private String plusAmt;
	public void setDeptName(String deptName) {
		this.deptName = deptName; 
	}
	public String getDeptName() {
		return deptName; 
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm; 
	}
	public String getEmpNm() {
		return empNm; 
	}
	public void setSalarySt(String salarySt) {
		this.salarySt = salarySt; 
	}
	public String getSalarySt() {
		return salarySt; 
	}
	public void setJobtitleNm(String jobtitleNm) {
		this.jobtitleNm = jobtitleNm; 
	}
	public String getJobtitleNm() {
		return jobtitleNm; 
	}
	public void setSalaryDt(String salaryDt) {
		this.salaryDt = salaryDt; 
	}
	public String getSalaryDt() {
		return salaryDt; 
	}
	public void setSalaryAmt(String salaryAmt) {
		this.salaryAmt = salaryAmt; 
	}
	public String getSalaryAmt() {
		return salaryAmt; 
	}
	public String getBasicAmt() {
		return basicAmt;
	}
	public void setBasicAmt(String basicAmt) {
		this.basicAmt = basicAmt;
	}
	public String getPlusAmt() {
		return plusAmt;
	}
	public void setPlusAmt(String plusAmt) {
		this.plusAmt = plusAmt;
	}
}
