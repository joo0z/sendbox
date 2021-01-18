package kr.or.ddit.emp.view;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class ProfileImgView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) {
		
		FileInputStream fis;
		ServletOutputStream sos;
		try {
			fis = new FileInputStream((String) model.get("filepath"));
			sos = response.getOutputStream();

			byte[] buffer = new byte[512];
			
			while (fis.read(buffer) != -1) {
				sos.write(buffer);
			}
			
			fis.close();
			sos.flush();
			sos.close();
		
		} catch (Exception e) { 
//			e.printStackTrace(); 
			// 기본 프로필 사진이 없을 경우
			try {
				fis = new FileInputStream("D:\\profile\\default_member.png");
				sos = response.getOutputStream();
				
				byte[] buffer = new byte[512];
				
				while (fis.read(buffer) != -1) {
					sos.write(buffer);
				}
				
				fis.close();
				sos.flush();
				sos.close();
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

}