package kr.green.hanja.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.green.hanja.vo.HanjaDataVO;

public class HanjaDataDAOImpl implements HanjaDataDAO{

	@Inject
    private SqlSession session;
	
	@Override
	public List<HanjaDataVO> selectByIdx(HanjaDataVO vo) {
		
		return session.selectList("selectByIdx", vo);
	}

}
