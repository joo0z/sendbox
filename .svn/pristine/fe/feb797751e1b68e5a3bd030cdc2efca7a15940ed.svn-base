package kr.or.ddit.community.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileUploadUtil {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil.class);

	
	//form-data; name="img"; filename="moon.png"
	// ==> moon.png
	
	
	// 해더정보를 저장할수 있는 Map객체를 생성한다.
	// 파일의 해더정보를 받아서 해당 정보를 split()한다.
	// split()의 기준은 "; "으로 한다.
	// 첫번째 split() 메서드로 분리된 문자열을 String배열 변수에 저장한다.
	// 각각의 배열변수를 다시 split()한다.
	// split()의 기준은 "="으로 한다.
	// 분리된 문자열의 0번째와 1번째를 미리 생성한 Map객체에 put한다.
	// 파일의 이름인 filename의 key 값을 갖는 Map객체의 value값을 return한다.
	
	
	
	public static String getFilename(String contentDisposition) {

		Map<String, String> parseMap = new HashMap<String, String>();
		String[] parsingString = contentDisposition.split("; ");
		
		for(String parsed : parsingString) {
			if(!parsed.equals("form-data")) {
				String[] temp = parsed.split("=");
//				parseMap.put(temp[0], temp[1].split("\"")[1]);
				parseMap.put(temp[0], temp[1].replaceAll("\"", ""));
			}
		}
		
		return parseMap.get("filename");
	}
	
	
	
	
	public static String getExtension(String realfilename) {
		
		
		String fileExtension = "";
		if(realfilename == null || realfilename.indexOf(".") == -1) {
			return fileExtension;
		}else {
			String[] fileExTemp = realfilename.split("\\.");
			for(int i=0; i<fileExTemp.length; i++) {
				if(i == fileExTemp.length - 1) {
					fileExtension = fileExTemp[i];
				}
			}
			return fileExTemp[1];
		}
		
	}
	
	
	
	
	
}
