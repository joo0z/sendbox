package kr.or.ddit.facemeeting.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.facemeeting.dao.FaceMeetingMapperDao;

@Service("faceMeetingService")
public class FaceMeetingService {

	
	@Resource(name = "faceMeetingMapperDao")
	private FaceMeetingMapperDao faceMeetingMapperDao;

	public String selectEmpJobTitleName(EmpVO empVO) {
		return faceMeetingMapperDao.selectEmpJobTitleName(empVO);
	}
	
	
	
}
