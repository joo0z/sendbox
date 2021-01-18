package kr.or.ddit.report.util;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.or.ddit.report.vo.ReportVO;

public class ReportVOValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ReportVO.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object obj, Errors err) {
		ReportVO report = (ReportVO) obj;
		
		if(report.getTypeId() == null || "".equals(report.getTypeId())) {
			err.rejectValue("typeId", "required");
		}
		
		if(report.getApprKind() == null || "".equals(report.getApprKind())) {
			err.rejectValue("apprKind", "required");
		}
		
		if(report.getTitle() == null || "".equals(report.getTitle())) {
			err.rejectValue("title", "required");
		}
		
		if(report.getContent() == null || "".equals(report.getContent())) {
			err.rejectValue("content", "required");
		}
		
		
		if(report.getSignInfo() == null || "".equals(report.getSignInfo())) {
			err.rejectValue("signInfo", "required");
		}
		
		if(!"T5".equals(report.getTypeId())) {
			if(report.getStartDt() == null || "".equals(report.getStartDt())) {
				err.rejectValue("startDt", "required");
			}			
		}
				
		if("T2".equals(report.getTypeId()) || "T4".equals(report.getTypeId())) {
			if(report.getReportOptCont() == null || "".equals(report.getReportOptCont())) {
				err.rejectValue("reportOptCont", "required");
			}			
		}
		if(!"T1".equals(report.getTypeId()) && !"T5".equals(report.getTypeId())) {
			if(report.getEndDt() == null || "".equals(report.getEndDt())) {
				err.rejectValue("endDt", "required");
			}
		}
	}
}
