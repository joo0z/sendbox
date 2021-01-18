package kr.or.ddit.report.vo;

import kr.or.ddit.comm.vo.FileVO;

public class ReportFileVO extends FileVO {
	
	private String reportId; 			//기안번호
	
	public ReportFileVO() {
	}
	
	public ReportFileVO(FileVO fileVo, String reportId) {
		super();
		this.setFilepath(fileVo.getFilepath());
		this.setAttachfileSt(fileVo.getAttachfileSt());
		this.setRealfilename(fileVo.getRealfilename());
		this.setPostSeq(fileVo.getPostSeq());
		this.reportId = reportId;
	}

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	
}
