/*
프로젝트를 위한 테이블 생성
*/


/*
회원가입 테이블
*/

create table member (
    id varchar(10) not null,
    pass varchar(10) not null,
    name varchar(30) not null,
    mengirl VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
	 email VARCHAR(50) NOT NULL,
	 address VARCHAR(200) NOT NULL,
    regidate DATETIME DEFAULT CURRENT_TIMESTAMP not null,
    primary KEY (id)
    );

/*
더미데이터 입력해보기
*/
INSERT INTO member (id, pass, NAME, mengirl, phone, email, address) VALUES
 ('test', '1234', '박상철', '남', '010-6385-4418', 'gmpark12@nate.com', '서울특별시 금천구 가산로3길 45 세교예지안8차 502호');


INSERT INTO member (id, pass, NAME, mengirl, phone, email, address) VALUES
 ('aqaq', '1234', '캔다방', '남', '010-6385-4418', 'gmpark12@nate.com', '서울특별시 금천구 가산로3길 45 세교예지안8차 502호');
/*
테이블 확인
*/
SELECT * FROM member;
/*
DROP TABLE member;
게시글 테이블 설정
*/

create table mvcboard (
	idx INT(11) AUTO_INCREMENT, 
	name varchar(50) not null, 
	title varchar(200) not null, 
	content varchar(2000) not null, 
	postdate DATETIME DEFAULT CURRENT_TIMESTAMP not null, 
	ofile varchar(200), -- 원본 파일명
	sfile varchar(30), -- 서버에 저장된 파일명
	downcount INT(5) default 0 not null, -- 다운로드 수
	pass varchar(50) not null, -- 비밀번호(작성자 인증을 위해 사용)
	visitcount INT DEFAULT 0 not NULL,
	primary KEY (idx)
);

INSERT INTO mvcboard (name, title, content, pass) VALUES
('박효신', '제목3입니다', '내용3입니다', '1234');

DROP TABLE member;


SELECT * FROM mvcboardmvcboard;

/*
아이디
이름
비밀번호
생년월일
주소
이메일
휴대폰번호
체크박스1
체크박스2
*/
CREATE TABLE member (
	id VARCHAR(100) not null,
	NAME VARCHAR(20) not null,
	pass VARCHAR(20) not null,
	birthday VARCHAR(100) not null,
	zipcode VARCHAR(50) not null,
	address1 VARCHAR(200) not null,
	address2 VARCHAR(200) not null,
	email VARCHAR(100) not null,
	email2 VARCHAR(80) not null,
	phone VARCHAR(100) not null,
	checkbox1 boolean,
	checkbox2 boolean,
 	regidate DATETIME DEFAULT CURRENT_TIMESTAMP not null,
	primary KEY (id)
	);
	
	DROP TABLE member;
	
	INSERT INTO member (id, NAME, pass, birthday, zipcode, address1, address2, email, email2, phone) VALUES
 ('test', '박상철', '1234', '1992-11-19', '111111', '서울특별시 금천구 가산동', '세교예지안 8차', 'gmpark12', 'nate.com', '010-6385-4418');
 
 SELECT * FROM member;
