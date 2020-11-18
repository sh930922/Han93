package kr.green.hanja.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.hanja.dao.HanjaDataDAO;
import kr.green.hanja.vo.HanjaDataVO;
import lombok.extern.slf4j.Slf4j;

@Service("hanjaDataService")
@Slf4j
public class HanjaDataServiceImpl implements HanjaDataService{
	
	@Autowired
	private HanjaDataDAO hanjaDataDAO; 

	@Override
	public List<HanjaDataVO> selectByIdx(HanjaDataVO vo) {
		log.debug("HanjaDataService.selectByIdx 호출 : " + vo);
		// TODO Auto-generated method stub
		return hanjaDataDAO.selectByIdx(vo);
	}

}
