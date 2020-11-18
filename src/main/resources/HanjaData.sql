CREATE SEQUENCE hanja_role_idx_seq;
-- DROP SEQUENCE hanja_role_idx_seq;
SELECT * FROM hanja_role_idx_seq;
select * from user_sequences;


CREATE TABLE hanja_roles (
  role_idx NUMBER(11)  PRIMARY KEY,
  userid varchar2(45) NOT NULL,
  role varchar2(45) NOT NULL
);
-- DROP TABLE HANJA_roles;
SELECT * FROM hanja_roles;

INSERT INTO hanja_ROLES (role_idx,userid,role) VALUES 
(hanja_role_idx_seq.nextval,'sh930922@gmail.com','ROLE_ADMIN');
INSERT INTO hanja_ROLES (role_idx,userid,role)  VALUES 
(hanja_role_idx_seq.nextval,'sh930922@gmail.com','ROLE_DBA');
INSERT INTO hanja_ROLES (role_idx,userid,role)  VALUES 
(hanja_role_idx_seq.nextval,'sh930922@gmail.com','ROLE_USER');
INSERT INTO hanja_ROLES (role_idx,userid,role)  VALUES 
(hanja_role_idx_seq.nextval,'sh930922@gmail.com','ROLE_MEMBER');
COMMIT;

select userid as username, password, use as enabled from hanja where userid='sh930922@gmail.com';
select userid as username, role from hanja_roles where userid='sh930922@gmail.com';


SELECT * FROM HANJA;
-- DROP TABLE HANJA;


-- userid : 사용자 아이디(이메일) ==> 이메일 인증
-- password : 사용자 비밀번호
-- name : 이름
-- nickname : 별명
-- hp : 휴대폰 번호
-- birth : 생년월일
-- gender : 성별
-- use  : 인증(0:인증전, 1:인증, 2:휴면)
-- lvl : 등급(1~10)
-- zipcode : 우편번호
-- addr1 : 주소1
-- addr2 : 주소2
-- regDate : 가입일


CREATE TABLE hanja(
	idx			NUMBER PRIMARY KEY NOT NULL,
	userid		varchar(50) NOT NULL,
	password	varchar(50) NOT NULL,
	name 		varchar(50) NOT NULL,
	nickname 	varchar(50) NOT NULL,
	hp			varchar(11) NOT NULL,
	birth 		varchar(20) ,
	gender 		varchar(20) NOT NULL,
	use 		NUMBER NOT NULL,
	lvl 		NUMBER NOT NULL,
	zipcode 	varchar(20) NOT NULL,
	addr1 		varchar(20) NOT NULL,
	addr2 		varchar(20) NOT NULL,
	regDate 	DATE
);

SELECT * FROM hanja;
-- DROP SEQUENCE hanja_role_idx_seq;
CREATE SEQUENCE hanja_role_idx_seq;
CREATE TABLE hanja_roles (
  role_idx NUMBER(11)  PRIMARY KEY,
  userid varchar2(45) NOT NULL,
  role varchar2(45) NOT NULL
);
SELECT * FROM hanja_ROLES;

SELECT * FROM tab;


-- DROP TABLE hanja;
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
SELECT * FROM hanjadata;


-- UPDATE hanjadata SET idx = ROWNUM;

-- {"n":1,"d":"8급","h":"九","m":"아홉","m1":"구","r":"乙 [새 을, 1획]","ld":"총2획","du":null},
CREATE TABLE dic(
	n NUMBER PRIMARY key,
	d   varchar2(100),
	h   varchar2(100),
	m   varchar2(100),
	m1  varchar2(100),
	r   varchar2(100),
	ld  varchar2(100),
	du  varchar2(100)
);
SELECT count(*) FROM dic;
SELECT * FROM DIC;
SELECT count(*) FROM HANJADATA;
SELECT * FROM HANJADATA;
SELECT * FROM HANJADATA WHERE IDX = 3;
SELECT * FROM HANJADATA WHERE d = '6급';
SELECT * FROM HANJADATA WHERE d = '8급' AND s = '74회';
SELECT d FROM HANJADATA GROUP BY d ORDER BY d desc;
SELECT s FROM HANJADATA GROUP BY s ORDER BY s;

