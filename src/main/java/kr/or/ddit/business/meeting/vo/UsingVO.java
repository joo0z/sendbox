package kr.or.ddit.business.meeting.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class UsingVO extends BaseVO{
	
	private String meetroomId;
	private String meetroomNm;
	private String using;
	public String getMeetroomId() {
		return meetroomId;
	}
	public void setMeetroomId(String meetroomId) {
		this.meetroomId = meetroomId;
	}
	public String getMeetroomNm() {
		return meetroomNm;
	}
	public void setMeetroomNm(String meetroomNm) {
		this.meetroomNm = meetroomNm;
	}
	public String getUsing() {
		return using;
	}
	public void setUsing(String using) {
		this.using = using;
	}
}
