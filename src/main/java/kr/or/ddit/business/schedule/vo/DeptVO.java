package kr.or.ddit.business.schedule.vo;

public class DeptVO {

	private String deptId;
	private String deptName;
	private String deptHeadId;
	private String upperDeptId;
	
	public void setDeptId(String deptId) {
		this.deptId = deptId; 
	}
	public String getDeptId() {
		return deptId; 
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName; 
	}
	public String getDeptName() {
		return deptName; 
	}
	public void setDeptHeadId(String deptHeadId) {
		this.deptHeadId = deptHeadId; 
	}
	public String getDeptHeadId() {
		return deptHeadId; 
	}
	public String getUpperDeptId() {
		return upperDeptId;
	}
	public void setUpperDeptId(String upperDeptId) {
		this.upperDeptId = upperDeptId;
	}
}
