--SQL활용 평가 사전교육

--system계정 연결 후 새로운 계정 test 계정을 생성한다.
create user test identified by 1234;

--test계정에 접속권한, 테이블생성 권한 등 기본 권한을 부여..
grant connect, resource to test;

--test계정의 비밀번호를 4321로 변경하고싶다면

alter user test identified by 4321;

--cmd 창에서 확인법
--sqlplus test/4321

--test계정에 부여한 권한중 접속 권한을 회수하시오
revoke connect from test;

--test계정에 접속 권한을 다시 부여
grant connect to test;

--test계정으로 연결한 후 진행한다.
--developer에서 계정을 추가한 뒤 해당 문서에 test계정을 연결..


--테이블 정의서 : 회원제 게시판, 회원관리(Model1방식)을 보고 테이블을 생성하시오
create table member(
id varchar2(10) not null,
pass varchar2(10) not null,
name varchar2(30) not null,
regidate date default sysdate,
primary Key(id)
);

drop table member;

create table board (
    num number primary Key,
    title varchar2(200) not null,
    content varchar2(200) not null,
    id varchar2(200) not null,
    postdate date default sysdate not null,
    visitcount number(6) 
);

alter table board
    add constraint board_member_fk foreign key (id)
    references member (id);

--board 테이블의 구조를 확인
desc board;
desc member;

--현재 계정에 생성된 테이블의 목록을 확인할 수 있는 데이터 사전

select * from tab;

--제약조건을 확인할 수 있는 데이터 사전 
select * from user_constraints;
select * from user_cons_columns;

--위에서 생성한 테이블에 레코드를 삽입, 삭제, 수정할 수 있는 DML문을 작성
--member테이블에 test1 / 9876 / 테스터1 / 현재시간과 같은 데이터 삽입

insert into member (id, pass, name, regidate)
    values ('test1', '9876', '테스터1', sysdate);
    
--아이디가 test1인 레코드의 비밀번호를  9999로 변경하시오

update member set pass='9999' where id='test1';

/*
회원 테이브르이 검색속도를 높여주기 위해 name컬럼에 인덱스 제약조건을
추가하시오
*/

create index mem_name_idx on member(name);

/*
board테이블에 레코드를 삽입
*/

insert into board (num, title, content, id, visitcount)
    values (1, '제목1', '내용1', 'kosmo', 0);--삽입 불가
    
insert into board (num, title, content, id, visitcount)
    values (1, '제목1', '내용1', 'test1', 0);--삽입 가능
    
insert into board (num, title, content, id, visitcount)
    values (2, '제목2', '내용2', 'test1', 0);--삽입 가능 
insert into board (num, title, content, id, visitcount)
    values (3, '제목3', '내용3', 'test1', 0);--삽입 가능


--board 테이블에 레코드는 모두 몇개?
select count(*) from board;

--test1이 작성한 게시물 전체를 조회할 수 있는 DML문을 작성하시오.
--단 게시물과 함께 이름도 같이 조회해야 합니다.

select
    num, title, content, visitcount, name, regidate
from member inner join board
    on board.id=member.id
where id='test1';

--위의 쿼리문을 별칭을 이용해서 수정하시오.
select
    num, title, content, visitcount, name, regidate
from member M inner join board B
    on B.id=M.id
where B.id='test1';

select * from tab;
--------------------------------------------
--SQL활용 평가 문제
--1.사용자명 ENGINEER 비밀번호가 1234인 사용자를 생성하시오.

create user ENGINEER identified by 1234;

--2.1번에서 생성한 사용자에게 오라클에 접속할 수 있는 역할, 
--테이블을 생성할 수 있는역할, 
--뷰를 생성할 수 있는 권한을 부여하시오.
grant connect, resource, create view to ENGINEER;

--3.ENGINEER의 비밀번호를 ENG1234로 변경하시오.

alter user ENGINEER identified by ENG1234;

--cmd 창에서 확인법
--sqlplus test/4321

--4.ENGINEER계정에 부여한 권한중 접속 권한을 회수하시오
revoke create view resource form ENGINEER;



--test계정으로 연결한 후 진행한다.
--developer에서 계정을 추가한 뒤 해당 문서에 test계정을 연결..


--5.테이블 정의서 :  테이블을 생성하시오

create table PRODUCT(
P_CODE char(5) not null,
P_NAME nvarchar2(50) not null,
P_PRICE number not null,
P_QTY number default 0,
primary Key(P_CODE)
);

drop table PRODUCT;
-------------------------------------------
create table WAREHOUSING (
    W_NO number not null,
    P_CODE char(5),
    W_DATE date default sysdate,
    W_ATY number,
    W_PRICE number, 
    primary Key (W_NO)
);
-------------------------------------------
drop table WAREHOUSING;

