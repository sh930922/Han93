package kr.green.hanja.service;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.hanja.dao.HanjaDAO;
import kr.green.hanja.vo.HanjaVO;
import lombok.extern.slf4j.Slf4j;

@Service("hanjaService")
@Slf4j
public class HanjaServiceImpl implements HanjaService{

	@Autowired
	HanjaDAO hanjaDAO;
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	public int idCheck(String userid) {
		log.debug("hanjaService.idCheck 호출");
		return hanjaDAO.selectUseridCount(userid);
	}
	// 저장
	public void insert(HanjaVO vo) {
		log.debug("hanjaService.insert 호출");
		// 데이터의 유효성을 검사해야 한다.
		// 비밀번호를 암호화해서 저장하자
		String password = vo.getPassword();
		password = bcryptPasswordEncoder.encode(password);
		vo.setPassword(password);
		// 저장
		hanjaDAO.insert(vo);
	}
	
	// 이메일 인증
	public void useOk(String userid) {
		log.debug("hanjaService.useOk 호출");
		// 데이터 베이스에 쿼리를 use값을 1로 변경해 준다.
		// userid로 vo를 얻고
		List<HanjaVO> list = hanjaDAO.selectByUserid(userid);
		System.out.println("useOk : " + list);
		// 해당 아이디가 존재하면
		if(list!=null) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("idx", list.get(0).getIdx());
			map.put("use", 1);
			// user값을 인증완료인 "1"로 변경한다.
			hanjaDAO.updateUse(map);
		}
	}
	
	// 아이디 찾기
	public String findUserid(String name, String hp) {
		log.debug("hanjaService.findUserid 호출");
		String userid = null;
		
		// DAO에 넘기기 위해 VO를 만들고
		HanjaVO vo = new HanjaVO();
		vo.setName(name);
		vo.setHp(hp);
		List<String> list = hanjaDAO.selectUserid(vo);
		if(list!=null && list.size()>0) { // 사용자 아이디가 있으면
			userid = list.get(0); // 대입
		}
		return userid;
	}
	
	// 비밀번호 찾기
	public String findPassword(String userid, String hp) {
		log.debug("hanjaService.findPassword 호출");
		String newPassword="";
		List<HanjaVO> list = hanjaDAO.selectByUserid(userid);
		if(list!=null && list.size()>0) {
			HanjaVO vo = list.get(0);
			if(vo!=null && vo.getHp().equals(hp)) {
				// 비번을 만들어서 
				newPassword = makePassword(10);
				// DB에 업데이트하고 만들어진 비번을 리턴!!!
				// 비번을 암호화 해서
				String password = bcryptPasswordEncoder.encode(newPassword);
				// 비번 업데이트
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("password", password);
				map.put("idx", vo.getIdx()+"");
				hanjaDAO.updatePassword(map);
			}			
		}
		return newPassword;
	}
	// 비번을 변경해주는 서비스
	public boolean updatePassword(int idx, String userid, String cpassword, String npassword) {
		log.debug("hanjaService.updatePassword 호출 : " + idx + ", " + userid + ", " + cpassword + ", " + npassword);
		boolean isChange = false;
		// 1. idx에 해당하는 vo를 가져온다.
		HanjaVO vo = hanjaDAO.selectByIdx(idx);
		log.debug("hanjaService.updatePassword 호출 : " + vo);
		// 2. vo가 null이 아니면 비번이 같은지 비교한다.
		if(vo!=null) {
			if(bcryptPasswordEncoder.matches(cpassword, vo.getPassword())) {
				log.debug("hanjaService.updatePassword 호출 : 암호 변경!!!");
				// 3. 비번이 같으면 새로운 비번으로 업데이트 한다.
				String newPassword = bcryptPasswordEncoder.encode(npassword);
				// 비번 업데이트
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("password", newPassword);
				map.put("idx", idx+"");
				hanjaDAO.updatePassword(map);
				isChange = true;
			}
		}
		return isChange;
	}
	// 회원 정보를 변경해주는 서비스
	public HanjaVO update(HanjaVO vo) {
		log.debug("hanjaService.update 호출 : " + vo);
		HanjaVO hanjaVO = null;
		if(vo!=null) {
			// 1. DB에서 해당 번호의 정보를 읽어온다
			HanjaVO dbVO = hanjaDAO.selectByIdx(vo.getIdx());
			log.debug("hanjaService.update DB암호 : " + dbVO.getPassword());
			log.debug("hanjaService.update VO암호 : " + vo.getPassword());
			log.debug("hanjaService.update 암호 : " + bcryptPasswordEncoder.encode(vo.getPassword()));
			log.debug("hanjaService.update 암호 : " + bcryptPasswordEncoder.matches(vo.getPassword(), dbVO.getPassword()));
			// 2. 정보가 있다면 암호가 같은지 판단하여 암호가 같을때만 수정한다.
			// bcryptPasswordEncoder는 디코드 함수를 제공하지 않으므로 
			// 반드시 matches()메서드를 이용하여 비교하여야 한다.
			if(dbVO!=null && bcryptPasswordEncoder.matches(vo.getPassword(), dbVO.getPassword())) {
				log.debug("hanjaService.update 수정 : " + vo);
				hanjaDAO.update(vo);
				hanjaVO = hanjaDAO.selectByIdx(vo.getIdx());
			}
		}
		return hanjaVO;
	}
	
	// 길이만큼의 무작위 비번을 만들어주는 메서드
	@Override
	public String makePassword(int length) {
		log.debug("hanjaService.makePassword 호출");
		StringBuffer sb = new StringBuffer();
		Random rnd = new Random();
		for(int i=0;i<length;i++) {
			if((i+1)%3==0) {
				sb.append((char)('A' + rnd.nextInt(26)));
			}else if((i+1)%3==1){
				sb.append((char)('a' + rnd.nextInt(26)));
			}else {
				sb.append((char)('0' + rnd.nextInt(10)));
			}
		}
		return sb.toString();
	}
	// 추가 !!!!
	@Override
	public List<HanjaVO> selectByUserid(String userid) {
		return hanjaDAO.selectByUserid(userid);
	}
	
	@Override
	public List<String> selectUserid(HanjaVO vo) {
		return hanjaDAO.selectUserid(vo);
	}
	@Override
	public void updateUse(HashMap<String, Integer> map) {
		hanjaDAO.updateUse(map);
	}	
}

