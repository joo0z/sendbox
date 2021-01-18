package kr.or.ddit.freeboard.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.community.controller.FileUploadUtil;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.freeboard.dao.FreeBoardMapperDao;
import kr.or.ddit.freeboard.vo.FreeBoardVO;
import kr.or.ddit.freeboard.vo.FreeFileVO;
import kr.or.ddit.freeboard.vo.FreeRepleVO;

@Service("freeBoardService")
public class FreeBoardService {

	@Resource(name = "freeBoardMapperDao")
	private FreeBoardMapperDao freeBoardMapperDao;
	
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardService.class);


	/**
	 * board 정보들을 반환하는 메서드
	 * @param FreeBoardVO
	 * @return
	 * @throws Exception
	 */
	public List<FreeBoardVO> selectListFreePost(FreeBoardVO freeBoardVO) throws Exception{
		return freeBoardMapperDao.selectListFreePost(freeBoardVO);
	}
	
	
	
	/**
	 * 선택한 게시글의 정보를 반환하는 메서드
	 * @param freeBoardVO
	 * @return
	 */
	public Map<String, Object> selectFreeBoard(FreeBoardVO freeBoardVO) {
		
		
		Map<String, Object> freeInfoMap = null;
		try {
			
			freeInfoMap = new HashMap<String, Object>();
			
			
			// 게시글의 정보
			FreeBoardVO dbFreeBoard = freeBoardMapperDao.selectFreeBoard(freeBoardVO);
			freeInfoMap.put("dbFreeBoard", dbFreeBoard);
			
			
			if(dbFreeBoard != null) {
				
				// boardFileVO List 가져오기
				FreeFileVO freeBF = new FreeFileVO();
				freeBF.setPostSeq(freeBoardVO.getPostSeq());
				
				List<FreeFileVO> freeBoardFileList = freeBoardMapperDao.selectListFreeBoardFile(freeBF);
				freeInfoMap.put("freeBoardFileList", freeBoardFileList);
				
				
				// repleVO List 가져오기
				FreeRepleVO freeBoardRepleVO = new FreeRepleVO();
				freeBoardRepleVO.setPostSeq(freeBoardVO.getPostSeq());
				
				List<FreeRepleVO> freeBoardRepleList = freeBoardMapperDao.selectListReple(freeBoardRepleVO);
				freeInfoMap.put("freeBoardRepleList", freeBoardRepleList);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return freeInfoMap;
	}
	
	
	
	
	/**
	 * 커뮤니티에 게시글을 등록 후 결과를 반환하는 메서드
	 * @param fileList
	 * @param freeBoardVO
	 * @param session
	 * @return
	 * @throws Exception 
	 */
	public int insertFreeBoard(List<MultipartFile> fileList, FreeBoardVO freeBoardVO, EmpVO dbEmp) throws Exception {
		
		
		int insertRes = 0;
		
		// 게시글 등록
		freeBoardVO.setEmpId(dbEmp.getEmpId());
		
		System.out.println("============================================================");
		System.out.println("");
		System.out.println("");
		System.out.println("freeBoardVO : "+ freeBoardVO);
		System.out.println("");
		System.out.println("");
		System.out.println("============================================================");
		
		int freeBoardInsert = freeBoardMapperDao.insertFreeBoard(freeBoardVO);
		FreeFileVO freeBoardFileVO = null;
		
		
		
		int boardFileAllCnt = 0;	// 전체 파일의 수
		int boardInsertFileCnt = 0; // 저장한 파일의 수
		
		
		
		// 게시글 등록 성공시 실행
		if(freeBoardInsert > 0) {
			
			// file 등록
			if(fileList.size() > 0 && fileList != null) {
				for(MultipartFile file : fileList) {
					if(!file.getOriginalFilename().equals("") && file.getSize() > 0) {
						
						boardFileAllCnt++;
						
						// 파일의 진짜 이름(이름 + 확장자)
						String fileRealName = file.getOriginalFilename();
						
						// uuid
						String tempName = UUID.randomUUID().toString();
						
						// file 확장자
						String fileEx = FileUploadUtil.getExtension(fileRealName);
						
						// db에 저장할 파일의 경로와 파일의 이름 + 확장자
						String filePath = "C:\\file\\" + tempName + "." + fileEx;
						
						
						File insertFile = new File(filePath);
						
						// 파일 업로드
						file.transferTo(insertFile);
						
						
						// 파일경로를 db에 저장
						freeBoardFileVO = new FreeFileVO();
						freeBoardFileVO.setFilepath(filePath);
						freeBoardFileVO.setRealfilename(fileRealName);
						
						int insertFileCnt = freeBoardMapperDao.insertFreeBoardFile(freeBoardFileVO);
						if(insertFileCnt == 1) {
							boardInsertFileCnt++;
						}
					}
				}
			}
		}
		
		
		if(freeBoardInsert == 1 && boardFileAllCnt == boardInsertFileCnt) {
			insertRes = 1;
		}
		return insertRes;
	}
	
	
	
	
	/**
	 * board의 현재 시퀀스 정보를 반환하는 메서드
	 * @return
	 * @throws Exception
	 */
	public int selectCurrval() throws Exception {
		return freeBoardMapperDao.selectCurrval();
	}
	
	
	
	
	
	/**
	 * 게시글 정보를 수정한 뒤 결과를 반환하는 메서드
	 * @param session
	 * @param freeBoardVO
	 * @param fileList
	 * @param delFileList
	 * @return
	 * @throws Exception
	 */
	public int updatePost(HttpSession session, FreeBoardVO freeBoardVO, List<MultipartFile> fileList, List<Integer> delFileList) throws Exception {
		
		int boardFileAllCnt = 0;			// 추가한 파일의 전체 파일의 수
		int boardInsertFileCnt = 0; 		// 추가한 파일의 저장한 파일의 수
		
		int delFreeBoardFileAllCnt = 0;		// 삭제파일의 전체 파일의 수
		int delFreeBoardFileCnt = 0;		// 삭제파일의 삭제한 파일의 수
		
		
		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		
		freeBoardVO.setEmpId(dbEmp.getEmpId());
		
		int updateFreeBoard = freeBoardMapperDao.updateFreeBoard(freeBoardVO);
		
		// update 성공시 실행
		if(updateFreeBoard == 1) {
			
			// 삭제한 파일 리스트
			
			if(delFileList != null && delFileList.size() > 0) {
				
				for(Integer delFileId : delFileList) {
					
					delFreeBoardFileAllCnt++;
					
					FreeFileVO freeBoardFileVO = new FreeFileVO();
					freeBoardFileVO.setAttachfileSeq(delFileId);
					
					int updateBoardFile = freeBoardMapperDao.updateFreeBoardFile(freeBoardFileVO);
					if(updateBoardFile == 1) {
						delFreeBoardFileCnt++;
					}
				}
			}
			
			
			
			
			
			// file 등록
			if(fileList.size() > 0 && fileList != null) {
				for(MultipartFile file : fileList) {
					if(!file.getOriginalFilename().equals("") && file.getSize() > 0) {
						
						
						logger.debug("file : {}", file);
						
						
						boardFileAllCnt++;
						
						// 파일의 진짜 이름(이름 + 확장자)
						String fileRealName = file.getOriginalFilename();
						
						// uuid
						String tempName = UUID.randomUUID().toString();
						
						// file 확장자
						String fileEx = FileUploadUtil.getExtension(fileRealName);
						
						// db에 저장할 파일의 경로와 파일의 이름 + 확장자
						String filePath = "C:\\file\\" + tempName + "." + fileEx;
						
						
						File insertFile = new File(filePath);
						
						// 파일 업로드
						file.transferTo(insertFile);
						
						// 파일경로를 db에 저장
						FreeFileVO freeBoardFileVO = new FreeFileVO();
						freeBoardFileVO.setFilepath(filePath);
						freeBoardFileVO.setRealfilename(fileRealName);
						freeBoardFileVO.setPostSeq(freeBoardVO.getPostSeq());
						
						int insertFileCnt = freeBoardMapperDao.insertFreeBoardFile(freeBoardFileVO);
						if(insertFileCnt == 1) {
							boardInsertFileCnt++;
						}
					}
				}
			}
		}
		
		if((boardFileAllCnt == boardInsertFileCnt) && (delFreeBoardFileAllCnt == delFreeBoardFileCnt) && (updateFreeBoard == 1)) {
			return 1;
		}else {
			return 0;
		}
	}
	
	
	
	
	
	/**
	 * 게시글의 상태코드를 삭제상태코드로 변경한 뒤 결과를 반환하는 메서드
	 * @param session
	 * @param freeBoardVO
	 * @return
	 * @throws Exception 
	 */
	public int delUpFreeBoard(HttpSession session, FreeBoardVO freeBoardVO) throws Exception {
		
		
		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		
		logger.debug("==============================================");
		logger.debug("==============================================");
		logger.debug("");
		logger.debug("");
		logger.debug("emp info : {}", dbEmp);
		logger.debug("");
		logger.debug("");
		logger.debug("==============================================");
		
		freeBoardVO.setEmpId(dbEmp.getEmpId());
		freeBoardVO.setTitle("삭제된 게시글 입니다.");
		
		
		int deleteFreeBoard = freeBoardMapperDao.deleteFreeBoard(freeBoardVO);
		
		return deleteFreeBoard;
	}
	
	
	
	
	
	/**
	 * 게시글의 댓글을 DB에 저장한 뒤 결과를 반환하는 메서드
	 * @param freeRepleVO
	 * @return
	 * @throws Exception
	 */
	public int insertFreeReple(HttpSession session, FreeRepleVO freeRepleVO) throws Exception {
		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		
		int insertRes = 0;
		
		freeRepleVO.setEmpId(dbEmp.getEmpId());
		
		int repleInsert = freeBoardMapperDao.insertFreeReple(freeRepleVO);
		
		if (repleInsert == 1) {
			insertRes = 1;
		}
		return insertRes;
	}
	
	
	
	
	public int updateRepleSt(HttpSession session, FreeRepleVO freeRepleVO) throws Exception {
		EmpVO dbEmp = (EmpVO) session.getAttribute("EMP");
		
		freeRepleVO.setEmpId(dbEmp.getEmpId());
		freeRepleVO.setRepleCont("삭제된 댓글 입니다.");
		
		int deleteFreeReple = freeBoardMapperDao.updateFreeRepleSt(freeRepleVO);
		
		return deleteFreeReple;
	}
	
	
	
	public List<FreeFileVO> selectFreeBoardFile(FreeFileVO freeBoardFile) throws Exception {
		return freeBoardMapperDao.selectListFreeBoardFile(freeBoardFile);
	}
	
	public int selectFreeBoardPageAllCount(FreeBoardVO fbVO) throws Exception {
		return freeBoardMapperDao.selectFreeBoardPageAllCount(fbVO);
	}


}
