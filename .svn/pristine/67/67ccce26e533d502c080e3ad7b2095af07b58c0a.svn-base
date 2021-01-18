package kr.or.ddit.emp.controller;

public class FileUploadUtil {
	//form-data; name="img"; filename="sally.png"
	//filename="sally.png; form-data; name="img"
	//=>sally.png
	//FileUploadUtilTest
	public static String getFilename(String contentDisposition) {
		String[] files = contentDisposition.split("; ");
		String files2 = "";
		for(int i = 0; i<files.length; i++) {
			String[] file = files[i].split("=");
			if(file[0].equals("filename")) {
				files2 = file[1].replace("\"", "");
			}
		}
		return files2;
	}
	
	//filename : sally.png ==> png
	public static String getExtension(String filename) {
//		String[] file = filename.split("[.]");
//		return file[1];
		if(filename == null || filename.indexOf(".") == -1)
			return "";
		else
			return filename.split("\\.")[1];
	}

}
