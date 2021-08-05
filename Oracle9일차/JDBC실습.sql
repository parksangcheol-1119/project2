/*
Java���� ó������ JDBC���α׷��� �غ���
*/
--�켱 system������ ������ �� ���ο� ������ �����Ѵ�. 
create user kosmo identified by 1234;
grant connect, resource to kosmo;

--������ ������ �� ����â�� kosmo ������ ����ϰ� �ش� ������ �����Ѵ�. 
--ȸ������ ���̺� : member ����
create table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate,
    primary key(id)
);
--���̵����� �Է��ϱ�
insert into member (id, pass, name) values ('test', '1234', '�׽�Ʈ');
select * from member;
select to_char(regidate, 'yyyy-mm-dd hh24:mi:ss') "ȸ��������" from member;
commit;

--�Խ��� ���̺� �����ϱ�
CREATE TABLE tb_bbs (
	num NUMBER NOT NULL ,
	title VARCHAR2(100) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	postdate DATE DEFAULT SYSDATE,
	id VARCHAR2(10) NOT NULL,
	PRIMARY KEY (num)
);

/*
����] ������ ������ ���̺� �ܷ�Ű�� �������� �����Ͻÿ�.
1. �ܷ�Ű�� : bbs_mem_fk
tb_bbs���̺��� id �÷��� member ���̺��� id �÷��� �����ϵ��� �ܷ�Ű�� ����
2. �������� : seq_bbs_num
tb_bbs���̺� �����͸� �Է½� num �÷��� �ڵ����� �Ҽ��ֵ��� �������� ����
*/
--1.�ܷ�Ű����
alter table tb_bbs add
    constraint bbs_mem_fk 
        foreign key (id) references member (id);
--1-1.�����ͻ������� Ȯ��
select * from user_constraints;
--2.����������
create sequence seq_bbs_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
--2-1.������ Ȯ��
select seq_bbs_num.nextval from dual;


--���ڵ� �����ϱ� : delete
delete from member where id='test3';
commit;

--���ڵ� �����ϱ� : update
update member set pass='9999', name='���浿', regidate=sysdate
    where id='test99';
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;

--���ڵ� �Է��ϱ� : insert
insert into member (id, pass, name) values ('test88', '8888', '�׽�Ʈ99');
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;
commit;
/*
    ����Ŭ���� ���� insert�� ���� commit���� ������ �ܺο�����
    ����� ���ڵ带 Ȯ���Ҽ� �����Ƿ� ���࿡ ������ �߻��ϰų�
    ���� ������� �ʰԵȴ�. ó�� insert�� ���������� �ӽ����̺� 
    ����ǰ�, commit �Ŀ� ���� ���̺� ����ȴ�. 
*/

--like�� �̿��� �̸��˻�
select * from member where name like '%�浿%';
select * from member where name like '%��%';


/*
���� ���ε� ó���� ���� ���̺� ����
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
    ofile : Original File Name. �������ϸ��� ������.
    sfile : Saved File Name. ������ ����� ���ϸ�.
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
    values (seq_board_num.nextval, '������', '�ڷ�� ����1 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '�庸��', '�ڷ�� ����2 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '�̼���', '�ڷ�� ����3 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������', '�ڷ�� ����4 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������', '�ڷ�� ����5 �Դϴ�.','����','1234');    
    
    commit;
    
/*
Servlet�� �����ϴ� ��� ��� �߰��� ���� ���̺� ����
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
    comments �÷��� ��� s�� ������ comment�� �����ϸ� ������ �߻��Ѵ�.
    ���Ǿ��� ��� �÷������� ����� �� ���� �����̴�.
    */
    
    create table DEPT (
 DEPTNO varchar(50),
 DNAME varchar2(100),
 LOC varchar2(50),
 primary key(DEPTNO)
);

drop table DEPT;

insert into DEPT (DEPTNO, DNAME, LOC)
 values ('10', '�����', '����');

insert into DEPT (DEPTNO, DNAME, LOC)
 values ('20', '������', '����');

insert into DEPT (DEPTNO, DNAME, LOC)
 values ('30', '������', '����');


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
 values ('1', '10', '�̼���', '����', '20000');
 
 delete from DEPT where DNAME='�����';
 
 update DEPT set LOC='����' where DEPTNO='20';
 
 select * from EMP where EMPNO='2';
 
 insert into EMP(EMPNO, DEPTNO, ENAME, JOB, SAL)
 values ('1', '10', '�̼���', '����', '20000');

