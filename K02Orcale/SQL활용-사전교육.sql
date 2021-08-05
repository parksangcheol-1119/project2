--SQLȰ�� �� ��������

--system���� ���� �� ���ο� ���� test ������ �����Ѵ�.
create user test identified by 1234;

--test������ ���ӱ���, ���̺���� ���� �� �⺻ ������ �ο�..
grant connect, resource to test;

--test������ ��й�ȣ�� 4321�� �����ϰ�ʹٸ�

alter user test identified by 4321;

--cmd â���� Ȯ�ι�
--sqlplus test/4321

--test������ �ο��� ������ ���� ������ ȸ���Ͻÿ�
revoke connect from test;

--test������ ���� ������ �ٽ� �ο�
grant connect to test;

--test�������� ������ �� �����Ѵ�.
--developer���� ������ �߰��� �� �ش� ������ test������ ����..


--���̺� ���Ǽ� : ȸ���� �Խ���, ȸ������(Model1���)�� ���� ���̺��� �����Ͻÿ�
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

--board ���̺��� ������ Ȯ��
desc board;
desc member;

--���� ������ ������ ���̺��� ����� Ȯ���� �� �ִ� ������ ����

select * from tab;

--���������� Ȯ���� �� �ִ� ������ ���� 
select * from user_constraints;
select * from user_cons_columns;

--������ ������ ���̺� ���ڵ带 ����, ����, ������ �� �ִ� DML���� �ۼ�
--member���̺� test1 / 9876 / �׽���1 / ����ð��� ���� ������ ����

insert into member (id, pass, name, regidate)
    values ('test1', '9876', '�׽���1', sysdate);
    
--���̵� test1�� ���ڵ��� ��й�ȣ��  9999�� �����Ͻÿ�

update member set pass='9999' where id='test1';

/*
ȸ�� ���̺긣�� �˻��ӵ��� �����ֱ� ���� name�÷��� �ε��� ����������
�߰��Ͻÿ�
*/

create index mem_name_idx on member(name);

/*
board���̺� ���ڵ带 ����
*/

insert into board (num, title, content, id, visitcount)
    values (1, '����1', '����1', 'kosmo', 0);--���� �Ұ�
    
insert into board (num, title, content, id, visitcount)
    values (1, '����1', '����1', 'test1', 0);--���� ����
    
insert into board (num, title, content, id, visitcount)
    values (2, '����2', '����2', 'test1', 0);--���� ���� 
insert into board (num, title, content, id, visitcount)
    values (3, '����3', '����3', 'test1', 0);--���� ����


--board ���̺� ���ڵ�� ��� �?
select count(*) from board;

--test1�� �ۼ��� �Խù� ��ü�� ��ȸ�� �� �ִ� DML���� �ۼ��Ͻÿ�.
--�� �Խù��� �Բ� �̸��� ���� ��ȸ�ؾ� �մϴ�.

select
    num, title, content, visitcount, name, regidate
from member inner join board
    on board.id=member.id
where id='test1';

--���� �������� ��Ī�� �̿��ؼ� �����Ͻÿ�.
select
    num, title, content, visitcount, name, regidate
from member M inner join board B
    on B.id=M.id
where B.id='test1';

select * from tab;
--------------------------------------------
--SQLȰ�� �� ����
--1.����ڸ� ENGINEER ��й�ȣ�� 1234�� ����ڸ� �����Ͻÿ�.

create user ENGINEER identified by 1234;

--2.1������ ������ ����ڿ��� ����Ŭ�� ������ �� �ִ� ����, 
--���̺��� ������ �� �ִ¿���, 
--�並 ������ �� �ִ� ������ �ο��Ͻÿ�.
grant connect, resource, create view to ENGINEER;

--3.ENGINEER�� ��й�ȣ�� ENG1234�� �����Ͻÿ�.

alter user ENGINEER identified by ENG1234;

--cmd â���� Ȯ�ι�
--sqlplus test/4321

--4.ENGINEER������ �ο��� ������ ���� ������ ȸ���Ͻÿ�
revoke create view resource form ENGINEER;



