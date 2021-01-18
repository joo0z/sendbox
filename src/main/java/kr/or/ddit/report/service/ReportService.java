package kr.or.ddit.report.service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import kr.or.ddit.comm.util.FileUtils;
import kr.or.ddit.comm.vo.FileVO;
import kr.or.ddit.emp.dao.EmpMapper;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.report.dao.ReportMapperDao;
import kr.or.ddit.report.vo.ApprovLineCounterVO;
import kr.or.ddit.report.vo.ApprovLineListVO;
import kr.or.ddit.report.vo.ApprovLineVO;
import kr.or.ddit.report.vo.ApprovalVO;
import kr.or.ddit.report.vo.ReportFileVO;
import kr.or.ddit.report.vo.ReportTypeVO;
import kr.or.ddit.report.vo.ReportVO;
import kr.or.ddit.report.vo.SubWorkerVO;
import kr.or.ddit.vacation.dao.VacationMapperDao;
import kr.or.ddit.vacation.vo.VacatTypeVO;
import kr.or.ddit.vacation.vo.VacationVO;

@Service("reportService")
public class ReportService {
	
	private static final Logger logger = LoggerFactory.getLogger(ReportService.class);
	
	@Resource(name="reportMapperDao")
	private ReportMapperDao reportMapperDao;
	
	@Resource(name="vacationMapperDao")
	private VacationMapperDao vacationMapperDao;
	
	@Resource(name="empMapper")
	private EmpMapper empMapperDao;

	public List<ReportVO> getRepostList(ReportVO reportVo) throws Exception {
		return reportMapperDao.getRepostList(reportVo);
	}

