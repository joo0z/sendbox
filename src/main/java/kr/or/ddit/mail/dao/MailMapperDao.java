package kr.or.ddit.mail.dao;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.mail.vo.EmpVO;
import kr.or.ddit.mail.vo.MailBackVO;
import kr.or.ddit.mail.vo.MailFileVO;
import kr.or.ddit.mail.vo.MailVO;
import kr.or.ddit.salary.vo.SalaryVO;

@Mapper("mailMapperDao")
public interface MailMapperDao {
	
	int mailSend(MailVO mailVO) throws Exception;
	
	int mailFileUpload(MailFileVO mailFileVO) throws Exception;
	
	List<MailVO> mailList(MailVO mailVO) throws Exception;
	
	MailVO mailDetail(MailVO mailVO) throws Exception;
	
	List<MailFileVO> mailFileList(MailFileVO mailFileVO) throws Exception;
	
	MailFileVO mailFileDetail(MailFileVO mailFileVO) throws Exception;
	
	int mailUpdate(MailVO mailVO) throws Exception;
	
	int mailDelete(MailVO mailVO) throws Exception;

	int selectMailTotCnt(MailVO mailVO) throws Exception;
	
	List<EmpVO> autocomplete(Map<String, String> map) throws Exception;
	
	MailBackVO mailBack(String mailSeq) throws Exception;
}
