package kr.green.hanja.service;

import java.util.HashMap;
import java.util.List;

import kr.green.hanja.vo.HanjaVO;

public interface HanjaService {
	public int idCheck(String userid);
	// 저장
	public void insert(HanjaVO vo);
	// 이메일 인증
	public void useOk(String userid);
	// 로그인 처리하기
	// public HanjaVO loginOk(String userid, String password);
	// 아이디 찾기
	public String findUserid(String name, String hp);
	// 비밀번호 찾기
	public String findPassword(String userid, String hp);
	// 비번을 변경해주는 서비스
	public boolean updatePassword(int idx, String userid, String cpassword, String npassword);
	// 회원 정보를 변경해주는 서비스
	public HanjaVO update(HanjaVO vo);
	// 길이만큼의 무작위 비번을 만들어주는 메서드
	public String makePassword(int length);
	
	// 추가!!!!
	// <!-- userid로 찾기 -->
	public List<HanjaVO> selectByUserid(String userid);
	// <!-- id 찾기 -->
	public List<String> selectUserid(HanjaVO vo);
	// <!-- 인증 수정 -->
	public void updateUse(HashMap<String, Integer> map);

}
