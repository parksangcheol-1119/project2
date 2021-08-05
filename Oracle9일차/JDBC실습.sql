/*
Java에서 처음으로 JDBC프로그래밍 해보기
*/
--우선 system계정을 연결한 후 새로운 계정을 생성한다. 
create user kosmo identified by 1234;
grant connect, resource to kosmo;

--계정을 생성한 후 접속창에 kosmo 계정을 등록하고 해당 문서에 연결한다. 
--회원관리 테이블 : member 생성
create table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate,
    primary key(id)
);
--더미데이터 입력하기
insert into member (id, pass, name) values ('test', '1234', '테스트');
select * from member;
select to_char(regidate, 'yyyy-mm-dd hh24:mi:ss') "회원가입일" from member;
commit;

--게시판 테이블 생성하기
CREATE TABLE tb_bbs (
	num NUMBER NOT NULL ,
	title VARCHAR2(100) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	postdate DATE DEFAULT SYSDATE,
	id VARCHAR2(10) NOT NULL,
	PRIMARY KEY (num)
);

/*
퀴즈] 위에서 생성한 테이블에 외래키와 시퀀스를 설정하시오.
1. 외래키명 : bbs_mem_fk
tb_bbs테이블의 id 컬럼이 member 테이블의 id 컬럼을 참조하도록 외래키를 생성
2. 시퀀스명 : seq_bbs_num
tb_bbs테이블에 데이터를 입력시 num 컬럼이 자동증가 할수있도록 시퀀스를 생성
*/
--1.외래키생성
alter table tb_bbs add
    constraint bbs_mem_fk 
        foreign key (id) references member (id);
--1-1.데이터사전에서 확인
select * from user_constraints;
--2.시퀀스생성
create sequence seq_bbs_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
--2-1.시퀀스 확인
select seq_bbs_num.nextval from dual;


--레코드 삭제하기 : delete
delete from member where id='test3';
commit;

--레코드 수정하기 : update
update member set pass='9999', name='구길동', regidate=sysdate
    where id='test99';
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;

--레코드 입력하기 : insert
insert into member (id, pass, name) values ('test88', '8888', '테스트99');
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;
commit;
/*
    오라클에서 직접 insert을 한후 commit하지 않으면 외부에서는
    변경된 레코드를 확인할수 없으므로 실행에 오류가 발생하거나
    전혀 적용되지 않게된다. 처음 insert을 했을때에는 임시테이블에 
    저장되고, commit 후에 실제 테이블에 저장된다. 
*/

--like를 이용한 이름검색
select * from member where name like '%길동%';
select * from member where name like '%테%';


/*
파일 업로드 처리를 위한 테이블 생성
*/
drop table myfile;


create table myfile (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    cate varchar2(100),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate not null
    );
    
    /*
    ofile : Original File Name. 원본파일명을 저장함.
    sfile : Saved File Name. 서버에 저장된 파일명.
    */
    
    /*
    idx, name, title, cata, ofile, sfile, postdate
    */


create sequence seq_bbs_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;

commit;


create table mvcboard (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default sysdate not null,
    ofile varchar2(200),
    sfile varchar2(30),
    downcount number(5) default 0 not null,
    pass varchar2(50) not null,
    visitcount number default 0 not null
    );
    
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');    
    
    commit;
    
/*
Servlet을 제작하는 댓글 기능 추가를 위한 테이블 생성
*/


create table mycomment (
    idx number,
    board_idx number,
    name varchar2(30) not null,
    pass varchar2(30) not null,
    comments varchar2(2000) not null,
    postdate date default sysdate not null,
    
    constraint mycomment_pk primary key (idx),
    constraint mycomment_fk foreign key (board_idx)
        references mvcboard (idx)
    );    
    
    
    /*
    comments 컬럼의 경우 s를 제외한 comment로 생성하면 에러가 발생한다.
    예악어의 경우 컬럼명으로 사용할 수 없기 때문이다.
    */
    
    create table DEPT (
 DEPTNO varchar(50),
 DNAME varchar2(100),
 LOC varchar2(50),
 primary key(DEPTNO)
);

drop table DEPT;

insert into DEPT (DEPTNO, DNAME, LOC)
 values ('10', '기술부', '서울');

insert into DEPT (DEPTNO, DNAME, LOC)
 values ('20', '영업부', '서울');

insert into DEPT (DEPTNO, DNAME, LOC)
 values ('30', '지원부', '서울');


