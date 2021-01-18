package kr.or.ddit.vote.vo;

public class VoteItemVO {

	private int votePostSeq;
	private int voteItemSeq;
	private int voteItemCode;
	private String voteItemNm;
	private String voteItemSt;
	
	public void setVoteItemCode(int voteItemCode) {
		this.voteItemCode = voteItemCode; 
	}
	public int getVoteItemCode() {
		return voteItemCode; 
	}
	public void setVoteItemNm(String voteItemNm) {
		this.voteItemNm = voteItemNm; 
	}
	public String getVoteItemNm() {
		return voteItemNm; 
	}
	public void setVotePostSeq(int votePostSeq) {
		this.votePostSeq = votePostSeq; 
	}
	public int getVotePostSeq() {
		return votePostSeq; 
	}
	public String getVoteItemSt() {
		return voteItemSt;
	}
	public void setVoteItemSt(String voteItemSt) {
		this.voteItemSt = voteItemSt;
	}
	public int getVoteItemSeq() {
		return voteItemSeq;
	}
	public void setVoteItemSeq(int voteItemSeq) {
		this.voteItemSeq = voteItemSeq;
	}

}
