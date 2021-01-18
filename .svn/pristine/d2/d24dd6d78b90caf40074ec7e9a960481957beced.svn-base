package kr.or.ddit.business.library.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.business.library.service.LibService;
import kr.or.ddit.business.library.vo.LibEmpVO;
import kr.or.ddit.business.library.vo.LibVO;
import kr.or.ddit.emp.controller.FileUploadUtil;
import kr.or.ddit.emp.vo.EmpVO;

@Controller
public class LibraryController {

	private static final Logger logger = LoggerFactory.getLogger(LibraryController.class);

	@Resource(name = "libService")
	private LibService libService;

	@RequestMapping("/library")
	public String libraryList(Model model, LibVO libVO, HttpSession session, String libraryId, String searchKeyword) {

		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		LibEmpVO libEmp = new LibEmpVO();
		libEmp.setDeptId(empVO.getDeptId());
		logger.debug("empVO : {}", empVO);
		logger.debug("libraryId : {}", libraryId);
		logger.debug("검색할거 : {}", searchKeyword);

		libVO.setLibraryId(libraryId);
		libVO.setSearchKeyword(searchKeyword);

		try {
			List<LibVO> libList = libService.libList(libVO);
			List<LibEmpVO> libSelect = libService.libSelect(libEmp);
			logger.debug("===================================자료실===========================================");
			logger.debug("");
			logger.debug("");
			logger.debug("libList : {}", libList);
			logger.debug("리스트 사이즈 : {}", libList.size());
			logger.debug("");
			logger.debug("");
			logger.debug("=================================================================================");
			
			for(int i=0; i<libList.size(); i++) {
				LibVO listVO = libList.get(i);
				logger.debug("listVO ??????????????? {}",listVO);
				String nameStr = libList.get(i).getFileRealNm();
				String[] str = nameStr.split("[.]");
				listVO.setFileRealNm(str[0]);
				libList.set(i, listVO);
			}
			
			
			model.addAttribute("libList", libList);
			model.addAttribute("libraryId", libraryId);
			model.addAttribute("libSelect", libSelect);
			List<LibVO> folders = libService.folderList(libVO);
			model.addAttribute("folders", folders);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<LibVO> searchList = null;
		if (searchKeyword != null) {
			System.out.println("서치 키워드 있음 !!!!!!!!!!!!!!");
			logger.debug("키워드 : {}", searchKeyword);
			LibVO inputVO = new LibVO();
			inputVO.setSearchKeyword(searchKeyword);
			inputVO.setLibraryId(libraryId);
			try {
				searchList = libService.fileSearchList(inputVO);
				for(int i=0; i<searchList.size(); i++) {
					LibVO listVO = searchList.get(i);
					logger.debug("listVO ??????????????? {}",listVO);
					String nameStr = searchList.get(i).getFileRealNm();
					String[] str = nameStr.split("[.]");
					listVO.setFileRealNm(str[0]);
					searchList.set(i, listVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("libList", searchList);
		}
		return "tiles/library/library";
	}

	// left.jsp
	@RequestMapping(path = "/selectLib")
	public String selectLib(LibEmpVO libEmpVO, Model model) {
		logger.debug("libEmpVO : {}", libEmpVO);

		List<LibEmpVO> libList = null;
		try {
			libList = libService.libSelect(libEmpVO);
			logger.debug("libList 사이즈 : {}", libList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("libList", libList);
		return "jsonView";
	}

	@RequestMapping("/fileUpload")
	public String fileUpload(LibVO libVO, Model model, HttpServletRequest files, HttpSession session) {
		logger.debug("fileUpload");

		logger.debug("libVO1 : {}", libVO);
		List<MultipartFile> list = (List<MultipartFile>) ((MultipartRequest) files).getFiles("realfilename");
		logger.debug("개수 : {}", list.size());

		String filename = "";
		String filePath = "";
		String extension = "";
		int par = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getOriginalFilename() != null && !(list.get(i).getOriginalFilename().equals(""))) {
				logger.debug("extension : {}", FilenameUtils.getExtension(list.get(i).getOriginalFilename()));
				logger.debug("tempPath : {}", FilenameUtils.getPath(list.get(i).getOriginalFilename()));
				logger.debug("name : {}", FilenameUtils.getName(list.get(i).getOriginalFilename()));
				filename = UUID.randomUUID().toString();
				extension = FileUploadUtil.getExtension(list.get(i).getOriginalFilename());
				logger.debug("확장자 : {}", extension);
				filePath = "D:\\files\\" + filename + "." + extension;
				File uploadFile = new File(filePath);
				try {
					list.get(i).transferTo(uploadFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}

				EmpVO sessionEmpVO = (EmpVO) session.getAttribute("EMP");
				libVO.setEmpId(sessionEmpVO.getEmpId());
				libVO.setFileRealNm(list.get(i).getOriginalFilename());
				libVO.setFilePath(filePath);
				libVO.setFileIconId(FilenameUtils.getExtension(list.get(i).getOriginalFilename()));
				libVO.setParFileId(libVO.getParFileId());
				par = libVO.getParFileId();
				libVO.setDeptId(sessionEmpVO.getDeptId());
				libVO.setFileType(extension);
				logger.debug("파일타입 : {}", extension);
				libVO.setFileSize(Math.round((list.get(i).getSize()) / 1024) * 100 / 100 + "KB");
				libVO.setFileFolder("F");
				logger.debug("libVO2 : {}", libVO);

				try {
					int uploadCnt = libService.fileUpload(libVO);
					logger.debug("uploadCnt:{}", uploadCnt);
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}

		if (par != 0) {
			return "redirect:folderSearch?fileSeq=" + par;
		} else {
			return "redirect:/library?libraryId=" + libVO.getLibraryId();
		}

	}

	@RequestMapping("/deleteFile")
	public String deleteFile(LibVO libVO) {
		try {
			int cnt = libService.deleteFile(libVO);
			logger.debug("cnt : {}", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}

	@RequestMapping("/libFileDownload")
	public String LibFileDownloadView(LibVO libVO, Model model) {
		logger.debug("libVO : {}", libVO);
		if (libVO.getFileSeq() != 0) {
			try {
				libVO = libService.fileSelect(libVO);
				logger.debug("libVO2 : {}", libVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("fileVO", libVO);
			return "LibFileDownloadView";
		}
		return "redirect:/library?libraryId=" + libVO.getLibraryId();
	}

	@RequestMapping("/folderUpload")
	public String folderUpload(LibVO libVO, HttpSession session, Model model) {
		logger.debug("folderUpload");
		EmpVO sessionVO = (EmpVO) session.getAttribute("EMP");
		libVO.setEmpId(sessionVO.getEmpId());
		libVO.setFilePath("D:\\sendbox\\" + libVO.getFileRealNm() + "\\");
		logger.debug("folderLibVO : {}", libVO);
		try {
			int cnt = libService.folderUpload(libVO);
			logger.debug("cnt : {}", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (libVO.getParFileId() == 0) {
			return "redirect:/library?libraryId=" + libVO.getLibraryId();
		} else {
			return "redirect:/folderSearch?fileSeq=" + libVO.getParFileId();
		}

	}

	@RequestMapping("/folderSearch")
	public String folderSearch(Model model, LibVO libVO, String searchKeyword) {
		logger.debug("folderSearch");
		logger.debug("libVOdddddddddddddddddd : {}", libVO);
		List<LibVO> folderList = null;
		LibVO vo = new LibVO();
		try {
			folderList = libService.folderSearch(libVO);
			logger.debug("리스트 사이즈 ==> {}", folderList.size());
			vo = libService.fileSelect(libVO);
			libVO.setLibraryId(vo.getLibraryId());
			List<LibVO> folders = libService.folderList(libVO);
			model.addAttribute("folders", folders);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for(int i=0; i<folderList.size(); i++) {
			LibVO listVO = folderList.get(i);
			logger.debug("listVO ??????????????? {}",listVO);
			String nameStr = folderList.get(i).getFileRealNm();
			String[] str = nameStr.split("[.]");
			listVO.setFileRealNm(str[0]);
			folderList.set(i, listVO);
		}
		
		model.addAttribute("folderList", folderList);
		logger.debug("folderList : {}", folderList);
		model.addAttribute("vo", vo);

		List<LibVO> searchList = null;
		if (searchKeyword != null) {
			System.out.println("서치 키워드 있음 !!!!!!!!!!!!!!");
			logger.debug("키워드 : {}", searchKeyword);
			LibVO inputVO = new LibVO();
			LibVO dbVO = null;
			;
			try {
				dbVO = libService.fileSelect(libVO);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			inputVO.setSearchKeyword(searchKeyword);
			inputVO.setLibraryId(dbVO.getLibraryId());
			inputVO.setFileSeq(libVO.getFileSeq());
			try {
				searchList = libService.fileSearchList(inputVO);
				for(int i=0; i<folderList.size(); i++) {
					LibVO listVO = searchList.get(i);
					logger.debug("listVO ??????????????? {}",listVO);
					String nameStr = searchList.get(i).getFileRealNm();
					String[] str = nameStr.split("[.]");
					listVO.setFileRealNm(str[0]);
					searchList.set(i, listVO);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("folderList", searchList);
		}

		return "tiles/library/folderImgView";
	}

	@RequestMapping("/fileChangeName")
	public String fileChangeName(LibVO libVO) {
		logger.debug("바꿀이름 ?????????????? {}", libVO.getFileRealNm());
		logger.debug("libVO : {}", libVO);
		try {
			LibVO dbVO = libService.fileSelect(libVO);
			String fileName = dbVO.getFileRealNm();
			String[] fileNameArray = fileName.split("[.]");
			libVO.setFileRealNm(libVO.getFileRealNm() + "." + fileNameArray[fileNameArray.length - 1]);
			int cnt = libService.fileChange(libVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (!libVO.getLibraryId().equals("NO")) {
			return "redirect:/library?libraryId=" + libVO.getLibraryId();
		} else {
			return "redirect:folderSearch?fileSeq=" + libVO.getParFileId();
		}
	}

	@RequestMapping("/copyFile")
	public String copyFile(LibVO libVO) {
		try {
			libVO = libService.fileSelect(libVO);
			String fileName = libVO.getFileRealNm();
			String[] fileNameArray = fileName.split("[.]");
			int length = fileNameArray.length;
			libVO.setFileRealNm(fileNameArray[0] + "의 사본." + fileNameArray[length - 1]);
			int cnt = libService.fileUpload(libVO);
			logger.debug("cnt : {}", cnt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "jsonView";
	}

	@RequestMapping("/fileMove")
	public String fileMove(LibVO libVO) {
		logger.debug("fileMove : {}", libVO);
		try {
			int cnt = libService.fileChange(libVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/library?libraryId=" + libVO.getLibraryId();
	}

	@RequestMapping("/fileListView")
	public String fileListView(Model model, LibVO libVO, HttpSession session, String libraryId) {

		EmpVO empVO = (EmpVO) session.getAttribute("EMP");
		logger.debug("empVO : {}", empVO);
		logger.debug("libVO2222222222222222 : {}", libVO);
		libVO.setLibraryId(libraryId);
		String dataSize = "";
		String total = "1000024";

		try {
			List<LibVO> libList = libService.libFileList(libVO);
			logger.debug("libList : {}", libList);
			logger.debug("리스트 사이즈 : {}", libList.size());
			model.addAttribute("libList", libList);
			model.addAttribute("libraryId", libraryId);

			List<LibVO> folders = libService.folderList(libVO);
			model.addAttribute("folders", folders);

			dataSize = libService.libFileSize(libVO);
			logger.debug("dataSize : {}", dataSize);
			model.addAttribute("total", total);
			model.addAttribute("dataSize", dataSize);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "library/libraryListView";
	}

	@RequestMapping("/fileDrop")
	public String dataSize() {
		return "tiles/library/fileDrop";
	}

	@RequestMapping("/libBack")
	public String libBack(LibVO libVO, Model model) {
		logger.debug("libVO ?????????????? {}",libVO);
		LibVO dbVO = null;
		try {
			dbVO = libService.fileSelect(libVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int parFileId = dbVO.getParFileId();
		if(parFileId == 0) {
			model.addAttribute("url","/library?libraryId="+dbVO.getLibraryId());
		} else {
			model.addAttribute("url","/folderSearch?fileSeq="+dbVO.getParFileId());
		}
		
		return "jsonView";
	}
}