create table EMP (
EMPNO varchar(50),
DEPTNO varchar(50),
ENAME varchar2(100),
JOB varchar2(100),
SAL varchar2(50),
primary key(EMPNO)
);

drop table EMP;

insert into EMP(EMPNO, DEPTNO, ENAME, JOB, SAL)
 values ('1', '10', '이순신', '관리', '20000');
 
 delete from DEPT where DNAME='기술부';
 
 update DEPT set LOC='대전' where DEPTNO='20';
 
 select * from EMP where EMPNO='2';
 
 insert into EMP(EMPNO, DEPTNO, ENAME, JOB, SAL)
 values ('1', '10', '이순신', '관리', '20000');

insert into EMP(EMPNO, DEPTNO, ENAME, JOB, SAL)
 values ('2', '20', '홍길동', '영업', '30000');

insert into EMP(EMPNO, DEPTNO, ENAME, JOB, SAL)
 values ('3', '20', '심순애', '영업', '40000');
 
 /*
Java에서 처음으로 JDBC프로그래밍 해보기
*/
--우선 system계정을 연결한 후 새로운 계정을 생성한다. 
create user kosmo identified by 1234;
grant connect, resource to kosmo;

--계정을 생성한 후 접속창에 kosmo 계정을 등록하고 해당 문서에 연결한다. 
--회원관리 테이블 : member 생성
create table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate,
    primary key(id)
);
--더미데이터 입력하기
insert into member (id, pass, name) values ('test', '1234', '테스트');
select * from member;
select to_char(regidate, 'yyyy-mm-dd hh24:mi:ss') "회원가입일" from member;
commit;

--게시판 테이블 생성하기
CREATE TABLE tb_bbs (
	num NUMBER NOT NULL ,
	title VARCHAR2(100) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	postdate DATE DEFAULT SYSDATE,
	id VARCHAR2(10) NOT NULL,
	PRIMARY KEY (num)
);

/*
퀴즈] 위에서 생성한 테이블에 외래키와 시퀀스를 설정하시오.
1. 외래키명 : bbs_mem_fk
tb_bbs테이블의 id 컬럼이 member 테이블의 id 컬럼을 참조하도록 외래키를 생성
2. 시퀀스명 : seq_bbs_num
tb_bbs테이블에 데이터를 입력시 num 컬럼이 자동증가 할수있도록 시퀀스를 생성
*/
--1.외래키생성
alter table tb_bbs add
    constraint bbs_mem_fk 
        foreign key (id) references member (id);
--1-1.데이터사전에서 확인
select * from user_constraints;
--2.시퀀스생성
create sequence seq_bbs_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
--2-1.시퀀스 확인
select seq_bbs_num.nextval from dual;


--레코드 삭제하기 : delete
delete from member where id='test3';
commit;

--레코드 수정하기 : update
update member set pass='9999', name='구길동', regidate=sysdate
    where id='test99';
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;

--레코드 입력하기 : insert
insert into member (id, pass, name) values ('test88', '8888', '테스트99');
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;
commit;
/*
    오라클에서 직접 insert을 한후 commit하지 않으면 외부에서는
    변경된 레코드를 확인할수 없으므로 실행에 오류가 발생하거나
    전혀 적용되지 않게된다. 처음 insert을 했을때에는 임시테이블에 
    저장되고, commit 후에 실제 테이블에 저장된다. 
*/

--like를 이용한 이름검색
select * from member where name like '%길동%';
select * from member where name like '%테%';


/***
JSP에서 처음으로 JDBC프로그램 작성하기
***/
--회원인증을 통한 로그인 구현
--1.count() 그룹함수를 통해 쿼리문 작성
select count(*) from member where id='test' and pass='1234';--결과:1
select count(*) from member where id='abcd' and pass='9999';--결과:0

select * from member where id like '%te%';


--JSP : 모델1 방식의 회원제 게시판 제작하기
/*
연습문제] 테이블 정의서에서 작성한 board테이블을 생성하시오
    테이블을 생성한 후 member테이블과의 외래키도 지정하시오.
*/
create Table board (
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(30) not null, 
    postdate date default sysdate not null,
    visitcount number default 0 not null
);

--외래키 : 회원테이블의 id컬럼을 참조 (만일 테이블생성시 안했다면)
alter table board
    add constraint board_member_fk foreign key(id)
        references member (id);
        
--시퀀스 생성 :
create sequence seq_board_num
    increment by 1
    start with 1
    nomaxvalue
    nocycle
    nocache;
    
