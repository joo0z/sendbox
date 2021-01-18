package kr.or.ddit.business.busiboard.view;

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.business.busiboard.vo.BusiFileVO;

public class FileDownloadView extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("application/octet-stream");
		
		BusiFileVO busiFile = (BusiFileVO) model.get("busiFile");
		
		String fileName = new String(busiFile.getRealfilename().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		
		ServletOutputStream sos = response.getOutputStream();
		
		FileInputStream fis = new FileInputStream(busiFile.getFilepath());
		byte[] buffer = new byte[512];
		
		while(fis.read(buffer) != -1) {
			sos.write(buffer);
		}
		
		fis.close();
		sos.flush();
		sos.close();
	}
}
