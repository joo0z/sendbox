package kr.or.ddit.address.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.address.vo.AddrEmpVO;

@Mapper("addrMapperDao")
public interface AddrMapperDao {

	/**
	 * 전체 주소록 List 조회
	 * @param addrEmpVO
	 * @return List
	 * @throws Exception
	 */
	List<AddrEmpVO> retrieveAddrList(AddrEmpVO addrEmpVO) throws Exception;
	
	/**
	 * 전체 사원 수 
	 * @param addrEmpVO
	 * @return int
	 * @throws Exception
	 */
	int addrCount(AddrEmpVO addrEmpVO) throws Exception;
	
	/**
	 * 선택한 회원들의 수
	 * @param addrEmpVO
	 * @return int
	 * @throws Exception
	 */
	int selectCount(AddrEmpVO addrEmpVO) throws Exception;
	
	/**
	 * 엑셀출력을 위한 전직원의 정보
	 * @param addrEmpVO
	 * @return List
	 * @throws Exception
	 */
	List<AddrEmpVO> excelSelect(AddrEmpVO addrEmpVO) throws Exception;
	
}