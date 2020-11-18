package kr.green.hanja.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.green.hanja.service.TestService;
import kr.green.hanja.vo.TestVO;
import lombok.extern.slf4j.Slf4j;

@Controller
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@RequestMapping(value = "/testDB")
	public String testDB(Model model) {
		TestVO vo = new TestVO(); 
		vo.setToday(testService.selectToday());
		vo.setSum(testService.selectSum(22, 33));
		vo.setMul(testService.selectMul(1, 2, 3));
		model.addAttribute("vo", vo);
		return "testDB";
	}
	@RequestMapping(value = "/testVO")
	@ResponseBody
	public TestVO testDB() {
		TestVO vo = new TestVO(); 
		vo.setToday(testService.selectToday());
		vo.setSum(testService.selectSum(22, 33));
		vo.setMul(testService.selectMul(1, 2, 3));
		return vo;
	}
		
	/*
	@RequestMapping(value = "/index")
	public String index(Model model) {
		return "index";
	}
	
	
	
	@RequestMapping(value = "/{name}")
	public String path2(@PathVariable("name") String name, Model model) {
		return name;
	}
	*/
}