--시퀀스 확인
select seq_board_num.nextval from dual;

--더미데이터 입력하기
insert into member (id, pass, name) values ('kosmo','1234','코스모인');

--게시판 테이블
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'제목1입니다.','내용1입니다.','kosmo');
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'제목2입니다.','내용2입니다.','kosmo');
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'제목3입니다.','내용3입니다.','kosmo');
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'제목4입니다.','내용4입니다.','kosmo');
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'제목5입니다.','내용5입니다.','kosmo');
    
select * from member;
select * from board;

commit;


--회원제 게시판에서 목록보기(전체목록 or 검색)
--전체목록 가져오기(정렬은 항상 최신 게시물이 상단에 노출되도록 내림차순 사용)
select * from board order by num desc;
--제목으로 검색하기
select * from board where title like '%제목1%' order by num desc;
--내용으로 검색하기
select * from board where content like '%내용3%' order by num desc;
--게시물의 갯수 카운트하기
select count(*) from board;
--검색시 게시물의 갯수 카운트하기
select count(*) from board where title like '%제목99%';

--내용보기에서의 쿼리문
-- : member테이블과의 join을 통해 이름까지 출력한다. 
select num, title, content, Bo.id, postdate, visitcount, name
from board Bo inner join member Me
    on Bo.id=Me.id
where num=10;
/*
    board테이블은 전체 컬럼을 조회하고, member테이블에서는
    name만 가져온다. 이때 별칭.* 형태로 사용할 수 있다.
*/
select Bo.*, Me.name
from board Bo inner join member Me
    on Bo.id=Me.id;
/*
    using을 사용하는 경우에는 별칭을 사용할 수 없으므로
    컬럼을 명시하거나 *를 써야 한다. 
*/
select num, title, content, id, postdate, visitcount, name
from board inner join member
    using(id);

--게시물 내용보기 시 조회수 증가
update board
    set visitcount=visitcount+1
    where num=10;
select * from board where num=10;

--게시물 수정하기
update board 
    set title='13번게시물을 수정합니다.',content='수정되었나요?'
    where num=13;
select * from board;    
commit;


SELECT * FROM ( 	 SELECT Tb.*, ROWNUM rNum FROM ( 	    SELECT * FROM board      	ORDER BY num DESC     ) Tb  )  
WHERE rNum BETWEEN 6 AND 10;




/*
서블릿으로 제작하는 모델2 방식의 게시판
*/
create table mvcboard (
	idx number primary key, 
	name varchar2(50) not null, 
	title varchar2(200) not null, 
	content varchar2(2000) not null, 
	postdate date default sysdate not null, 
	ofile varchar2(200), -- 원본 파일명
	sfile varchar2(30), -- 서버에 저장된 파일명
	downcount number(5) default 0 not null, -- 다운로드 수
	pass varchar2(50) not null, -- 비밀번호(작성자 인증을 위해 사용)
	visitcount number default 0 not null
);
/*
idx, name, title, content, postdate, ofile, sfile, downcount, pass, visitcount
*/
--더미데이터 입력
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');

commit;

--파일 첨부형 게시판 페이지 별로 select 하기
SELECT * FROM ( 	 
    SELECT Tb.*, ROWNUM rNum FROM ( 	    
        SELECT * FROM mvcboard      	
        ORDER BY idx DESC) Tb  
    )  
--WHERE rNum BETWEEN 1 AND 3;
WHERE rNum BETWEEN 4 AND 6;


/*
Servlet으로 제작하는 댓글 기능추가를 위한 테이블 생성
*/
create table mycomment(	
	idx number, 
	board_idx number, 
	name varchar2(30) not null, 
	pass varchar2(30) not null, 
	comments varchar2(2000) not null, 
	postdate date default sysdate not null,
	
	constraint mycomment_pk primary key (idx),
	constraint mycomment_fk foreign key (board_idx) 
		references mvcboard (idx)
);
/*
comments 컬럼의 경우 s를 제외한 comment로 생성하면 에러가 발생한다. 
예약어의 경우 컬럼명으로 사용할 수 없기 때문이다. 
*/


/**
SQL Developer에서 대용량 데이터 import 하기
    -> 우편번호 csv 파일을 import
**/
--1. 우편번호 테이블 생성
create table zipcode(
    zipcode char(7),
    sido varchar2(10),
    gugun varchar2(50),
    dong varchar2(200),
    bunji varchar2(50),
    seq number 
);

