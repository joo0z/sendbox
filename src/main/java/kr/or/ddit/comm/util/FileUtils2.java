package kr.or.ddit.comm.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.business.busiboard.vo.BusiFileVO;
import kr.or.ddit.notice.vo.NoticeFileVO;

public class FileUtils2 {
	
	
	public static List<NoticeFileVO> createFileList(MultipartFile[] files){
		List<NoticeFileVO> noticeFileList= new ArrayList<NoticeFileVO>();
		String saveDirString = "D:\\uploads";
		File saveDir = new File(saveDirString);
		saveDir.mkdirs();
		NoticeFileVO noticeFile = null;
		for(MultipartFile file : files) {
			if(file.getSize() > 0 && !"".equals(file.getOriginalFilename())) {
				String filePath = saveDirString + UUID.randomUUID().toString() + getExtension(file.getOriginalFilename());
				try {
					file.transferTo(saveDir);
					noticeFile = new NoticeFileVO(0, filePath, file.getOriginalFilename(), 0);
					noticeFileList.add(noticeFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return noticeFileList;
		
	}
	
	
	public static String getExtension(String filename) {
		String extension = "";
		String[] fileStrArr = null;
		
		if(filename != null || filename.indexOf(".") != -1) {
			extension = filename.substring(filename.lastIndexOf("."));
		}
		
		return extension;
	}
}