insert into EMP(EMPNO, DEPTNO, ENAME, JOB, SAL)
 values ('2', '20', 'ȫ�浿', '����', '30000');

insert into EMP(EMPNO, DEPTNO, ENAME, JOB, SAL)
 values ('3', '20', '�ɼ���', '����', '40000');
 
 /*
Java���� ó������ JDBC���α׷��� �غ���
*/
--�켱 system������ ������ �� ���ο� ������ �����Ѵ�. 
create user kosmo identified by 1234;
grant connect, resource to kosmo;

--������ ������ �� ����â�� kosmo ������ ����ϰ� �ش� ������ �����Ѵ�. 
--ȸ������ ���̺� : member ����
create table member (
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate,
    primary key(id)
);
--���̵����� �Է��ϱ�
insert into member (id, pass, name) values ('test', '1234', '�׽�Ʈ');
select * from member;
select to_char(regidate, 'yyyy-mm-dd hh24:mi:ss') "ȸ��������" from member;
commit;

--�Խ��� ���̺� �����ϱ�
CREATE TABLE tb_bbs (
	num NUMBER NOT NULL ,
	title VARCHAR2(100) NOT NULL,
	content VARCHAR2(2000) NOT NULL,
	postdate DATE DEFAULT SYSDATE,
	id VARCHAR2(10) NOT NULL,
	PRIMARY KEY (num)
);

/*
����] ������ ������ ���̺� �ܷ�Ű�� �������� �����Ͻÿ�.
1. �ܷ�Ű�� : bbs_mem_fk
tb_bbs���̺��� id �÷��� member ���̺��� id �÷��� �����ϵ��� �ܷ�Ű�� ����
2. �������� : seq_bbs_num
tb_bbs���̺� �����͸� �Է½� num �÷��� �ڵ����� �Ҽ��ֵ��� �������� ����
*/
--1.�ܷ�Ű����
alter table tb_bbs add
    constraint bbs_mem_fk 
        foreign key (id) references member (id);
--1-1.�����ͻ������� Ȯ��
select * from user_constraints;
--2.����������
create sequence seq_bbs_num
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue 
    nocycle
    nocache;
--2-1.������ Ȯ��
select seq_bbs_num.nextval from dual;


--���ڵ� �����ϱ� : delete
delete from member where id='test3';
commit;

--���ڵ� �����ϱ� : update
update member set pass='9999', name='���浿', regidate=sysdate
    where id='test99';
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;

--���ڵ� �Է��ϱ� : insert
insert into member (id, pass, name) values ('test88', '8888', '�׽�Ʈ99');
select id, pass, name, to_char(regidate, 'yyyy-mm-dd hh:mi:ss') from member;
commit;
/*
    ����Ŭ���� ���� insert�� ���� commit���� ������ �ܺο�����
    ����� ���ڵ带 Ȯ���Ҽ� �����Ƿ� ���࿡ ������ �߻��ϰų�
    ���� ������� �ʰԵȴ�. ó�� insert�� ���������� �ӽ����̺� 
    ����ǰ�, commit �Ŀ� ���� ���̺� ����ȴ�. 
*/

--like�� �̿��� �̸��˻�
select * from member where name like '%�浿%';
select * from member where name like '%��%';


/***
JSP���� ó������ JDBC���α׷� �ۼ��ϱ�
***/
--ȸ�������� ���� �α��� ����
--1.count() �׷��Լ��� ���� ������ �ۼ�
select count(*) from member where id='test' and pass='1234';--���:1
select count(*) from member where id='abcd' and pass='9999';--���:0

select * from member where id like '%te%';


--JSP : ��1 ����� ȸ���� �Խ��� �����ϱ�
/*
��������] ���̺� ���Ǽ����� �ۼ��� board���̺��� �����Ͻÿ�
    ���̺��� ������ �� member���̺���� �ܷ�Ű�� �����Ͻÿ�.
*/
create Table board (
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(30) not null, 
    postdate date default sysdate not null,
    visitcount number default 0 not null
);

