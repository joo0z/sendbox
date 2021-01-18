package kr.or.ddit.test;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.xml.bind.annotation.XmlRootElement;

import org.hibernate.validator.constraints.NotEmpty;

@XmlRootElement(name = "memberVo")
public class MemberVO {
	private String userId;
	
	//null이면 안되고, empty면 안됨
	@NotEmpty
	private String userNm;
	
	private String pass;
	private String alias;
	private Date reg_dt;
	private String addr1;
	private String addr2;
	private String zipcode;
	private String realFileName;
	private String fileName;
	
	public MemberVO() {
	
	}
	

	public MemberVO(String userId, String userNm, String pass, String alias, String addr1, String addr2, String zipcode,
			String realFileName, String fileName) {
		this.userId = userId;
		this.userNm = userNm;
		this.pass = pass;
		this.alias = alias;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.zipcode = zipcode;
		this.realFileName = realFileName;
		this.fileName = fileName;
	}

	public MemberVO(String userid, String usernm) {
		this.userId = userid;
		this.userNm = usernm;
	}
	
	
	
	
	
	
	
	

	public String getRealFileName() {
		return realFileName;
	}

	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getAlias() {
		return alias;
	}

	public void setAlias(String alias) {
		this.alias = alias;
	}

	public Date getReg_dt() {
		return reg_dt;
	}
	
	public String getFmt_reg_dt() {
		
		return reg_dt == null ? "" : new SimpleDateFormat("yyyy-MM-dd").format(reg_dt);
		
//		if(reg_dt == null) {
//			return "";
//		}
//		else {
//			return new SimpleDateFormat("yyyy-MM-dd").format(reg_dt);			
//		}
		
	}

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String password) {
		this.pass = password;
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((addr1 == null) ? 0 : addr1.hashCode());
		result = prime * result + ((addr2 == null) ? 0 : addr2.hashCode());
		result = prime * result + ((alias == null) ? 0 : alias.hashCode());
		result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result + ((pass == null) ? 0 : pass.hashCode());
		result = prime * result + ((realFileName == null) ? 0 : realFileName.hashCode());
		result = prime * result + ((reg_dt == null) ? 0 : reg_dt.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userNm == null) ? 0 : userNm.hashCode());
		result = prime * result + ((zipcode == null) ? 0 : zipcode.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVO other = (MemberVO) obj;
		if (addr1 == null) {
			if (other.addr1 != null)
				return false;
		} else if (!addr1.equals(other.addr1))
			return false;
		if (addr2 == null) {
			if (other.addr2 != null)
				return false;
		} else if (!addr2.equals(other.addr2))
			return false;
		if (alias == null) {
			if (other.alias != null)
				return false;
		} else if (!alias.equals(other.alias))
			return false;
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (pass == null) {
			if (other.pass != null)
				return false;
		} else if (!pass.equals(other.pass))
			return false;
		if (realFileName == null) {
			if (other.realFileName != null)
				return false;
		} else if (!realFileName.equals(other.realFileName))
			return false;
		if (reg_dt == null) {
			if (other.reg_dt != null)
				return false;
		} else if (!reg_dt.equals(other.reg_dt))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userNm == null) {
			if (other.userNm != null)
				return false;
		} else if (!userNm.equals(other.userNm))
			return false;
		if (zipcode == null) {
			if (other.zipcode != null)
				return false;
		} else if (!zipcode.equals(other.zipcode))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userNm=" + userNm + ", pass=" + pass + ", alias=" + alias + ", reg_dt="
				+ reg_dt + ", addr1=" + addr1 + ", addr2=" + addr2 + ", zipcode=" + zipcode + ", realFileName="
				+ realFileName + ", fileName=" + fileName + "]";
	}

	
	
	
}