create table SALES (
S_NO number not null,
P_CODE char(5),
S_DATE date default sysdate,
S_QTY number,
S_PRICE number,
primary Key (S_NO)
);



alter table PRODUCT
    add constraint PRODUCT_PK foreign key(P_CODE)
    references WAREHOUSING(P_CODE);


--6.NGINEER 테이블의 구조를 확인
desc ENGINEER;

--7.NGINEER 테이블의 구조를 확인
desc PRODUCT;

--현재 계정에 생성된 테이블의 목록을 확인할 수 있는 데이터 사전

select * from tab;

--8.제약조건을 확인할 수 있는 데이터 사전 
select * from ENGINEER_constraints;
select * from ENGINEER_table_columns;

--위에서 생성한 테이블에 레코드를 삽입, 삭제, 수정할 수 있는 DML문을 작성
--9.더미데이터 입력

insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_001', '상품1', 10000, 10);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_002', '상품2', 20000, 20);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_003', '상품3', 30000, 30);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_004', '상품4', 40000, 40);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_005', '상품5', 50000, 50);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_006', '상품6', 60000, 60);
    
insert into WAREHOUSING (W_NO, P_CODE, W_DATE, W_PRICE, W_ATY)
    values ('1', 'P_001', sysdate, 10, 9000);    
insert into WAREHOUSING (W_NO, P_CODE, W_DATE, W_PRICE, W_ATY)
    values ('2', 'P_004', sysdate, 40, 39000);    
insert into WAREHOUSING (W_NO, P_CODE, W_DATE, W_PRICE, W_ATY)
    values ('3', 'P_006', sysdate, 60, 59000);
    
insert into SALES (S_NO, P_CODE, S_DATE, S_PRICE, S_QTY)
    values ('1', 'P_001', sysdate, 5, 11000);   
insert into SALES (S_NO, P_CODE, S_DATE, S_PRICE, S_QTY)
    values ('2', 'P_002', sysdate, 10, 21000); 
 insert into SALES (S_NO, P_CODE, S_DATE, S_PRICE, S_QTY)
    values ('3', 'P_004', sysdate, 5, 41000);
 

--10.9번에서 입력한 데이터 중 상품코드가 P_003인 상품의 상품명, 소비자가격, 
--상품수량을 각각 PRODUCT3, 15000, 15로 수정하시오.

--레코드 수정하기 : update
update PRODUCT set P_NAME='PRODUCT3', P_PRICE='15', P_QTY='15000'
    where P_CODE='P_003';


--11.9번에서 입력한 데이터중  상품코드가 P_003인 상품을 삭제하시오.
delete from PRODUCT where P_CODE='P_003';

--[문항12] 위의 9번, 10번 및 11번의 DML문이 정상적으로 실제테이블에 반영되도록 하기 위한 명령어는 무엇인가? 그리고 전체상품정보를 출력하는 DML문을 작성하시오.
commit;

desc PRODUCT;

--13
--키값에 사용하면 좋을거 같습니다 ex)일련번호

--14
create index idx on WAREHOUSING(P_CODE);

--15
drop index idx;

--16.상품(PRODUCT)테이블의 모든 상품의 소비자가격 총합을 구하는 SELECT문을 작성하시오.

select av(P_PRICE*P_QTY)
from PRODUCT;

/*
select abs(salary) "급여의절대값" from employees;
(P_CODE, P_NAME, P_PRICE, P_QTY)

board테이블에 레코드를 삽입
*/
desc PRODUCT;
insert into board (num, title, content, id, visitcount)
    values (1, '제목1', '내용1', 'kosmo', 0);--삽입 불가
    
insert into board (num, title, content, id, visitcount)
    values (1, '제목1', '내용1', 'test1', 0);--삽입 가능
    
insert into board (num, title, content, id, visitcount)
    values (2, '제목2', '내용2', 'test1', 0);--삽입 가능 
insert into board (num, title, content, id, visitcount)
    values (3, '제목3', '내용3', 'test1', 0);--삽입 가능


--board 테이블에 레코드는 모두 몇개?
select count(*) from PRODUCT;

--test1이 작성한 게시물 전체를 조회할 수 있는 DML문을 작성하시오.
--단 게시물과 함께 이름도 같이 조회해야 합니다.

select
    num, title, content, visitcount, name, regidate
from member inner join board
    on board.id=member.id
where id='test1';

--위의 쿼리문을 별칭을 이용해서 수정하시오.
select
    num, title, content, visitcount, name, regidate
from member M inner join board B
    on B.id=M.id
where B.id='test1';