--�ܷ�Ű : ȸ�����̺��� id�÷��� ���� (���� ���̺������ ���ߴٸ�)
alter table board
    add constraint board_member_fk foreign key(id)
        references member (id);
        
--������ ���� :
create sequence seq_board_num
    increment by 1
    start with 1
    nomaxvalue
    nocycle
    nocache;
    
--������ Ȯ��
select seq_board_num.nextval from dual;

--���̵����� �Է��ϱ�
insert into member (id, pass, name) values ('kosmo','1234','�ڽ�����');

--�Խ��� ���̺�
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'����1�Դϴ�.','����1�Դϴ�.','kosmo');
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'����2�Դϴ�.','����2�Դϴ�.','kosmo');
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'����3�Դϴ�.','����3�Դϴ�.','kosmo');
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'����4�Դϴ�.','����4�Դϴ�.','kosmo');
insert into board (num, title, content, id)
    values (seq_board_num.nextval,'����5�Դϴ�.','����5�Դϴ�.','kosmo');
    
select * from member;
select * from board;

commit;


--ȸ���� �Խ��ǿ��� ��Ϻ���(��ü��� or �˻�)
--��ü��� ��������(������ �׻� �ֽ� �Խù��� ��ܿ� ����ǵ��� �������� ���)
select * from board order by num desc;
--�������� �˻��ϱ�
select * from board where title like '%����1%' order by num desc;
--�������� �˻��ϱ�
select * from board where content like '%����3%' order by num desc;
--�Խù��� ���� ī��Ʈ�ϱ�
select count(*) from board;
--�˻��� �Խù��� ���� ī��Ʈ�ϱ�
select count(*) from board where title like '%����99%';

--���뺸�⿡���� ������
-- : member���̺���� join�� ���� �̸����� ����Ѵ�. 
select num, title, content, Bo.id, postdate, visitcount, name
from board Bo inner join member Me
    on Bo.id=Me.id
where num=10;
/*
    board���̺��� ��ü �÷��� ��ȸ�ϰ�, member���̺�����
    name�� �����´�. �̶� ��Ī.* ���·� ����� �� �ִ�.
*/
select Bo.*, Me.name
from board Bo inner join member Me
    on Bo.id=Me.id;
/*
    using�� ����ϴ� ��쿡�� ��Ī�� ����� �� �����Ƿ�
    �÷��� ����ϰų� *�� ��� �Ѵ�. 
*/
select num, title, content, id, postdate, visitcount, name
from board inner join member
    using(id);

--�Խù� ���뺸�� �� ��ȸ�� ����
update board
    set visitcount=visitcount+1
    where num=10;
select * from board where num=10;

--�Խù� �����ϱ�
update board 
    set title='13���Խù��� �����մϴ�.',content='�����Ǿ�����?'
    where num=13;
select * from board;    
commit;


SELECT * FROM ( 	 SELECT Tb.*, ROWNUM rNum FROM ( 	    SELECT * FROM board      	ORDER BY num DESC     ) Tb  )  
WHERE rNum BETWEEN 6 AND 10;




/*
�������� �����ϴ� ��2 ����� �Խ���
*/
create table mvcboard (
	idx number primary key, 
	name varchar2(50) not null, 
	title varchar2(200) not null, 
	content varchar2(2000) not null, 
	postdate date default sysdate not null, 
	ofile varchar2(200), -- ���� ���ϸ�
	sfile varchar2(30), -- ������ ����� ���ϸ�
	downcount number(5) default 0 not null, -- �ٿ�ε� ��
	pass varchar2(50) not null, -- ��й�ȣ(�ۼ��� ������ ���� ���)
	visitcount number default 0 not null
);
/*
idx, name, title, content, postdate, ofile, sfile, downcount, pass, visitcount
*/
--���̵����� �Է�
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������', '�ڷ�� ����1 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '�庸��', '�ڷ�� ����2 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '�̼���', '�ڷ�� ����3 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������', '�ڷ�� ����4 �Դϴ�.','����','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '������', '�ڷ�� ����5 �Դϴ�.','����','1234');

commit;

--���� ÷���� �Խ��� ������ ���� select �ϱ�
SELECT * FROM ( 	 
    SELECT Tb.*, ROWNUM rNum FROM ( 	    
        SELECT * FROM mvcboard      	
        ORDER BY idx DESC) Tb  
    )  
