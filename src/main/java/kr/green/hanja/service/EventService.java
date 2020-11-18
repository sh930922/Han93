package kr.green.hanja.service;

import java.util.List;

import kr.green.hanja.vo.EventVO;

public interface EventService {
	List<EventVO> selectEvent();
	void insert(EventVO vo);
	void update(EventVO vo);
	void delete(int id);
}
