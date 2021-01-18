package kr.or.ddit.address.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.address.dao.AddrMapperDao;
import kr.or.ddit.address.vo.AddrEmpVO;

@Service("addrService")
public class AddrService {
	
	@Resource(name ="addrMapperDao")
	private AddrMapperDao addrMapperDao;
	
	// 조회
	public List<AddrEmpVO> retrieveAddressList(AddrEmpVO addrEmpVO) throws Exception{
		return addrMapperDao.retrieveAddrList(addrEmpVO);
	}
	
	public int addrCount(AddrEmpVO addrEmpVO) throws Exception{
		return addrMapperDao.addrCount(addrEmpVO);
	}
	
	public int selectCount(AddrEmpVO addrEmpVO) throws Exception{
		return addrMapperDao.selectCount(addrEmpVO);
	}
	
	public List<AddrEmpVO> excelSelect(AddrEmpVO addrEmpVO) throws Exception{
		return addrMapperDao.excelSelect(addrEmpVO);
	}
	
	
}
