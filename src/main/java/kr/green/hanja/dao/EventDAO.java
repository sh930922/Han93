package kr.green.hanja.dao;

import java.util.List;

import kr.green.hanja.vo.EventVO;


public interface EventDAO {
	List<EventVO> selectEvent();
	void insert(EventVO vo);
	void update(EventVO vo);
	void delete(int id);
}
