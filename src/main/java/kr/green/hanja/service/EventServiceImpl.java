package kr.green.hanja.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.hanja.dao.EventDAO;
import kr.green.hanja.vo.EventVO;
import lombok.extern.slf4j.Slf4j;

@Service("eventService")
@Slf4j
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List<EventVO> selectEvent() {
		log.info("EventServiceImpl.selectEvent 호출!!!!");
		List<EventVO> list = eventDAO.selectEvent();
		log.info("DB내용 : " + list.size() + "개");
		log.info("DB내용 : " + list);
		return list;
	}

	@Override
	public void insert(EventVO vo) {
		log.info("EventServiceImpl.insert 호출 : " + vo.toString());
		if(vo != null) eventDAO.insert(vo);
		selectEvent(); // 확인!!! 나중에 지움
	}

	@Override
	public void update(EventVO vo) {
		log.info("EventServiceImpl.update 호출 : " + vo.toString());
		if(vo != null) eventDAO.update(vo);
		selectEvent();
	}

	@Override
	public void delete(int id) {
		log.info("EventServiceImpl.delete 호출 : " + id);
		eventDAO.delete(id);
		selectEvent();
	}

}
