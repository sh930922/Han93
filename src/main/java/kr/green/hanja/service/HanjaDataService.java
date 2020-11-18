package kr.green.hanja.service;

import java.util.List;

import kr.green.hanja.vo.HanjaDataVO;

public interface HanjaDataService {
	// 1개 얻기
	public List<HanjaDataVO> selectByIdx(HanjaDataVO vo);
}
