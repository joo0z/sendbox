package kr.or.ddit.business.library.view;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

import kr.or.ddit.business.library.vo.LibVO;

public class LibMkDirView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		LibVO fileVO = (LibVO)model.get("folderVO");
		File newfile = new File("d:\\sendbox\\"+fileVO.getFileRealNm()+"\\");
		
		if (newfile.mkdir()) {
			System.out.println("디렉토리 생성 성공");
		} else {
			System.out.println("디렉토리 생성 실패");
		}
	}
}
