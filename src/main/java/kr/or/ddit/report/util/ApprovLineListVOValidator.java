package kr.or.ddit.report.util;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.or.ddit.report.vo.ApprovLineListVO;

public class ApprovLineListVOValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		return ApprovLineListVO.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		ApprovLineListVO approvLineListVo = (ApprovLineListVO) arg0;
		
		if(approvLineListVo.getApprovLineList() == null) {
			arg1.rejectValue("approvLineList", "required");
		}
		
	}

}
