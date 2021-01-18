package kr.or.ddit.chat.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import kr.or.ddit.comm.vo.BaseVO;

public class ChatInfoVO extends BaseVO{

	private int chatSeq;
	private String empId;
	private String empNm;
	private String chatrmId;
	private String chatCont;
	private Date chatDt;
	private String chatSt;
	
	
	
	public void setEmpId(String empId) {
		this.empId = empId; 
	}
	public String getEmpId() {
		return empId; 
	}
	
	
	
	public void setChatrmId(String chatrmId) {
		this.chatrmId = chatrmId; 
	}
	public String getChatrmId() {
		return chatrmId; 
	}
	
	
	
	public void setChatCont(String chatCont) {
		this.chatCont = chatCont; 
	}
	public String getChatCont() {
		return chatCont; 
	}
	
	
	
	public void setChatDt(Date chatDt) {
		this.chatDt = chatDt; 
	}
	public String getChatDt() {
		if(chatDt != null) {
			return new SimpleDateFormat("yyyy-MM-dd HH:mm").format(chatDt);
		}else {
			return "";
		}
	}
	
	
	
	
	public void setChatSeq(int chatSeq) {
		this.chatSeq = chatSeq; 
	}
	public int getChatSeq() {
		return chatSeq; 
	}
	
	
	
	
	
	public String getEmpNm() {
		return empNm;
	}
	public void setEmpNm(String empNm) {
		this.empNm = empNm;
	}
	
	
	
	
	
	
	
	public String getChatSt() {
		return chatSt;
	}
	public void setChatSt(String chatSt) {
		this.chatSt = chatSt;
	}
	
	
	
	
	

}
