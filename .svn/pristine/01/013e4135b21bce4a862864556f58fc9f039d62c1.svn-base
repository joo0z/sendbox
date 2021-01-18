package kr.or.ddit.community.view;

import java.io.FileInputStream;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class CommuIconView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		FileInputStream fis;
		ServletOutputStream sos;
		try {
			fis = new FileInputStream((String) model.get("commuIconPath"));
			sos = response.getOutputStream();

			byte[] buffer = new byte[512];

			while (fis.read(buffer) != -1) {
				sos.write(buffer);
			}

			fis.close();
			sos.flush();
			sos.close();
			
		}catch (Exception e) { 
//			e.printStackTrace(); 
			// 커뮤니티 기본 사진이 없을 경우
			try {
				fis = new FileInputStream("D:\\sendbox\\commu_img\\default_commu.png");
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
