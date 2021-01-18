package kr.or.ddit.report.vo;

import java.util.List;

import kr.or.ddit.comm.vo.BaseVO;

public class ApprovLineListVO extends BaseVO {
	
	private List<ApprovLineVO> approvLineList;
	private String apprKind;
	private String empId;
	private String apprStCode;
	
	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getApprStCode() {
		return apprStCode;
	}

	public void setApprStCode(String apprStCode) {
		this.apprStCode = apprStCode;
	}

	public String getApprKind() {
		return apprKind;
	}

	public void setApprKind(String apprKind) {
		this.apprKind = apprKind;
	}

	public List<ApprovLineVO> getApprovLineList() {
		return approvLineList;
	}

	public void setApprovLineList(List<ApprovLineVO> approvLineList) {
		this.approvLineList = approvLineList;
	}
	
	
}
