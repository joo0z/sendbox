package kr.or.ddit.notice.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.notice.vo.NoticeFileVO;
import kr.or.ddit.notice.vo.NoticeVO;

@Mapper("noticeMapperDao")
public interface NoticeMapperDao {
	
	/**
	 * 공지글 검색을 위한 메서드
	 * @param noticeVO
	 * @return 공지List
	 * @throws Exception
	 */
	List<NoticeVO> retrieveNoticeList(NoticeVO noticeVO) throws Exception;
	
	/**
	 * 삭제가 안된 전체 공지글 개수
	 * @param noticeVO
	 * @return int
	 * @throws Exception
	 */
	int noticeCount(NoticeVO noticeVO) throws Exception;
	
	/**
	 * 공지글 번호로 하나의 공지를 검색하는 메서드
	 * @param noticeSeq
	 * @return NoticeVO
	 * @throws Exception
	 */
	NoticeVO getNotice(int noticeSeq) throws Exception;
	
	/** 
	 * 공지글의 첨부파일을 가져오는 메서드
	 * @param noticeSeq
	 * @return 공지파일List
	 * @throws Exception
	 */
	List<NoticeFileVO> noticeFileList(int noticeSeq) throws Exception;
	
	/** 
	 * 첨부파일 하나를 검색하는 메서드
	 * @param attachfileSeq
	 * @return NoticeFileVO
	 * @throws Exception
	 */
	NoticeFileVO getNoticeFile(int attachfileSeq)throws Exception;

	/**
	 * 공지글 등록을 위한 메서드
	 * @param noticeVO
	 * @return 성공 : 1, 실패 : 0
	 * @throws Exception
	 */
	int noticeInsert(NoticeVO noticeVO) throws Exception;
	
	/**
	 * 공지글 파일등록을 위한 메서드
	 * @param NoticeFileVO
	 * @return 성공 : 1, 실패 : 0
	 * @throws Exception
	 */
	int noticeFileInsert(NoticeFileVO noticeFileVO) throws Exception;
	
	/**
	 * 하나의 공지글을 수정하기 위한 메서드
	 * @param noticeVO
	 * @return 성공 : 1, 실패 : 0
	 * @throws Exception
	 */
	int noticeUpdate(NoticeVO noticeVO) throws Exception;
	
	/**
	 * 메인에 보여줄 공지 List
	 * @param noticeVO
	 * @return List
	 * @throws Exception
	 */
	List<NoticeVO> mainNoticeList(NoticeVO noticeVO) throws Exception;
	
	/**
	 * 첨부파일을 삭제하는 메서드
	 * @param noticeFileVO
	 * @return 성공 : 1, 실패 : 0
	 * @throws Exception
	 */
	int noticeFileDelete(NoticeFileVO noticeFileVO) throws Exception;	
	
	int deleteNoticeFile(NoticeFileVO noticeFileVO) throws Exception;
}
