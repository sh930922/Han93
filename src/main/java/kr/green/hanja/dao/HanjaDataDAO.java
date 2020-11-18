package kr.green.hanja.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.green.hanja.vo.HanjaDataVO;

@Repository
public interface HanjaDataDAO {
	// 한개 얻기
	public List<HanjaDataVO> selectByIdx(HanjaDataVO vo);
}