--test�������� ������ �� �����Ѵ�.
--developer���� ������ �߰��� �� �ش� ������ test������ ����..


--5.���̺� ���Ǽ� :  ���̺��� �����Ͻÿ�

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


--6.NGINEER ���̺��� ������ Ȯ��
desc ENGINEER;

--7.NGINEER ���̺��� ������ Ȯ��
desc PRODUCT;

--���� ������ ������ ���̺��� ����� Ȯ���� �� �ִ� ������ ����

select * from tab;

--8.���������� Ȯ���� �� �ִ� ������ ���� 
select * from ENGINEER_constraints;
select * from ENGINEER_table_columns;

--������ ������ ���̺� ���ڵ带 ����, ����, ������ �� �ִ� DML���� �ۼ�
--9.���̵����� �Է�

insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_001', '��ǰ1', 10000, 10);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_002', '��ǰ2', 20000, 20);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_003', '��ǰ3', 30000, 30);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_004', '��ǰ4', 40000, 40);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_005', '��ǰ5', 50000, 50);
insert into PRODUCT (P_CODE, P_NAME, P_PRICE, P_QTY)
    values ('P_006', '��ǰ6', 60000, 60);
    
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
 

--10.9������ �Է��� ������ �� ��ǰ�ڵ尡 P_003�� ��ǰ�� ��ǰ��, �Һ��ڰ���, 
--��ǰ������ ���� PRODUCT3, 15000, 15�� �����Ͻÿ�.

--���ڵ� �����ϱ� : update
update PRODUCT set P_NAME='PRODUCT3', P_PRICE='15', P_QTY='15000'
    where P_CODE='P_003';


--11.9������ �Է��� ��������  ��ǰ�ڵ尡 P_003�� ��ǰ�� �����Ͻÿ�.
delete from PRODUCT where P_CODE='P_003';

--[����12] ���� 9��, 10�� �� 11���� DML���� ���������� �������̺� �ݿ��ǵ��� �ϱ� ���� ��ɾ�� �����ΰ�? �׸��� ��ü��ǰ������ ����ϴ� DML���� �ۼ��Ͻÿ�.
commit;

desc PRODUCT;

--13
--Ű���� ����ϸ� ������ �����ϴ� ex)�Ϸù�ȣ

--14
create index idx on WAREHOUSING(P_CODE);

--15
drop index idx;

--16.��ǰ(PRODUCT)���̺��� ��� ��ǰ�� �Һ��ڰ��� ������ ���ϴ� SELECT���� �ۼ��Ͻÿ�.

select av(P_PRICE*P_QTY)
from PRODUCT;

/*
select abs(salary) "�޿������밪" from employees;
(P_CODE, P_NAME, P_PRICE, P_QTY)

board���̺� ���ڵ带 ����
*/
desc PRODUCT;
insert into board (num, title, content, id, visitcount)
    values (1, '����1', '����1', 'kosmo', 0);--���� �Ұ�
    
insert into board (num, title, content, id, visitcount)
    values (1, '����1', '����1', 'test1', 0);--���� ����
    
insert into board (num, title, content, id, visitcount)
    values (2, '����2', '����2', 'test1', 0);--���� ���� 
insert into board (num, title, content, id, visitcount)
    values (3, '����3', '����3', 'test1', 0);--���� ����


--board ���̺� ���ڵ�� ��� �?
select count(*) from PRODUCT;

--test1�� �ۼ��� �Խù� ��ü�� ��ȸ�� �� �ִ� DML���� �ۼ��Ͻÿ�.
--�� �Խù��� �Բ� �̸��� ���� ��ȸ�ؾ� �մϴ�.

select
    num, title, content, visitcount, name, regidate
from member inner join board
    on board.id=member.id
where id='test1';

--���� �������� ��Ī�� �̿��ؼ� �����Ͻÿ�.
select
    num, title, content, visitcount, name, regidate
from member M inner join board B
    on B.id=M.id
where B.id='test1';
