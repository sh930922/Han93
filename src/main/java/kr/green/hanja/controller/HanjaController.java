package kr.green.hanja.controller;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.Response;
import com.mysql.fabric.xmlrpc.base.Param;

import kr.green.hanja.service.EMailService;
import kr.green.hanja.service.HanjaDataService;
import kr.green.hanja.service.HanjaService;
import kr.green.hanja.vo.HanjaDataVO;
import kr.green.hanja.vo.HanjaVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HanjaController {
	
	@Autowired
	HanjaService hanjaService;
	@Autowired
	EMailService  emailService; 
	@Inject
	private HanjaDataService hanjaDataService;
	
	@RequestMapping(value = {"/","/index"})
	public String index(Model model, HanjaVO vo) {
		log.debug("HanjaController.index 호출");
		model.addAttribute("user", vo.getNickname());
		log.debug("vo.getNickname() : " + vo.getNickname());
		return "index";
	}
	/*
	@RequestMapping(value = "/index2")
	public String index2(Model model) {
		log.debug("MemberController.index2 호출");
		return "index2";
	}
	@RequestMapping(value = "/index3")
	public String index3(Model model) {
		log.debug("MemberController.index3 호출");
		return "index3";
	}
	@RequestMapping(value = "/index4")
	public String index4(Model model) {
		log.debug("MemberController.index4 호출");
		return "index4";
	}
	@RequestMapping(value = "/index5")
	public String index5(Model model) {
		log.debug("MemberController.index5 호출");
		return "index5";
	}
	@RequestMapping(value = "/login")
	public String login(Model model) {
		log.debug("MemberController.login 호출");
		return "login";
	}
	
	@RequestMapping(value = "/register")
	public String register(Model model) {
		log.debug("MemberController.register 호출");
		return "register";
	}
	*/
	
	// 위의 모든 맵핑을 이것으로 대치가 가능하다.
	@RequestMapping(value = "/{name}")
	public String path2(@PathVariable("name") String name, Model model, HanjaVO vo) {
		log.debug("HanjaController." + name + " 호출");
		model.addAttribute("user", vo.getName());
		return name;
	}
	
	/*
	@RequestMapping("/index4")
    public String selectByIdx4(Model model,HanjaDataVO vo) {
		vo.setS("74회");
		vo.setD("8급");
		log.debug("selectByIdxController. 호출" + vo);
        List<HanjaDataVO> list = hanjaDataService.selectByIdx(vo);
        model.addAttribute("list", list);
        return "index4";
    }
	*/
	
	@RequestMapping("/index2")
	public String selectByIdx2(Model model,HanjaDataVO vo) {
		vo.setS("74회");
		vo.setD("8급");
		log.debug("Controller.selectByIdx2 호출 " + vo);
		//List<HanjaDataVO> list = hanjaDataService.selectByIdx(vo);
		// model.addAttribute("list", list);
		return "index2";
	}
	
	@RequestMapping(value = "/result")
	public String result(@RequestParam Map<String, Object> param , HttpServletRequest request, Model model) {
		log.debug("Controller. result로 넘어온 데이터 : " + param);
		// 정답 파일을 읽는다.
		// 몇급 몇회인지 넘어온값 변수에 넣고
		int item1 = Integer.parseInt((String) param.get("items1"));
		int item2 = Integer.parseInt((String) param.get("items2"));
		log.debug("Controller. result로 넘어온 데이터 : " + item1 + ", " + item2);
		String items1[] = "8급,7급,6급,5급,준5급,4급,준4급,준3급".split(",");
		String D = items1[item1-1];
		String items2[] = "74회,75회,76회,85회".split(",");
		String S = items2[item2-1];
		
		// 디비에서 정답 불러오기
		HanjaDataVO vo = new HanjaDataVO();
		// 몇급 몇회
		vo.setD(D);
		vo.setS(S);
		log.debug("vo불러오기 : " + vo);
		
		
		List<HanjaDataVO> list = hanjaDataService.selectByIdx(vo);
		log.debug("DB에 들어있는 정답 : " + list);
		//채점하기
		int score = 0;
		for(int i=0;i<list.size();i++) {
			String a = list.get(i).getA();
			if(param.containsKey("a" + i)) {
					String q = (String) param.get("a"+i); 
					if(a.equals(q)) {
						score++;
					}
			}
		}
		model.addAttribute("listsize", list.size());
		model.addAttribute("D", D);
		model.addAttribute("S", S);
		model.addAttribute("score", score);
		return "result";
	}
	
	@RequestMapping("/selectJson")
	@ResponseBody
	public List<HanjaDataVO> selectJson(HanjaDataVO vo, Model model) {
		log.debug("Controller selectJson. 호출 " + vo);
		List<HanjaDataVO> list = hanjaDataService.selectByIdx(vo);
		model.addAttribute("list", list);
		return list;
	}
	
	@RequestMapping(value = "/registerOk", method = RequestMethod.GET)
	public String registerOkGet(Model model) {
		return "redirect:/";
	}
	@RequestMapping(value = "/registerOk", method = RequestMethod.POST)
	public String registerOkPost(@ModelAttribute HanjaVO hanjaVO, Model model) {
		log.debug("HanjaController.registerOk 호출 : " + hanjaVO);
		hanjaService.insert(hanjaVO);
		try {
			StringBuffer sb = new StringBuffer();
			sb.append(hanjaVO.getName() + "님!!!<br>");
			sb.append("회원가입을 완료하려면 다음의 링크를 클릭하세요!!!<br>");
			sb.append("<a href='http://localhost:8080/hanja/useOk");
			sb.append("?userid=" + URLEncoder.encode(hanjaVO.getUserid(),"UTF-8") + "'>가입완료</a>");
			emailService.sendMail(hanjaVO.getUserid(), "회원 가입을 축하합니다.", sb.toString());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "registerOk";
	}
	@RequestMapping(value = "/useOk")
	public String useOk(@RequestParam("userid")String userid, Model model) {
		log.debug("HanjaController.useOk 호출 : " + userid);
		List<HanjaVO> list = hanjaService.selectByUserid(userid);
		if(list!=null && list.size()>0) {
			HanjaVO vo = list.get(0);
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("idx",vo.getIdx() );
			map.put("use", 1 );
			hanjaService.updateUse(map);
			
			// 권한테이블에 권한을 등록하는 코드가 들어가야 한다.
			
			
			model.addAttribute("hanjaVO", vo);
		}
		return "useOk";
	}
	@RequestMapping(value = "/idCheck", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String idCheck(@RequestParam("userid")String userid, Model model) {
		log.debug("HanjaController.idCheck 호출 : " + userid);
		return hanjaService.idCheck(userid)+"";
	}

	@RequestMapping(value = "/findUseridOk", method = RequestMethod.GET)
	public String findUseridOkGet(HttpServletRequest request,  Model model) {
		log.debug("HanjaController.findUseridOk 호출 : " );
		return "redirect:/";
	}

	@RequestMapping(value = "/findUseridOk", method = RequestMethod.POST)
	public String findUseridOkPost(HttpServletRequest request,  Model model) {
		log.debug("HanjaController.findUseridOk 호출 : " );
		// 데이터 받기
		String referer = request.getParameter("referer");
		String name = request.getParameter("name");
		String hp = request.getParameter("hp");
		
		// 서비스 클래스를 호출하여 
		String userid = hanjaService.findUserid(name, hp);
		model.addAttribute("userid", userid);
		model.addAttribute("name", name);
		model.addAttribute("referer", referer);
		return "findUseridOk";
	}
	
	@RequestMapping(value = "/findPasswordOk", method = RequestMethod.GET)
	public String findPasswordOkGet() {
		log.debug("HanjaController.findPasswordOk 호출 : " );
		return "redirect:/";
	}
	
	@RequestMapping(value = "/findPasswordOk", method = RequestMethod.POST)
	public String findPasswordOkPost(HttpServletRequest request,  Model model) {
		log.debug("HanjaController.findPasswordOk 호출 : " );
		// 데이터 받기
		String referer = request.getParameter("referer");
		String userid = request.getParameter("userid");
		String hp = request.getParameter("hp");
		
		// 서비스 클래스를 호출하여 비밀번호를 만들어 업데이트하고
		String newPassword = hanjaService.findPassword(userid, hp); 

		if(newPassword!=null && newPassword.trim().length()>0 ) {
			// 사용자에게 이메일을 보내준다.
			StringBuffer sb = new StringBuffer();
			sb.append(userid + "님 새로운 비번이 만들러 졌습니다.<br>");
			sb.append("만들어진 임시 비밀번호는 \"" + newPassword + "\"입니다.");
			sb.append("<br>");
			sb.append("로그인하셔서 반드시 비밀번호를 변경하여 사용해 주세요!!!");
			emailService.sendMail(userid, "새로운 비번이 만들러 졌습니다.", sb.toString());
			model.addAttribute("userid", userid);
			model.addAttribute("referer", referer);
		}
		return "findUseridOk";
	}

	@RequestMapping(value = "/hanjaUpdateOk", method = RequestMethod.GET)
	public String hanjaUpdateGet() {
		log.debug("HanjaController.hanjaUpdate 호출 : " );
		return "redirect:/";
	}
	
	@RequestMapping(value = "/hanjaUpdateOk", method = RequestMethod.POST)
	public String hanjaUpdatePost(@ModelAttribute HanjaVO hanjaVO, HttpServletRequest request,  Model model) {
		log.debug("HanjaController.hanjaUpdate 호출 : " + hanjaVO );
		if(hanjaVO!=null) {
			hanjaVO = hanjaService.update(hanjaVO);
			// 세션에 다시 저장
			request.getSession().setAttribute("hanjaVO", hanjaVO);
			model.addAttribute("hanjaVO", hanjaVO);
		}
		return "hanjaUpdateOk";
	}
	
	@RequestMapping(value = "/changePasswordOk", method = RequestMethod.GET)
	public String changePasswordGet() {
		log.debug("HanjaController.changePasswordOk 호출 : " );
		return "redirect:/";
	}
	
	@RequestMapping(value = "/changePasswordOk", method = RequestMethod.POST)
	public String OkPost(HttpServletRequest request, HttpSession session,  Model model) {
		log.debug("HanjaController.changePasswordOk 호출 : " + session );
		// 데이터 받기
		String cpassword = request.getParameter("cpassword");
		String npassword = request.getParameter("password");
		
		// 서비스를 호출하여 현재 비번이 같으면 새로운 비번으로 업데이트 한다.
		int idx = ((HanjaVO)session.getAttribute("hanjaVO")).getIdx();
		String userid = ((HanjaVO)session.getAttribute("hanjaVO")).getUserid();
		log.debug("HanjaController.changePasswordOk 호출 : " + idx);
		log.debug("HanjaController.changePasswordOk 호출 : " + userid);
		boolean isChange = hanjaService.updatePassword(idx, userid, cpassword, npassword);
		if(isChange){
			// 강제 로그아웃을 시키고
			session.removeAttribute("hanjaVO");
			return "redirect:/login";
		}
		return "changePasswordOk";
	}
	
	@RequestMapping(value="/test4321")
    public String test4321(HttpServletRequest request, Model model){
		log.debug("HanjaController.test4321 호출 ");
		
//        String aass = request.getParameter("aass");
//        String qqww  = request.getParameter("qqww");    
//        System.out.println("aass : " + aass);
//        System.out.println("qqww : " + qqww);
//        model.addAttribute("aass", aass);
//        model.addAttribute("qqww", qqww);
        return "test4321";
    }

	
	// **************************************************************************************
	// 시크리트 사용자 정보 얻기
	private String getPrincipal() {
		log.debug("getPrincipal 호출");
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		log.debug("accessDeniedPage 호출 ");
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}
	
}
