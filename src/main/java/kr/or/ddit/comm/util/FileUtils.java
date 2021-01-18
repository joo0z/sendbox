package kr.or.ddit.comm.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.business.busiboard.vo.BusiFileVO;
import kr.or.ddit.comm.vo.FileVO;

public class FileUtils {
	
	
	public static List<FileVO> createFileList(List<MultipartFile> files){
		List<FileVO> fileList = new ArrayList<FileVO>();
		String saveDirString = "D:\\uploads\\";
		File saveDir = new File(saveDirString);
		if(!saveDir.exists()) {
			saveDir.mkdirs();			
		}
		FileVO fileVo = null;
		if(files != null && !files.isEmpty()) {
			for(MultipartFile file : files) {
				if(file.getSize() > 0 && !"".equals(file.getOriginalFilename())) {
					String filePath = saveDirString + UUID.randomUUID().toString() + getExtension(file.getOriginalFilename());
					try {
						file.transferTo(new File(filePath));
						fileVo = new FileVO(0, 0, filePath, file.getOriginalFilename(), "Y");
						fileList.add(fileVo);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
				}
			}			
		}
		
		return fileList;
		
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
