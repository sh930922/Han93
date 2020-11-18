package kr.green.hanja.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;
/*
userid : 사용자 아이디(이메일) ==> 이메일 인증
password : 사용자 비밀번호
name : 이름
nickname : 별명
hp : 휴대폰 번호
birth : 생년월일
gender : 성별
use  : 인증(0:인증전, 1:인증, 2:휴면)
lvl : 등급(1~10)
zipcode : 우편번호
addr1 : 주소1
addr2 : 주소2
regDate : 가입일
 */
@XmlRootElement
@Data
public class HanjaVO {
	private int 	idx;
	private String  userid;
	private String  password;
	private String  name;
	private String  nickname;
	private String  hp;
	private String  birth;
	private String  gender;
	private int  	use;
	private int  	lvl;
	private String  zipcode;
	private String  addr1;
	private String  addr2;
	private Date    regDate;
	
}