--WHERE rNum BETWEEN 1 AND 3;
WHERE rNum BETWEEN 4 AND 6;


/*
Servlet���� �����ϴ� ��� ����߰��� ���� ���̺� ����
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
comments �÷��� ��� s�� ������ comment�� �����ϸ� ������ �߻��Ѵ�. 
������� ��� �÷������� ����� �� ���� �����̴�. 
*/


/**
SQL Developer���� ��뷮 ������ import �ϱ�
    -> �����ȣ csv ������ import
**/
--1. �����ȣ ���̺� ����
create table zipcode(
    zipcode char(7),
    sido varchar2(10),
    gugun varchar2(50),
    dong varchar2(200),
    bunji varchar2(50),
    seq number 
);

--������ �ִ� ��/�� Ȯ���ϱ�
select * from zipcode;
select sido from zipcode group by sido;
select sido from zipcode group by sido order by sido asc;
select distinct sido from zipcode;
select distinct sido from zipcode order by sido asc;

--���￡ �ִ� �� Ȯ���ϱ�
select distinct gugun from zipcode where sido='����';
--���
select distinct gugun from zipcode where sido='���';


/*
Spring �Խ��� ����1
    - JDBCTemplate ���� ����
    - ��ȸ���� �亯��(reply) �Խ���
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
�亯�� �Խ����� �����ϱ� ���� �߰��� �÷�
    bgroup : �����ۿ� ���� �亯�� �ްԵǸ�, �������� �Ϸù�ȣ(idx)��
        �亯���� �׷��ȣ(bgroup)�� �����Ѵ�. ��, �����۰� �亯����
        �ϳ��� �׷����� �����ִ� ����� �Ѵ�. 
    bstep : �׷�ȭ �� �Խù��� ��¼����� �����Ѵ�. 
        �������� 1, �亯���� 2 �� ���� �����̴�. 
    bindent : �亯���� ��µɶ� �鿩���� �� ���̸� �����Ѵ�. 
        �亯���� ��ĭ �鿩����, �亯�� �亯�� ��ĭ �鿩���� 
        �Ǿ�� �Ѵ�. 
*/
--������ ����
create sequence springboard_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--���̵����� �Է�(5~10������)   
/*
�� ���� ������ ������.nextval�� �ι� �̻� ����Ǵ��� �׻�
���� ���������� ��ȯ�Ѵ�. �亯�� �Խ����� ��� �������� 
�Ϸù�ȣ�� �׷��ȣ�� ���� ���� ������ �Ѵ�. 
*/
insert into springboard values (springboard_seq.nextval, '�ڽ���1', 
    '�������Խ��� ù��° �Դϴ�.','�����Դϴ�', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '�ڽ���2', 
    '�������Խ��� �ι�° �Դϴ�.','�����Դϴ�', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '�ڽ���3', 
    '�������Խ��� ����° �Դϴ�.','�����Դϴ�', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '�ڽ���4', 
    '�������Խ��� �׹�° �Դϴ�.','�����Դϴ�', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
insert into springboard values (springboard_seq.nextval, '�ڽ���5', 
    '�������Խ��� �ټ���° �Դϴ�.','�����Դϴ�', sysdate, 0, 
    springboard_seq.nextval, 0, 0, '1234');
select * from springboard;    
commit;



select idx, name, bgroup, bstep, bindent 
from springboard where bgroup=7
order by bgroup desc, bstep asc;


delete from springboard where idx=13;
commit;

/*
Spring �Խ��� ����2
    - Mybatis�� ����
    - ȸ���� ����(���ٰԽ���) ����
*/
--���̺� ����
create table myboard (
    idx number primary key,
    id varchar2(30) not null,
    name varchar2(30) not null,
    contents varchar2(4000) not null
);
--������ ����
create sequence myboard_seq
    increment by 1
    start with 1
    minvalue 1
    nomaxvalue
    nocycle
    nocache;
--���̵����� ����
insert into myboard values (myboard_seq.nextval, 'kosmo', '�ڽ���', 
    '����1 �Խ����Դϴ�.');
insert into myboard values (myboard_seq.nextval, 'kosmo', '����', 
    '����2 �Խ����Դϴ�.');
insert into myboard values (myboard_seq.nextval, 'kosmo', '�����', 
    '����3 �Խ����Դϴ�.');
insert into myboard values (myboard_seq.nextval, 'kosmo', '����', 
    '����4 �Խ����Դϴ�.');
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
Ʈ����� ó��
    : Ƽ�� ���ſ� ������ �õ���
******/
--Ƽ�� ���� �ݾ��� �Է��ϴ� ���̺�
create table transaction_pay (
    customerId varchar2(30) not null,  
    amount number not null
);
--������ Ƽ���� ������ �Է��ϴ� ���̺�
create table transaction_ticket (
    customerId varchar2(30) not null,
    countNum  number(2) not null 
        check(countNum<=5)
);
--������ �Է� �׽�Ʈ
--Ƽ�� 2���� �����ߴٰ� ����..
insert into transaction_ticket values ('kosmo', 2);--2�� ����
insert into transaction_pay values ('kosmo', 20000);--20000�� ����



/************
������ ��ť��Ƽ 3�ܰ� Ŀ������ ���� ���̺� ����
************/
create table security_admin (
    user_id varchar2(30) primary key,
    user_pw varchar2(30) not null,
    authority varchar2(20) default 'ROLE_USER', /* ����� ���� ���� */
    enabled number(1) default 1 /* Ȱ��ȭ ����(0�ΰ�� �α��� ���� ����) */
);
--���̵�����
insert into security_admin values ('kosmo_user1', '1234', 'ROLE_USER', 1);
insert into security_admin values ('kosmo_user2', '1234', 'ROLE_USER', 0);
insert into security_admin values ('kosmo_admin1', '1234', 'ROLE_ADMIN', 1);
insert into security_admin values ('kosmo_admin2', '1234', 'ROLE_ADMIN', 0);

commit;

/*
GeoLocation�� Ȱ���� ����ġ��� �ݰ� �˻��ϱ�
*/
--�ü� ��ü �˻�
select * from global_facility;
--�� �õ��� �ش��ϴ� �ü� �˻�
select count(*) from global_facility where hp_sido='����';
select count(*) from global_facility where hp_sido='��õ';
--���� ��õ���� �ü� �˻�
select count(*) from global_facility where hp_sido='����' and hp_gugun='��õ��';
--�� �õ��� �ü� ���� Ȯ���ϱ�
select hp_sido, count(*) from global_facility group by hp_sido;
--���￡ �ִ� �� ���� �ü��� ���� Ȯ���ϱ�
select hp_gugun, count(*) from global_facility where hp_sido='����'
    group by hp_gugun 
    order by count(*) desc;

/*
radians �Լ� ����
: �ش� �Լ��� ���� ��׸�(degree)�� ����(radian)���� �������ִ�
��ũ�� �Լ��̴�. �ﰢ�Լ����� �ַ� ����Ѵ�. 
*/
create or replace function radians(ndegrees in number) 
return number 
is
begin
	return ndegrees / 57.29577951308232087679815481410517033235;
end;
/


/*
�Ÿ��� �����ϱ� ���� �Լ� ����
: ���� ��/�浵�� �ü����� ��/�浵�� ���ڷ� �����ϸ� �� ��ǥ����
�Ÿ��� ��ȯ���ش�. 
WGS84 ��ǥ��� �������� �������� �� ������ �ϳ��� ��ǥ��� ǥ����
�������� ��������� �Ǿ���. 
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

--��������д��� �Ƴ� : 37.480131, 126.881044
--��翪 : 37.476556, 126.981635
--����� ��翪�� �Ÿ��� 8.9km
select distnace_wgs84(37.480131, 126.881044, 37.476556, 126.981635) from dual;

--���� �Ƴ����� �ü������� �Ÿ� Ȯ��
select hp_name, hp_gugun, hp_addr,
    distnace_wgs84(37.480131, 126.881044, hp_latitude, hp_longitude) as disKm
from global_facility
where hp_sido='����'
order by disKm asc;

--���� �Ƴ����� �ݰ� 5km ���� �ִ� �ü��� �˻�
select hp_name, hp_gugun, 
    trunc(distnace_wgs84(37.480131, 126.881044, hp_latitude, hp_longitude),3) as disKm
from global_facility
where 
    trunc(distnace_wgs84(37.480131, 126.881044, hp_latitude, hp_longitude),3)<=5;

--���ǿ� �´� ���ڵ� �˻��� ������ ó��
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





