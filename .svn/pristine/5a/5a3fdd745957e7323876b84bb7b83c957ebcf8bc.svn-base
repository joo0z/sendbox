package kr.or.ddit.community.view;

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.community.vo.CommuBoardFileVO;

public class CommuBoardFileDownView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		CommuBoardFileVO dbFile = (CommuBoardFileVO) model.get("dbFile");
		
		
		response.setContentType("application/octet-stream; charset=UTF-8");
		
		String downFileName = new String(dbFile.getRealfilename().getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + downFileName + "\"");
		
		
		String filename = dbFile.getFilepath(); // 파일경로
		
		
		if(!dbFile.getFilepath().equals("") && dbFile.getRealfilename() != null && !dbFile.getRealfilename().equals("")) {
			
			FileInputStream fis = new FileInputStream(filename);
			ServletOutputStream sos = response.getOutputStream();
			
			byte[] buffer = new byte[512];
			while(fis.read(buffer) != -1) {
				sos.write(buffer);
			}
			fis.close();
			sos.flush();
			sos.close();
		}
		
	}

}
