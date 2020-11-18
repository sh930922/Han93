package kr.green.hanja.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.hanja.service.EventService;
import kr.green.hanja.vo.EventListVO;
import kr.green.hanja.vo.EventVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class EventController {

	@Autowired
	private EventService eventService;
	
	@RequestMapping(value = "/eventList.xml")
	@ResponseBody
	public EventListVO event() {
		EventListVO  listVO = new EventListVO();
		listVO.setEventVO(eventService.selectEvent());
		return listVO;
	}
	@RequestMapping(value = "/eventList.json")
	@ResponseBody
	public List<EventVO> event2() {
		return eventService.selectEvent();
	}
	@RequestMapping(value = "/insert")
	@ResponseBody
	public EventVO insert(@ModelAttribute EventVO vo) {
		log.info("EventController.insert 호출 : " + vo.toString());
		eventService.insert(vo);
		return vo;
	}
	@RequestMapping(value = "/update")
	@ResponseBody
	public EventVO update(@ModelAttribute EventVO vo) {
		log.info("EventController.update 호출 : " + vo.toString());
		eventService.update(vo);
		return vo;
	}
	@RequestMapping(value = "/delete")
	@ResponseBody
	public int delete(@RequestParam int id) {
		log.info("EventController.delete 호출 : " + id);
		eventService.delete(id);
		return id;
	}
}
