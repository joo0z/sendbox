package kr.or.ddit.business.busiboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.SelectKey;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.business.busiboard.vo.BusiBoardVO;
import kr.or.ddit.business.busiboard.vo.BusiFileVO;
import kr.or.ddit.business.busiboard.vo.BusiPostVO;
import kr.or.ddit.business.busiboard.vo.BusiRepleVO;

@Mapper("busiBoardMapperDao")
public interface BusiBoardMapperDao {
	
	
	/**
	 * 사원의 부서를 입력받아  업무게시판 목록을 가져오는 메서드
	 * @param busiBoardVo 사원의 부서번호를 담고 있는 VO객체 
	 * @return 게시판 리스트
	 * @throws Exception
	 */
	List<BusiBoardVO> selectBusiBoardList(BusiBoardVO busiBoardVo) throws Exception;
	
	/**
	 * 게시판번호를 입력받아 해당 게시판의 게시글 목록을 가져오는 메서드
	 * @param busiBoardVo	게시판번호를 담고 있는 VO객체
	 * @return	게시글 리스트
	 * @throws Exception
	 */
	List<BusiPostVO> selectBusiPostList(BusiBoardVO busiBoardVo) throws Exception;
	
	/**
	 * 게시글의 아이디를 입력받아 게시글 정보를 가져오는 메서드
	 * @param busiPostVo	게시글 번호를 담고있는 VO객체
	 * @return				게시글 정보를 담고 있는 Vo객체
	 * @throws Exception
	 */
	BusiPostVO selectBusiPost(BusiPostVO busiPostVo) throws Exception;
	
	
	/**
	 * 게시글의 아이디를 입력받아 첨부파일 리스트를 가져오는 메서드
	 * @param busiPostVo		게시글 아이디를 담고있는 VO객체
	 * @return					게시글의 첨부된 파일 리스트
	 * @throws Exception
	 */
	List<BusiFileVO> selectBusiFileList(BusiPostVO busiPostVo) throws Exception;
	
	/**
	 * 게시글의 아이디를 입력받아 댓글 리스트를 가져오는 메서드
	 * @param busiPostVO		게시글 아이디를 담고있는 VO객체
	 * @return					게시글의 댓글 리스트
	 * @throws Exception
	 */
	List<BusiRepleVO> selectBusiRepleList(BusiPostVO busiPostVO) throws Exception;
	
	
	/**
	 * 게시판의 아이디를 입력받아 게시판 정보를 가져오는 메서드
	 * @param busiBoardVo		게시판 아이디를 담고있는 VO객체
	 * @return					입력값에 해당하는 게시판
	 * @throws Exception
	 */
	BusiBoardVO selectBusiBoard(BusiBoardVO busiBoardVo) throws Exception;
	
	/**
	 * 사원이 작성한 게시글을 db에 저장하는 메서드. 글의 seq 값을 반환.
	 * @param busiPostVo		게시글 정보를 담고있는 VO객체
	 * @return					게시글의 seq 값
	 * @throws Exception
	 */
	int insertBusiPost(BusiPostVO busiPostVo) throws Exception;
	
	/**
	 * 사원이 작성한 게시글의 첨부파일 목록을 db에 저장하는 메서드. 저장된 파일의 갯수를 반환
	 * @param busiFileList		게시글의 첨부파일 목록을 담고있는 리스트
	 * @return					저장 성공한 파일의 갯수
	 * @throws Exception
	 */
	int insertBusiFileList(List<BusiFileVO> busiFileList) throws Exception;
	
	/**
	 * 파일의 아이디를 입력받아 해당 파일을 가져오는 메서드
	 * @param busiFileVo		파일의 아이디를 담고 있는  VO 객체
	 * @return					파일
	 * @throws Exception
	 */
	BusiFileVO selectBusiFile(BusiFileVO busiFileVo) throws Exception;
	
	
	/**
	 * 작성한 댓글을 db에 저장하는 메서드
	 * @param busiRepleVo		댓글 정보를 담고 있는 VO객체
	 * @return					추가된 댓글 수
	 * @throws Exception
	 */
	int insertBusiReple(BusiRepleVO busiRepleVo)throws Exception;
	
	/**
	 * 댓글을 수정하는 메서드
	 * @param busiRepleVo		댓글의 아이디를 담고 있는 VO객체
	 * @return					수정된 댓글 수 
	 * @throws Exception
	 */
	int updateBusiReple(BusiRepleVO busiRepleVo) throws Exception;

	/**
	 * 게시글을 수정하는 메서드, 삭제도 적용됨
	 * @param busiPost		게시글 수정내용을 담고 있는 VO
	 * @return				
	 */
	int updateBusiPost(BusiPostVO busiPost);
	
	/**
	 * 삭제할 첨부파일 목록을 받아와 삭제하는 메서드, 실제적으로는 파일 상태 코드를 변경
	 * @param delFileList	삭제할 첨부파일 리스트
	 * @return
	 */
	int deleteFileList(List<BusiFileVO> delFileList);
	
	
	
	/**
	 * 게시판의 게시글의 총 갯수를 가져오는 메서드
	 * @param busiBoardVo		게시판의 아이디를 담고있는 busiBoardVo
	 * @return					게시글의 갯수
	 */
	int selectBusiPostTotCnt(BusiBoardVO busiBoardVo);

	/**
	 * 게시글의 첨부파일 수를 가져오는 메서드
	 * @param busiPostVo		게시글의 정보를 담고있는 busiPostVo
	 * @return					첨부파일 갯수
	 */
	int selectFileTotCnt(BusiPostVO busiPostVo);
	
	/**
	 * 게시글의 댓글 수를 가져오는 메서드
	 * @param busiPostVo		게시글의 정보를 담고있는 busiPostVo
	 * @return					댓글 수
	 */
	int selectRepleTotCnt(BusiPostVO busiPostVo);
	
	
	
	
}
