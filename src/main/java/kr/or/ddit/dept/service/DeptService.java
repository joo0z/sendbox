package kr.or.ddit.dept.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.business.busiboard.vo.BusiBoardVO;
import kr.or.ddit.business.library.vo.LibEmpVO;
import kr.or.ddit.businessTree.vo.BusinessTreeVO;
import kr.or.ddit.dept.dao.DeptMapperDao;
import kr.or.ddit.dept.vo.DeptVO;
import kr.or.ddit.emp.vo.EmpHistoryVO;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.jobTitle.vo.JobTitleVO;

@Service("deptService")
public class DeptService {

	@Resource(name = "deptMapperDao")
	private DeptMapperDao deptMapperDao;
	
	private static final Logger logger = LoggerFactory.getLogger(DeptService.class);
	
	public List<DeptVO> selectDeptTreeList() {
		List<DeptVO> deptTreeList = null;
		try {
			deptTreeList = deptMapperDao.selectDeptTreeList();
		} catch (Exception e) { e.printStackTrace(); }
		return deptTreeList;
	}



	public List<EmpVO> selectAllEmpList() {
		List<EmpVO> empList = null;
		try {
			empList = deptMapperDao.selectAllEmpList();
		} catch (Exception e) { e.printStackTrace(); }
		return empList;
	}



	public JobTitleVO selectEmpJobInfo(JobTitleVO empJobInfo) {
		JobTitleVO dbEmpJobInfo = null;
		try {
			dbEmpJobInfo = deptMapperDao.selectEmpJobInfo(empJobInfo);
		} catch (Exception e) { e.printStackTrace(); }
		return dbEmpJobInfo;
	}



	public DeptVO selectEmpDeptInfo(DeptVO empDeptInfo) {
		DeptVO dbEmpDeptInfo = null;
		try {
			dbEmpDeptInfo = deptMapperDao.selectEmpDeptInfo(empDeptInfo);
		} catch (Exception e) {	e.printStackTrace(); }
		return dbEmpDeptInfo;
	}



	public List<BusinessTreeVO> selectBusinessTreeList() {
		List<BusinessTreeVO> busiTreeList = null;
		try {
			busiTreeList = deptMapperDao.selectBusinessTreeList();
		} catch (Exception e) { e.printStackTrace(); }
		return busiTreeList;
	}



	public int creatDept(DeptVO deptVO) {
		
		int creatDeptRes = 0;
		
		// 상위부서의 정보
		DeptVO upperDeptInfo = null;
		try {
			upperDeptInfo = deptMapperDao.selectUpperDeptInfo(deptVO);
		} catch (Exception e) { e.printStackTrace(); }
		
		// 부서생성
		try {
			int creatDeptCnt = deptMapperDao.insertDeptInfo(deptVO);
			if(creatDeptCnt == 1) {
				
				// 부서 업무보고 게시판 생성
				BusiBoardVO busiBoardVO = new BusiBoardVO();
				busiBoardVO.setBoardNm(deptVO.getDeptName() + " 업무보고");
				busiBoardVO.setDeptId(deptVO.getDeptId());
				int creatBusiBoard = deptMapperDao.insertBusiBoard(busiBoardVO);
				
				
				// 부서 자료실 생성
				LibEmpVO libEmpVO = new LibEmpVO();
				libEmpVO.setDeptId(deptVO.getDeptId());
				libEmpVO.setLibraryNm(deptVO.getDeptName() + " 자료실");
				int creatBusiLibrary = deptMapperDao.insertBusiLibrary(libEmpVO);
				
				
				
				// 선택한 사원의 id를 사용하여 해당 사원의 정보를 가져온다.
				EmpVO tempEmpInfo = new EmpVO();
				tempEmpInfo.setEmpId(deptVO.getDeptHeadId());
				EmpVO empInfo = deptMapperDao.selectEmpInfo(tempEmpInfo);
				
				// empHistory에 담을 정보객체 생성
				EmpHistoryVO empHistoryVO = new EmpHistoryVO();
				empHistoryVO.setEmpId(empInfo.getEmpId());
				empHistoryVO.setDeptId(deptVO.getDeptId());
				empHistoryVO.setManagerId(upperDeptInfo.getDeptHeadId());
				
				
	      		// 상위부서에 따른 직급 부여
				if(deptVO.getUpperDeptId().equals("0000")) {
					empHistoryVO.setJobtitleId("3");
				}else {
					empHistoryVO.setJobtitleId("2");
				}
				
				// 상위부서에 따른 권한 부여
				if(deptVO.getUpperDeptId().equals("0002")) {
					empHistoryVO.setAuthLv(2);
				}else {
					empHistoryVO.setAuthLv(1);			
				}
				
				// 해당 사원의 이전기록의 endDt, upDt 정보를 update한다
				int empHistoryUpdateRes = deptMapperDao.updateEmpHistoryInfo(empHistoryVO);
				
				// 가져온 해당 사원의 정보를 empHitory 등록
				empHistoryVO.setDeptId(deptVO.getDeptId());
				logger.debug("==================================================================");
				logger.debug("");
				logger.debug("");
				logger.debug("deptVO : {}", deptVO);
				logger.debug("");
				logger.debug("");
				logger.debug("==================================================================");
				
				int empHistoryRes = deptMapperDao.insertEmpHistoryInfo(empHistoryVO);
				
				// 해당 사원의 상사정보와 부서정보 수정
				if(empHistoryRes == 1) {
					
					EmpVO upEmpInfoVO = new EmpVO();
					upEmpInfoVO.setEmpId(deptVO.getDeptHeadId());
					upEmpInfoVO.setDeptId(deptVO.getDeptId());
					upEmpInfoVO.setJobtitleId(empHistoryVO.getJobtitleId());
					upEmpInfoVO.setManagerId(upperDeptInfo.getDeptHeadId());
					upEmpInfoVO.setAuthLv(empHistoryVO.getAuthLv()+"");
					
					int updateDeptInfoRes = deptMapperDao.updateEmpInfo(upEmpInfoVO);
					if(updateDeptInfoRes == 1) {
						creatDeptRes++;
					}
				}
				
			}
		} catch (Exception e) { e.printStackTrace(); }
		
		return creatDeptRes;
	}
	
}
