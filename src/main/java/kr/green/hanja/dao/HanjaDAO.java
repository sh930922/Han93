package kr.green.hanja.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import kr.green.hanja.vo.HanjaVO;

@Repository
public interface HanjaDAO {
	// <!-- 전체 개수얻기 -->
	public int selectCount();
	// <!-- 1개 얻기 -->
	// <!-- idx로 찾기 -->
	public HanjaVO selectByIdx(int idx);
	// <!-- userid로 찾기 -->
	public List<HanjaVO> selectByUserid(String userid);
	// <!-- id 찾기 -->
	public List<String> selectUserid(HanjaVO vo);
	// <!-- id중복확인 : 아이디를 받아 아이디의 개수를 리턴 -->
	public int selectUseridCount(String userid);
	
	// <!-- 1페이지 얻기 -->
	public List<HanjaVO> selectList(HashMap<String, Integer> map);
	// <!-- 저장 -->
	public void insert(HanjaVO vo);
	// <!-- 수정 -->
	// <!-- 정보 수정 -->
	public void update(HanjaVO vo);
	// <!-- 인증 수정 -->
	public void updateUse(HashMap<String, Integer> map);
	//<!-- 레벨 수정 -->
	public void updateLevel(HashMap<String, Integer> map);
	//<!-- 비번 수정 -->
	public void updatePassword(HashMap<String, String> map);
	// <!-- 완전 삭제 -->
	public void delete(int idx);

	
}
