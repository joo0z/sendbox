package kr.or.ddit.notice.view;

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class NoticeFileDownloadView  extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment; filename=\"" + (String) model.get("realfilename") + "\"");
	    response.setContentType("application/octet-stream");
		FileInputStream fis = new FileInputStream((String) model.get("filepath"));
		ServletOutputStream sos = response.getOutputStream();
		byte[] buffer = new byte[512];
		while ( fis.read(buffer) != -1) {
			sos.write(buffer);
		}
		fis.close();
		// 응답이 가지 않은게 있으면 보내고 닫아라
		sos.flush();
		sos.close();
		
	}
	
	

}