--전국에 있는 시/도 확인하기
select * from zipcode;
select sido from zipcode group by sido;
select sido from zipcode group by sido order by sido asc;
select distinct sido from zipcode;
select distinct sido from zipcode order by sido asc;

--서울에 있는 구 확인하기
select distinct gugun from zipcode where sido='서울';
--경기
select distinct gugun from zipcode where sido='경기';


/*
Spring 게시판 제작1
    - JDBCTemplate 으로 구현
    - 비회원제 답변형(reply) 게시판
*/
create table springboard (
    idx number primary key, 
    name varchar2(30) not null,
    title varchar2(200) not null,
    contents varchar2(4000) not null,
    postdate date default sysdate,
    hits number default 0,
    bgroup number default 0,
    bstep number default 0,
    bindent number default 0,
    pass varchar2(30)
);
/*
답변형 게시판을 구현하기 위해 추가된 컬럼
    bgroup : 원본글에 대해 답변을 달게되면, 원본글의 일련번호(idx)를
        답변글의 그룹번호(bgroup)로 설정한다. 즉, 원본글과 답변글을
        하나의 그룹으로 묶어주는 기능을 한다. 
    bstep : 그룹화 된 게시물의 출력순서를 저장한다. 
        원본글은 1, 답변글은 2 와 같은 형태이다. 
    bindent : 답변글이 출력될때 들여쓰기 될 깊이를 저장한다. 
        답변글은 한칸 들여쓰기, 답변에 답변은 두칸 들여쓰기 
        되어야 한다. 
*/
--시퀀스 생성
create sequence springboard_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--더미데이터 입력(5~10개정도)   
/*
한 문장 내에서 시퀀스.nextval은 두번 이상 실행되더라도 항상
같은 시퀀스값을 반환한다. 답변형 게시판의 경우 원본글은 
일련번호와 그룹번호가 같은 값을 가져야 한다. 
*/
insert into springboard values (springboard_seq.nextval, '코스모1', 
    '스프링게시판 첫번째 입니다.','내용입니다', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '코스모2', 
    '스프링게시판 두번째 입니다.','내용입니다', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '코스모3', 
    '스프링게시판 세번째 입니다.','내용입니다', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '코스모4', 
    '스프링게시판 네번째 입니다.','내용입니다', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '코스모5', 
    '스프링게시판 다섯번째 입니다.','내용입니다', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
select * from springboard;    
commit;



select idx, name, bgroup, bstep, bindent 
from springboard where bgroup=7
order by bgroup desc, bstep asc;


delete from springboard where idx=13;
commit;

/*
Spring 게시판 제작2
    - Mybatis로 제작
    - 회원제 방명록(한줄게시판) 제작
*/
--테이블 생성
create table myboard (
    idx number primary key,
    id varchar2(30) not null,
    name varchar2(30) not null,
    contents varchar2(4000) not null
);
--시퀀스 생성
create sequence myboard_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--더미데이터 삽입
insert into myboard values (myboard_seq.nextval, 'kosmo', '코스모', 
    '방명록1 게시판입니다.');
insert into myboard values (myboard_seq.nextval, 'kosmo', '고스톱', 
    '방명록2 게시판입니다.');
insert into myboard values (myboard_seq.nextval, 'kosmo', '기즈모', 
    '방명록3 게시판입니다.');
insert into myboard values (myboard_seq.nextval, 'kosmo', '스모', 
    '방명록4 게시판입니다.');
commit;
select * from myboard;


SELECT * FROM (
    SELECT Tb.*, rownum rNum FROM (
        SELECT * FROM myboard 
        	
        ORDER BY idx DESC
    ) Tb
)
WHERE rNum>=1 AND rNum<=3;



/*****
트랜잭션 처리
    : 티켓 구매와 결제를 시도함
******/
--티켓 구매 금액을 입력하는 테이블
create table transaction_pay (
    customerId varchar2(30) not null,  
    amount number not null
);
--구매한 티켓의 갯수를 입력하는 테이블
create table transaction_ticket (
    customerId varchar2(30) not null,
    countNum  number(2) not null 
        check(countNum<=5)
);
--데이터 입력 테스트
--티켓 2장을 구매했다고 가정..
insert into transaction_ticket values ('kosmo', 2);--2장 구매
insert into transaction_pay values ('kosmo', 20000);--20000원 결제



/************
스프링 시큐리티 3단계 커스텀을 위한 테이블 생성
************/
create table security_admin (
    user_id varchar2(30) primary key,
    user_pw varchar2(30) not null,
    authority varchar2(20) default 'ROLE_USER', /* 사용자 권한 설정 */
    enabled number(1) default 1 /* 활성화 여부(0인경우 로그인 되지 않음) */
);
--더미데이터
insert into security_admin values ('kosmo_user1', '1234', 'ROLE_USER', 1);
insert into security_admin values ('kosmo_user2', '1234', 'ROLE_USER', 0);
insert into security_admin values ('kosmo_admin1', '1234', 'ROLE_ADMIN', 1);
insert into security_admin values ('kosmo_admin2', '1234', 'ROLE_ADMIN', 0);

commit;

/*
GeoLocation을 활용한 내위치기반 반경 검색하기
*/
--시설 전체 검색
select * from global_facility;
--각 시도에 해당하는 시설 검색
select count(*) from global_facility where hp_sido='서울';
select count(*) from global_facility where hp_sido='인천';
--서울 금천구의 시설 검색
select count(*) from global_facility where hp_sido='서울' and hp_gugun='금천구';
--각 시도별 시설 갯수 확인하기
select hp_sido, count(*) from global_facility group by hp_sido;
--서울에 있는 각 구별 시설물 갯수 확인하기
select hp_gugun, count(*) from global_facility where hp_sido='서울'
    group by hp_gugun 
    order by count(*) desc;

/*
radians 함수 생성
: 해당 함수는 각도 디그리(degree)를 라디안(radian)으로 변경해주는
매크로 함수이다. 삼각함수에서 주로 사용한다. 
*/
create or replace function radians(ndegrees in number) 
return number 
is
begin
	return ndegrees / 57.29577951308232087679815481410517033235;
end;
/


/*
거리를 측정하기 위한 함수 생성
: 나의 위/경도와 시설물의 위/경도를 인자로 전달하면 두 좌표간의
거리를 반환해준다. 
WGS84 좌표계는 군사적인 목적에서 전 지구를 하나의 좌표계로 표현할
목적으로 만들어지게 되었다. 
*/
create or replace function distnace_wgs84( 
	My_LAT in number, My_LNG in number, 
	Fa_LAT in number, Fa_LNG in number)
return number 
is
begin
	return ( 6371.0 * acos(cos( radians( My_LAT ) ) * cos( radians( Fa_LAT ) )
		* cos( radians( Fa_LNG  ) - radians( My_LNG ) )
		+ sin( radians( My_LAT ) ) * sin( radians( Fa_LAT ) ) )
	);
end ;
/

--가산디지털단지 맥날 : 37.480131, 126.881044
--사당역 : 37.476556, 126.981635
--가디와 사당역의 거리는 8.9km
select distnace_wgs84(37.480131, 126.881044, 37.476556, 126.981635) from dual;

--가산 맥날에서 시설까지의 거리 확인
select hp_name, hp_gugun, hp_addr,
    distnace_wgs84(37.480131, 126.881044, hp_latitude, hp_longitude) as disKm
from global_facility
where hp_sido='서울'
order by disKm asc;

--가산 맥날에서 반경 5km 내에 있는 시설물 검색
select hp_name, hp_gugun, 
    trunc(distnace_wgs84(37.480131, 126.881044, hp_latitude, hp_longitude),3) as disKm
from global_facility
where 
    trunc(distnace_wgs84(37.480131, 126.881044, hp_latitude, hp_longitude),3)<=5;

--조건에 맞는 레코드 검색후 페이지 처리
select * from (
    select Tb.*, rownum rNum from (
        select hp_name, hp_sido, hp_gugun, 
            trunc(to_number(distnace_wgs84(37.480131, 126.881044, 
                hp_latitude, hp_longitude)), 3) AS disKM
        from global_facility
        where 
            trunc(to_number(distnace_wgs84(37.480131, 126.881044, 
                hp_latitude, hp_longitude)), 3)<=3
        order by disKM asc
    ) Tb
)
where rNum between 101 and 200;






create index global_facility_index on global_facility (hp_latitude);
create index global_facility_index2 on global_facility (hp_longitude);
create index global_facility_index3 on global_facility (hp_name);
create index global_facility_index4 on global_facility (hp_sido);
create index global_facility_index5 on global_facility (hp_gugun);

drop index global_facility_index;
drop index global_facility_index2;
drop index global_facility_index3;
drop index global_facility_index4;
drop index global_facility_index5;





