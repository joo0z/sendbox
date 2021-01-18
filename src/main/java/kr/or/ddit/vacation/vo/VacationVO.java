package kr.or.ddit.vacation.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class VacationVO {

	private int vacateSeq;
	private String empId;
	private String vacateStartDt;
	private String vacateEndDt;
	private int vacateCnt;
	private int vacateTypeSeq;
	private String vacateTypeName;
	private String vacateReason;
	private String yearInfo;
	private String vacateDayCnt;
	
	
	
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	
	
	
	
	public void setVacateStartDt(String vacateStartDt) {
		this.vacateStartDt = vacateStartDt;
	}
	public String getVacateStartDt() {
//		if(vacateStartDt != null) {
//			return new SimpleDateFormat("yyyy-MM-dd").format(vacateStartDt);
//		}else {
//			return "";
//		}
		return vacateStartDt;
	}
	
	
	public void setVacateEndDt(String vacateEndDt) {
		this.vacateEndDt = vacateEndDt;
	}
	public String getVacateEndDt() {
//		if(vacateEndDt != null) {
//			return new SimpleDateFormat("yyyy-MM-dd").format(vacateEndDt);
//		}else {
//			return "";
//		}
		return vacateEndDt;
	}
	
	
	
	
	
	
	public void setVacateCnt(int vacateCnt) {
		this.vacateCnt = vacateCnt; 
	}
	public int getVacateCnt() {
		return vacateCnt; 
	}
	
	
	
	public int getVacateTypeSeq() {
		return vacateTypeSeq;
	}
	public void setVacateTypeSeq(int vacateTypeSeq) {
		this.vacateTypeSeq = vacateTypeSeq;
	}
	
	
	public String getVacateTypeName() {
		return vacateTypeName;
	}
	public void setVacateTypeName(String vacateTypeName) {
		this.vacateTypeName = vacateTypeName;
	}
	
	
	public int getVacateSeq() {
		return vacateSeq;
	}
	public void setVacateSeq(int vacateSeq) {
		this.vacateSeq = vacateSeq;
	}
	
	
	public String getVacateReason() {
		return vacateReason;
	}
	public void setVacateReason(String vacateReason) {
		this.vacateReason = vacateReason;
	}
	
	
	public String getYearInfo() {
		return yearInfo;
	}
	public void setYearInfo(String yearInfo) {
		this.yearInfo = yearInfo;
	}
	
	
	public String getVacateDayCnt() {
		return vacateDayCnt;
	}
	public void setVacateDayCnt(String vacateDayCnt) {
		this.vacateDayCnt = vacateDayCnt;
	}
	
	
	

}
