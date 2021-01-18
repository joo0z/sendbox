package kr.or.ddit.business.library.vo;

public class LibEmpVO {

	private String deptId;
	private String upperDeptId;
	private String empId;
	private String libraryNm;
	private String libraryId;
	
	
	public void setDeptId(String deptId) {
		this.deptId = deptId; 
	}
	public String getDeptId() {
		return deptId; 
	}
	public void setUpperDeptId(String upperDeptId) {
		this.upperDeptId = upperDeptId; 
	}
	public String getUpperDeptId() {
		return upperDeptId; 
	}
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setLibraryNm(String libraryNm) {
		this.libraryNm = libraryNm; 
	}
	public String getLibraryNm() {
		return libraryNm; 
	}
	public void setLibraryId(String libraryId) {
		this.libraryId = libraryId; 
	}
	public String getLibraryId() {
		return libraryId; 
	}
	@Override
	public String toString() {
		return "LibEmpVO [deptId=" + deptId + ", upperDeptId=" + upperDeptId + ", empId=" + empId + ", libraryNm="
				+ libraryNm + ", libraryId=" + libraryId + "]";
	}
	
}
