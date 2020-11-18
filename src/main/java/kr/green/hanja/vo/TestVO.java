package kr.green.hanja.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@XmlRootElement
@Data
public class TestVO {
	private String today;
	private int sum;
	private int mul;
}