	public int selectReportTotCnt(ReportVO reportVo){
		int totCnt = 0;
		try {
			totCnt = reportMapperDao.selectReportTotCnt(reportVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totCnt;
	}
	
	/**
	 * 기안문 양식을 모두 가져오는 메서드
	 * @return	기안문 양식 리스트
	 * @throws Exception
	 */
	public List<ReportTypeVO> selectReportTypeList() throws Exception{
		return reportMapperDao.selectReportTypeList();
	}

	
	/* 조직도 데이터 가져오는 메서드*/
	
	/**
	 * 사원이 등록한 결재선 목록을 가져오는 메서드
	 * @param approvLineVo		사원의 사원번호를 담은 VO 객체
	 * @return			결재선 목록
	 * @throws Exception
	 */
	public List<ApprovLineVO> selectApprovLineList(String empId) throws Exception {
		logger.debug("apprivLineVO 정보 : {}",empId);
		return reportMapperDao.selectApprovLineList(empId);
	}

	/**
	 * 결재선 종류별로 결재 횟수를 가져오는 메서드
	 * @param approvLineVo		사원의 사원번호를 담은 VO 객체
	 * @return				결재선 종류별 결재 횟수 정보를 담고 있는  VO 객체 리스트
	 */
	public List<ApprovLineCounterVO> selectApprLineCounterList(String empId){
		List<ApprovLineCounterVO> approvLineCounter = null;
		try {
			approvLineCounter = reportMapperDao.selectApprLineCounterList(empId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return approvLineCounter;
	}
	
	/**
	 * 사원이 선택한 결재선을 가져오는 메서드
	 * @param approvLineVo		결재선의 결재선 이름을 담은 ApprovLineVO
	 * @return					결재선 데이터
	 */

	public List<ApprovLineVO> selectApprovLine(ApprovLineVO approvLineVo) throws Exception {
		return reportMapperDao.selectApprovLine(approvLineVo);
	}

	/**
	 * 추가한 결재선을 db에 저장하는 메서드
	 * @param approvLineListVo		결재선 정보를 담은 Vo객체
	 * @return						추가된 로우 카운트
	 * @throws Exception
	 */
	public String insertApprovLine(ApprovLineListVO approvLineListVo){
		try {
			reportMapperDao.insertApprovLine(approvLineListVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return approvLineListVo.getApprKind(); 
	}

	/**
	 * 사용자가 설정한 기안서 정보를 바탕으로 새로운 기안정보를  db에 등록하고 가져오는 메서드
	 * @param reportVo			사용자 설정 정보를 저장하고 있는 ReportVO 객체
	 * @return					새롭게 등록된 기안서 정보를 담고 있는  ReportVO 객체
	 */
	public ReportVO insertReport(ReportVO reportVo, HttpSession session) {
		String uploadtoken = (String) session.getAttribute("uploadtoken");
		
		ReportVO report = null;
		String reportId = null;
		try {
			if(reportVo.getUploadtoken().equals(uploadtoken)) {
				if(reportVo.getApprover() == null || "".equals(reportVo.getApprover())) {
					reportMapperDao.insertReport(reportVo);
				}								
				session.setAttribute("reportId", reportVo.getReportId());
			}else {
				reportId = (String) session.getAttribute("reportId");
				reportVo.setReportId(reportId);
				reportMapperDao.updateReport(reportVo);
			}
			report = reportMapperDao.selectReport(reportVo);
			report.setSignInfo(reportMapperDao.selectEmpSign(reportVo));
			ApprovLineVO approvLineVo = new ApprovLineVO();
			approvLineVo.setEmpId(report.getEmpId());
			approvLineVo.setApprKind(report.getApprKind());
			List<ApprovLineVO> approvLine = reportMapperDao.selectApprovLine(approvLineVo); 
			report.setApprovLineList(approvLine);
			report.setApprover(approvLine.get(0).getApprCurrEmp());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return report;
				
	}

	public String insertReportComponent(ReportVO reportVo) {
		
		List<FileVO> fileList = FileUtils.createFileList(reportVo.getFileList());
		List<ReportFileVO> reportFileList = new ArrayList<ReportFileVO>();
		
		for (FileVO file : fileList ) {
			ReportFileVO reportFile = new ReportFileVO(file, reportVo.getReportId());
			reportFileList.add(reportFile);
		}
		reportVo.setReportFileList(reportFileList);
		
		logger.debug("**fileList : {}", reportVo.getReportFileList());
		
		reportVo.setReportSt("W");
		String result = "fail";
		try {
			reportMapperDao.updateReport(reportVo);
			reportMapperDao.insertReportSign(reportVo);
			if(!reportFileList.isEmpty()) {
				reportMapperDao.insertReportFileList(reportVo);				
			}
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public ReportVO selectReport(ReportVO reportVo) {
		ReportVO report = null;
		try {
			report = reportMapperDao.selectReport(reportVo);
			if("vacatType".equals(report.getReportOptCode())) {
				VacatTypeVO vacatTypeVo = new VacatTypeVO();
				vacatTypeVo.setVacateTypeCode((report.getReportOptCont()));
				vacatTypeVo = vacationMapperDao.selectVacatType(vacatTypeVo);
				report.setVacatTypeName(vacatTypeVo.getVacateTypeName());
			}
			if("Y".equals(report.getReportSt()) || "N".equals(report.getReportSt())) {
				reportVo.setReadYn("Y");
				reportMapperDao.updateReport(reportVo);
			}
			ApprovLineVO approvLineVo = new ApprovLineVO();
			approvLineVo.setApprKind(report.getApprKind());
			approvLineVo.setEmpId(report.getEmpId());
			List<ApprovLineVO> approvLineList = reportMapperDao.selectApprovLine(approvLineVo);
			report.setApprovLineList(approvLineList);
			report.setSignInfo(reportMapperDao.selectEmpSign(reportVo));
			report.setReportSignList(reportMapperDao.selectSignList(report));
			report.setReportFileList(reportMapperDao.selectReportFileList(report));
			List<ApprovalVO> approvalList = reportMapperDao.selectApprovalList(report); 
			report.setApprovalList(approvalList);
			for (ApprovalVO approvalVO : approvalList) {
				if(reportVo.getEmpId().equals(approvalVO.getEmpId())) {
					approvalVO.setCheckYn("Y");
					reportMapperDao.updateApproval(approvalVO);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return report;
	}

	public List<ReportVO> selectReportList(ReportVO reportVo) {
		List<ReportVO> reportList = null;
		try {
			reportList = reportMapperDao.selectReportList(reportVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reportList;
	}

	/*public ReportVO insertApproval(ReportVO reportVo) {
		if("W".equals(reportVo.getReportSt())) {
			reportVo.setReportSt("ing");
		}
		if(reportVo.getApprover().equals(reportVo.getNextApprover()) && )

		
		reportMapperDao.insertApproval(reportVo);
		return null;
	}*/

	public void insertApproval(ApprovalVO approvalVo) {
		
		//결재자와 다음 결재자 정보가 동일한지 확인, 최종 결재자인지 확인
		if(approvalVo.getEmpId().equals(approvalVo.getNextApprover())) {
			approvalVo.setReportSt("Y");
			
			
			// 최종 결재자가 승인을 했을경우에만 실행
			if("Y".equals(approvalVo.getApprovResult())) {
				ReportVO getReportVO = new ReportVO();
				getReportVO.setReportId(approvalVo.getReportId());
				ReportVO dbReport = null;
				try {
					dbReport = reportMapperDao.selectReport(getReportVO);
					if("T2".equals(dbReport.getTypeId()) ||
					   "T3".equals(dbReport.getTypeId()) ||
					   "T4".equals(dbReport.getTypeId()))	{
							
							SubWorkerVO subWorker = new SubWorkerVO();
							subWorker.setEmpId(dbReport.getEmpId());
							subWorker.setReportId(dbReport.getReportId());
							subWorker.setSubEmpId(dbReport.getSubEmpId());
							subWorker.setSubWorkerStartDt(dbReport.getStartDt());
							subWorker.setSubWorkerEndDt(dbReport.getEndDt());
							subWorker.setSubEmpNm(dbReport.getSubEmpNm());
							
							logger.debug("subworker : {}", subWorker);
							
						if(dbReport.getSubEmpId() != null && !"".equals(dbReport.getSubEmpId())) {
							reportMapperDao.insertSubWorker(subWorker);
						}						
					}
				} catch (Exception e1) { e1.printStackTrace(); }
				
				if(dbReport.getReportOptCode() != null) {
					
					// 휴가 or 반차일 경우
					if(dbReport.getReportOptCode().equals("vacatType") 
							|| dbReport.getReportOptCode().equals("halfVacat")) {
						insertVacateInfo(dbReport);
					}
					
					// 사직서일 경우
					if(dbReport.getReportOptCode().equals("quitComp")) {
						dbReport.getEmpId();
						try {
							// 해당 결재기안을 인사과 부장, 팀장급이 조회할수 있도록 수정 ==> 수신 기능
//							reportMapperDao.EmpQuitComp(dbReport);
						} catch (Exception e) { e.printStackTrace(); }
					}
				}
			}
			
		}else {
			approvalVo.setReportSt("ing");
		}
		
		if("N".equals(approvalVo.getApprovResult())){
			approvalVo.setReportSt("N");
		}
		
		try {
			reportMapperDao.insertApproval(approvalVo);
			reportMapperDao.insertReportSign(approvalVo);
			reportMapperDao.updateReport(approvalVo);	
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return;
	}

	
	
	// 휴가 or 반차일 경우
	private void insertVacateInfo(ReportVO dbReport) {
		if(dbReport.getReportOptCode().equals("vacatType")) {
			goVacate(dbReport);
		}else if(dbReport.getReportOptCode().equals("halfVacat")) {
			goHarfVacate(dbReport);
		}
	}

	
	// 휴가일 경우
	private void goVacate(ReportVO dbReport) {
		
		// 해당 휴가 기안서의 휴가 종류
		VacatTypeVO vcType = null;
		try {
			vcType = reportMapperDao.selectVacateTypeInfo(dbReport);
		} catch (Exception e2) { e2.printStackTrace(); }
		
		
		logger.debug("*************************************************************************");
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("휴가 기안 정보 : {}", dbReport);
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("");
		logger.debug("*************************************************************************");
		
		
		
		
		String vacateTypeCode = dbReport.getReportOptCont().substring(6);
		
		VacationVO vacateVO = new VacationVO();
		vacateVO.setVacateTypeSeq(Integer.parseInt(vacateTypeCode));
		vacateVO.setEmpId(dbReport.getEmpId());
		vacateVO.setVacateTypeName(vcType.getVacateTypeName());
		DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		DateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		
		Date startDt = null;
		Date endDt = null;
		try {
			startDt = inputFormat.parse(dbReport.getStartDt());
			endDt = inputFormat.parse(dbReport.getEndDt());
		} catch (ParseException e1) { e1.printStackTrace(); }
		
		String startDtStr = outputFormat.format(startDt);
		String endDtStr = outputFormat.format(endDt);
		
		vacateVO.setVacateStartDt(startDtStr);
		vacateVO.setVacateEndDt(endDtStr);
		int vacateDayCnt = 0;
		try {
			vacateDayCnt = reportMapperDao.selectVacateDayCnt(vacateVO);
			vacateVO.setVacateDayCnt(vacateDayCnt+"");
		} catch (Exception e1) { e1.printStackTrace(); }
		
		String reportReason = "";
		try {
			String[] reportReasonArrF = dbReport.getContent().split("<br>");
			String[] reportReasonArrS = reportReasonArrF[1].split("</p>");
			String[] reportReasonArrT = reportReasonArrS[0].split("사유 :");
			reportReason = reportReasonArrT[1];
			
		}catch(Exception e) {}
		vacateVO.setVacateReason(reportReason);
		
		try {
			logger.debug("vacateVO : {}", vacateVO);
			reportMapperDao.insertVacationInfo(vacateVO);
		} catch (Exception e) { e.printStackTrace(); }
	}
	
	
	
	
	
	
	
	// 반차일 경우
	private void goHarfVacate(ReportVO dbReport) {
		String vacateTypeName = dbReport.getReportOptCont();
		VacationVO vacateVO = new VacationVO();
		vacateVO.setVacateTypeSeq(2);
		vacateVO.setVacateTypeName("반차["+vacateTypeName+"]");
		vacateVO.setEmpId(dbReport.getEmpId());
		
		DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		DateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		
		Date startDt = null;
		Date endDt = null;
		try {
			startDt = inputFormat.parse(dbReport.getStartDt());
			endDt = inputFormat.parse(dbReport.getEndDt());
		} catch (ParseException e1) { e1.printStackTrace(); }
		
		String startDtStr = outputFormat.format(startDt);
		String endDtStr = outputFormat.format(endDt);
		
		vacateVO.setVacateStartDt(startDtStr);
		vacateVO.setVacateEndDt(endDtStr);
		
		String reportReason = "";
		try {
			String[] reportReasonArrF = dbReport.getContent().split("<br>");
			String[] reportReasonArrS = reportReasonArrF[1].split("</p>");
			String[] reportReasonArrT = reportReasonArrS[0].split("사유 :");
			reportReason = reportReasonArrT[1];
			
		}catch(Exception e) {}
		vacateVO.setVacateReason(reportReason);
		
		try {
			logger.debug("vacateVO : {}", vacateVO);
			reportMapperDao.insertVacationInfo(vacateVO);
		} catch (Exception e) { e.printStackTrace(); }
	}
	
	

	public ReportFileVO selectReportFile(ReportFileVO reportFileVo) {
		ReportFileVO reportFile = null;
		try {
			reportFile = reportMapperDao.selectReportFile(reportFileVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reportFile;
	}
	
	//미확인 결재 건수 카운팅 로직
	
	public int selectApprovalTotCnt(ApprovalVO approvalVo) {
		return reportMapperDao.selectApprovalTotCnt(approvalVo);
	}

	public List<ApprovLineVO> selectApprovLineInfo(ApprovLineVO tempApprovLineVo) {
		List<ApprovLineVO> apprLineListInfo = null;
		try {
			apprLineListInfo = reportMapperDao.selectApprovLineInfo(tempApprovLineVo);
		} catch (Exception e) { e.printStackTrace(); }
		return apprLineListInfo;
	}
	
	//대리결재자인지 확인하고 대리근무에 해당하는 기간이면 권한 레벨을 수정하는 메서드
	public SubWorkerVO subWorkerCheck(ReportVO reportVo) {
		/* 대리결재자 인지 확인하고 대리결재자이면 해당 기간에 원근무자의 권한으로 권한을 업데이트 시킨다. */
		SubWorkerVO subWorker = new SubWorkerVO();
		subWorker.setSubEmpId(reportVo.getEmpId());
		EmpVO empVo = new EmpVO();
		SubWorkerVO subWorkerResult = null;
		try {
			subWorkerResult = reportMapperDao.selectSubWorker(subWorker);
			if(subWorkerResult != null) {
				empVo.setEmpId(subWorkerResult.getSubEmpId());
				//권한레벨을 원 근무자의 권한레벨로 수정
				if("update".equals(subWorkerResult.getStatus())) {
					empVo.setAuthLv(subWorkerResult.getEmpAuthLv());
				}
				//권한레벨을 원 상태로 복원 및 대리근무 종료 상태로 바꿈
				if("back".equals(subWorkerResult.getStatus())) {
					empVo.setAuthLv(subWorkerResult.getSubEmpAuthLv());
					subWorkerResult.setSubEmpStatus("Y");
					reportMapperDao.updateSubWorker(subWorkerResult);
					subWorkerResult = null;
				}
				//아직 대리근무에 들어가지 않은 상태
				if("yet".equals(subWorkerResult.getStatus())) {
					subWorkerResult = null;
				}
				if(empVo.getAuthLv() != null) {
					empMapperDao.updateEmp(empVo);					
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return subWorkerResult;
	}
	
}
