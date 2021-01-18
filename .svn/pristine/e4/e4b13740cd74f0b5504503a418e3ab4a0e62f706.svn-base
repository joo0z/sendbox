package kr.or.ddit.memo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.memo.dao.MemoMapper;
import kr.or.ddit.memo.vo.MemoVO;

@Service("memoService")
public class MemoService{
	
	@Resource(name="memoMapper")
	private MemoMapper memoMapper;

	public String create(MemoVO memoVO) throws Exception {
		memoMapper.create(memoVO);
		return memoVO.getMemoSeq();
	}
	
	public List<MemoVO> retrieveList(MemoVO memoVO) throws Exception {
		return memoMapper.retrieveList(memoVO);
	}
	
	public MemoVO retreive(MemoVO memoVO) throws Exception {
		return memoMapper.retreive(memoVO);
	}
	
	public int update(MemoVO memoVO) throws Exception {
		return memoMapper.update(memoVO);
	}
	
	public int delete(MemoVO memoVO) throws Exception{
		return memoMapper.delete(memoVO);
	}
}