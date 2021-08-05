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







