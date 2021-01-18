package kr.or.ddit.report.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class ApprovLineCounterVO extends BaseVO {

	private int apprLineCnt;
	private String apprKind;
	
	public ApprovLineCounterVO() {
	}
	
	
	public ApprovLineCounterVO(int apprLineCnt, String apprKind) {
		super();
		this.apprLineCnt = apprLineCnt;
		this.apprKind = apprKind;
	}

	public int getApprLineCnt() {
		return apprLineCnt;
	}

	public void setApprLineCnt(int apprLineCnt) {
		this.apprLineCnt = apprLineCnt;
	}

	public String getApprKind() {
		return apprKind;
	}

	public void setApprKind(String apprKind) {
		this.apprKind = apprKind;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((apprKind == null) ? 0 : apprKind.hashCode());
		result = prime * result + apprLineCnt;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ApprovLineCounterVO other = (ApprovLineCounterVO) obj;
		if (apprKind == null) {
			if (other.apprKind != null)
				return false;
		} else if (!apprKind.equals(other.apprKind))
			return false;
		if (apprLineCnt != other.apprLineCnt)
			return false;
		return true;
	}

	
	
	

}
