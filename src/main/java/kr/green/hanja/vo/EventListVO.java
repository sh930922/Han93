package kr.green.hanja.vo;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@XmlRootElement
@Data
public class EventListVO {
	private List<EventVO> eventVO;
}
