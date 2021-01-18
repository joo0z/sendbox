package kr.or.ddit.notice.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.notice.dao.NoticeMapperDao;
import kr.or.ddit.notice.vo.NoticeFileVO;
import kr.or.ddit.notice.vo.NoticeVO;

@Service("noticeService")
public class NoticeService{
	
	@Resource(name="noticeMapperDao")
	private NoticeMapperDao noticeMapperDao;
	
	// 조회
	public List<NoticeVO> retrieveNoticeList(NoticeVO noticeVO) throws Exception {
		return noticeMapperDao.retrieveNoticeList(noticeVO);
	}
	
	public int noticeCount(NoticeVO noticeVO) throws Exception{
		return noticeMapperDao.noticeCount(noticeVO);
	}
	
	public NoticeVO getNotice(int noticeSeq) throws Exception{
		return noticeMapperDao.getNotice(noticeSeq);
	}
	public List<NoticeVO> mainNoticeList(NoticeVO noticeVO) throws Exception{
		return noticeMapperDao.mainNoticeList(noticeVO);
	}
	
	// 첨부파일 조회
	public List<NoticeFileVO> noticeFileList(int noticeSeq) throws Exception{
		return noticeMapperDao.noticeFileList(noticeSeq);
	}
	public NoticeFileVO getNoticeFile(int attachfileSeq) throws Exception{
		return noticeMapperDao.getNoticeFile(attachfileSeq);
	}
	
	
	// 등록
	public int noticeInsert(NoticeVO noticeVO) throws Exception{
		return noticeMapperDao.noticeInsert(noticeVO);
	}
	public int noticeFileInsert(NoticeFileVO noticeFileVO) throws Exception{
		return noticeMapperDao.noticeFileInsert(noticeFileVO);
	}
	
	// 수정
	public int noticeUpdate(NoticeVO noticeVO) throws Exception{
		return noticeMapperDao.noticeUpdate(noticeVO);
	}
	
	// 첨부파일 삭제
	public int noticeFileDelete(NoticeFileVO noticeFileVO) throws Exception{
		return noticeMapperDao.noticeFileDelete(noticeFileVO);
	}
	
	public int deleteNoticeFile(NoticeFileVO noticeFileVO) throws Exception{
		return noticeMapperDao.deleteNoticeFile(noticeFileVO);
	}
}
