package kr.green.hanja.vo;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
CREATE TABLE hanjadata(
	idx NUMBER DEFAULT 0,
	d   varchar2(200),
	s   varchar2(200),
	n   varchar2(200),
	q   varchar2(200),
	e1  varchar2(200),
	e2  varchar2(200),
	e3  varchar2(200),
	e4  varchar2(200),
	a   varchar2(200)
);
 */
@XmlRootElement
@Data
public class HanjaDataVO {
	private int idx;
	private String d;
	private String s;
	private String n;
	private String q;
	private String e1;
	private String e2;
	private String e3;
	private String e4;
	private String a;
}
