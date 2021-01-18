package kr.or.ddit.businessTree.dao;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import kr.or.ddit.businessTree.vo.BusinessTreeVO;

@Mapper("businessTreeMapperDao")
public interface BusinessTreeMapperDao {

	List<BusinessTreeVO> selectBusinessTreeList(BusinessTreeVO busiTree) throws Exception;
}
