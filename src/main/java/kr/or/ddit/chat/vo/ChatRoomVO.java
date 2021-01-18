package kr.or.ddit.chat.vo;

import kr.or.ddit.comm.vo.BaseVO;

public class ChatRoomVO extends BaseVO{

	private String chatrmId;
	private String chatrmNm;
	private String chatrmPass;
	private String empId;
	private int headcount;
	
	
	
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	public void setChatrmPass(String chatrmPass) {
		this.chatrmPass = chatrmPass; 
	}
	public String getChatrmPass() {
		return chatrmPass; 
	}
	public void setChatrmId(String chatrmId) {
		this.chatrmId = chatrmId; 
	}
	public String getChatrmId() {
		return chatrmId; 
	}
	public void setChatrmNm(String chatrmNm) {
		this.chatrmNm = chatrmNm; 
	}
	public String getChatrmNm() {
		return chatrmNm; 
	}
	public void setHeadcount(int headcount) {
		this.headcount = headcount; 
	}
	public int getHeadcount() {
		return headcount; 
	}

}
