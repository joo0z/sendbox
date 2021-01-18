package kr.or.ddit.mail.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.mail.dao.MailMapperDao;
import kr.or.ddit.mail.vo.EmpVO;
import kr.or.ddit.mail.vo.MailBackVO;
import kr.or.ddit.mail.vo.MailFileVO;
import kr.or.ddit.mail.vo.MailVO;

@Service("mailService")
public class MailService{
	
	@Resource(name="mailMapperDao")
	private MailMapperDao mailMapperDao;
	
	public String mailSend(MailVO mailVO) throws Exception {
		mailMapperDao.mailSend(mailVO);
		return mailVO.getMailSeq();
	}
	
	
	public int mailFileUpload(MailFileVO mailFileVO) throws Exception {
		return mailMapperDao.mailFileUpload(mailFileVO);
	}
	
	public List<MailVO> mailList(MailVO mailVO) throws Exception{
		return mailMapperDao.mailList(mailVO);
	}
	
	public MailVO mailDetail(MailVO mailVO) throws Exception{
		return mailMapperDao.mailDetail(mailVO);
	}
	
	public List<MailFileVO> mailFileList(MailFileVO mailFileVO) throws Exception{
		return mailMapperDao.mailFileList(mailFileVO);
	}
	
	public MailFileVO mailFileDetail(MailFileVO mailFileVO) throws Exception{
		return mailMapperDao.mailFileDetail(mailFileVO);
	}
	
	public int mailUpdate(MailVO mailVO) throws Exception {
		return mailMapperDao.mailUpdate(mailVO);
	}
	
	public int mailDelete(MailVO mailVO) throws Exception {
		return mailMapperDao.mailDelete(mailVO);
	}


	public int selectMailTotCnt(MailVO mailVO) throws Exception {
		return mailMapperDao.selectMailTotCnt(mailVO);
	}
	
	public List<EmpVO> autocomplete(Map<String, String> map) throws Exception {
		return mailMapperDao.autocomplete(map);
	}
	
	public MailBackVO mailBack(String mailSeq) throws Exception{
		return mailMapperDao.mailBack(mailSeq);
	}
	
}
