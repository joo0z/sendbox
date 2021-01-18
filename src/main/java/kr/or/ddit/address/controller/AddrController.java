package kr.or.ddit.address.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.address.service.AddrService;
import kr.or.ddit.address.view.AddrExcelView;
import kr.or.ddit.address.vo.AddrEmpVO;
import kr.or.ddit.comm.vo.PaginationVO;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.notice.controller.NoticeController;
import net.sf.jxls.exception.ParsePropertyException;

@Controller
public class AddrController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Resource(name = "addrService")
	private AddrService addrService;
	
	@RequestMapping("/address")
	public String addressView(Model model,AddrEmpVO addrEmpVO) {
		addrEmpVO.setRecordCountPerPage(10);
		addrEmpVO.setPageSize(5);
		int cnt = 0;
		
		try {
			List<AddrEmpVO> empList = addrService.retrieveAddressList(addrEmpVO);
			cnt = addrService.addrCount(addrEmpVO);
			model.addAttribute("empList", empList);
			int addrCnt = addrService.addrCount(addrEmpVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		PaginationVO pagination = new PaginationVO(addrEmpVO.getPageIndex(), 
												addrEmpVO.getRecordCountPerPage(), 
												addrEmpVO.getPageSize(), 
												cnt);
		model.addAttribute("pagination", pagination);
		
		logger.debug("addressEmpVO2 : {}", addrEmpVO);
		return "tiles/address/address";
	}
	
	@RequestMapping("/empSearch")
	public String empSearch(Model model,AddrEmpVO addrEmpVO){
		addrEmpVO.setRecordCountPerPage(addrEmpVO.getRecordCountPerPage());
		addrEmpVO.setPageSize(5);
		int cnt = 0;
		
		try {
			List<AddrEmpVO> empList = addrService.retrieveAddressList(addrEmpVO);
			cnt = addrService.selectCount(addrEmpVO); 
			logger.debug("cnt : {}", cnt);
			model.addAttribute("empList", empList);
			int addrCnt = addrService.addrCount(addrEmpVO);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		PaginationVO pagination = new PaginationVO(addrEmpVO.getPageIndex(), 
												addrEmpVO.getRecordCountPerPage(), 
												addrEmpVO.getPageSize(), 
												cnt);
		model.addAttribute("pagination", pagination);
		logger.debug("addressEmpVO2 : {}", addrEmpVO);
		
		return "address/addressAjax";
	}
	
	@RequestMapping("/addressExcelDownload")
	public void addressExcelDownload(HttpServletRequest request, HttpServletResponse response,AddrEmpVO addrEmpVO,HttpSession session) throws Exception {

		addrEmpVO.setStandard(null);
		addrEmpVO.setRecordCountPerPage(addrService.addrCount(addrEmpVO));
		List<AddrEmpVO> addrList = addrService.excelSelect(addrEmpVO);
		AddrExcelView aev = new AddrExcelView();
		logger.debug("addrEmpVO : {}", addrEmpVO);
		
		// 받은 데이터를 맵에 담는다.
		Map<String, Object> beans = new HashMap<String, Object>();
		EmpVO empVo = (EmpVO) session.getAttribute("EMP");
		beans.put("addrList", addrList);
		beans.put("name", empVo.getEmpNm());
		logger.debug("name : {}", empVo.getEmpNm());
		
		// 엑셀 다운로드 메소드가 담겨 있는 객체
		aev.download(request, response, beans, empVo.getEmpNm() +"address", "address.xlsx", "address");
	}


}
