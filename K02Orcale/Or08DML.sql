/********************************
���ϸ� : Or08DML.sql
DML : Data Manipulation Language(������ ���۾�)
���� : ���ڵ带 �����Ҷ� ����ϴ� ������. �տ��� �н��ߴ�
     select���� ����Ͽ� update(���ڵ����), delete(���ڵ����),
     insert(���ڵ��Է�)�� �ִ�.
*********************************/     

--study�������� �ǽ��մϴ�. 

/*
���ڵ� �Է��ϱ� : insert��
    ���ڵ� �Է��� ���� ������ �������� �ݵ�� '�� ���ξ��Ѵ�. 
    �������� '���� �׳� ����. ���� �������� '�� ���θ� �ڵ�����
    ����ȯ�Ǿ� �Էµȴ�. 
*/

--�ǽ��� ���� ���̺� ����
create table tb_sample (
    deptNo number(10),      --�μ���ȣ
    deptName varchar2(20),  --�μ���
    deptLoc varchar2(15),   --����
    deptManager varchar2(30)--�޴����̸�
);
desc tb_sample;
--���1�� ���� ���ڵ� �Է�
insert into tb_sample (deptno, deptname, deptloc, deptmanager)
    values (10, '��ȹ��', '����', '����');
insert into tb_sample (deptno, deptname, deptloc, deptmanager)
    values (20, '������', '����', '����');
--���2
insert into tb_sample values (30, '������', '�뱸', '���');
insert into tb_sample values (40, '�λ���', '�λ�', '��ȿ');

select * from tb_sample;
commit;
/*
    ���ݱ����� �۾�(Ʈ�����)�� �״�� �����ϰڴٴ� �������
    Ŀ���� �������� ������ �ܺο����� ����� ���ڵ带 Ȯ���� �� ����. 
    ���⼭ ���ϴ� �ܺζ� Java/JSP�� ���� Oracle�̿��� ���α׷���
    ���Ѵ�. 
    �� Ʈ������̶� �۱ݰ� ���� �ϳ��� �����۾��� ���Ѵ�.
*/
--Ŀ������  ���ο� ���ڵ带 �����ϸ� �ӽ����̺� ����ȴ�. 
insert into tb_sample values (50, '������', '����', '���̸�');
--����Ŭ���� Ȯ���ϸ� ���� ���ԵȰ�ó�� ���δ�. ������ �ܺο����� Ȯ�ε��� �ʴ´�. 
select * from tb_sample;
--�ѹ� ������� ������ Ŀ�� ���·� �ǵ�����. 
rollback;
--�������� �Է��ߴ� 50�� ���ڵ�� �������. 
select * from tb_sample;
/*
    �ѹ� ����� ������ Ŀ�� ���·� �ǵ����ش�. 
    ��, commit�� ������ ���·δ� rollback�� �� ����.
*/

/*
���ڵ� �����ϱ� : update��
    ����] 
        update ���̺��
        set �÷�1=��1, �÷�2=��2, ....
        where ����;
    
    �������� ���°�� ��� ���ڵ尡 �Ѳ����� �����ȴ�. 
    �����̺�� �տ� from�� ���� �ʴ´�. 
*/
--�μ���ȣ 40�� ���ڵ��� ������ �̱����� �����Ͻÿ�.
update tb_sample set deptloc='�̱�' where deptno=40;
select * from tb_sample;

--������ ������ ���ڵ��� �޴������� '������'���� �����Ͻÿ�.
update tb_sample set deptmanager='������' where deptloc='����';
select * from tb_sample;

--where�� ���� ��� ���ڵ带 ������� ������ '���������'�� �����Ͻÿ�.
update tb_sample set deptloc='���������';
select * from tb_sample;

/*
������ �����ϱ� : delete�� 
    ����] 
         delete from ���̺�� where ����;
         �ط��ڵ带 �����ϹǷ� delete �ڿ� �÷��� ������� �ʴ´�.   
*/
--�μ���ȣ�� 10�� ���ڵ带 �����Ͻÿ�
delete from tb_sample where deptno=10;
select * from tb_sample;

--where�� ���� �����ϸ� ��� ���ڵ� ������(���ǿ��)
delete from tb_sample;
select * from tb_sample;

rollback;
select * from tb_sample;


update tb_sample set deptname='�ڽ���' where deptno>=30;
select * from tb_sample;
update tb_sample set deptno=deptno+1;
select * from tb_sample;

commit;


--------------- DML �� �� �� ��
--scott�������� �����մϴ�.
/*
1. DDL�� �������� 2������ ���� ��pr_emp�� ���̺� ������ ���� ���ڵ带 
�����Ͻÿ�. ��, ��¥�� sysdate�� �̿��ؼ� ���� ��¥�� �Է��Ͻÿ�.
*/
insert into pr_emp values (1, '���¿�', '��¹�', sysdate);
insert into pr_emp values (2, '������', '���л� �¹�', sysdate);
insert into pr_emp (eno, ename, job, regist_date) 
    values (3, '�Ѱ���', '� ����', sysdate);
insert into pr_emp (eno, ename, job, regist_date)
    values (4, '�����', '���л� ����', sysdate);
select * from pr_emp;  


/*
2. �� ���̺� ���� ���ǿ� �´� ���ڵ带 �����Ͻÿ�.
�̸� : ������
��å : ������
��ϳ�¥ : to_date�Լ��� �̿��ؼ� 7���� ��¥�� �Է��Ͻÿ�.
(���糯¥�� �������� 7������)
*/
insert into pr_emp values (5, '������', '������', to_date(sysdate-7,'yy/mm/dd'));
insert into pr_emp values (6, '�ƹ���', '�ƹ���', sysdate-7);
select * from pr_emp;


/*
3. eno�� ¦���� ���ڵ带 ã�Ƽ� job �÷��� ������ ������ ���� �����Ͻÿ�.
����¦�����ڵ塱 �� ���� ��ȣ�� ���ڿ��� �߰��Ѵ�.
*/
select * from pr_emp where mod(eno,2)=0;
update pr_emp
    set job=job||'(��¦�����ڵ�)'
    where mod(eno,2)=0;
select * from pr_emp;

/*
�� ���� ������ ������ 4~6�� ������ �����ϵ��� �Ѵ�.
��emp�� ���̺���  ��pr_employees�� ���̺�� �����ͱ��� �����Ѵ�.
���̺� �÷��� ũ�Ⱑ ������ �ȴٸ� alter����� 
�̿��Ͽ� ������ �����ϵ��� �Ѵ�.
*/
create table pr_employees
as
select * from emp where 1=1;--where���� ���� ������ �ָ� ��� ���ڵ带 �����Ѵ�.
select * from pr_employees;

/*
4. pr_employees ���̺��� 
�����ȣ 7900���� ������ �޴����� ���� ����� �μ���ȣ�� 
�̸��� FORD�� ����� �μ���ȣ�� ������Ʈ �Ͻÿ�.
*/
--�����ȣ 7900�� Ȯ��
select * from pr_employees where empno=7900;--��� : �޴������ 7698
--�޴����� 7698�� ����� Ȯ��
select * from pr_employees where mgr=7698;--��� : �μ���ȣ 30
--FORD�� �μ���ȣ Ȯ��
select * from pr_employees where ename='FORD';--��� : �μ���ȣ 20
--����������Ʈ
update pr_employees set deptno=20 where mgr=7698;


/*
5.  pr_employees ���̺��� �Ի����� 12���� ��� ������ �����Ͻÿ�.
*/
--�Ի���� 12���� ��� ��������
select * from pr_employees where to_char(hiredate, 'mm')=12;--��¥���� ���
select * from pr_employees where substr(hiredate,4,2)=12;--���ڿ��ڸ��� ���
select * from pr_employees where hiredate like '___12%';--like�� ���
--���ڵ����
delete from pr_employees where to_char(hiredate, 'mm')=12;


/*
6. pr_employees ���̺��� �Ի����ڰ� ���� ���� ������ ã�Ƽ� 
ename �÷��� ���������̸�(���Ի��)�� �� �ɼ� �ֵ��� ������Ʈ �Ͻÿ�. 
��) KING(���Ի��)
*/
select max(hiredate) from pr_employees;--���:82/01/23
select * from pr_employees where hiredate='82/01/23';--���:MILLER

update pr_employees set ename=concat(ename, '(���Ի��)')
where hiredate='82/01/23';--�÷��� ũ�Ⱑ �����Ͽ� �����߻���.

--�÷� Ȯ��
alter table pr_employees modify ename varchar2(60);

--�� ������Ʈ���� �����
update pr_employees set ename=concat(ename, '(���Ի��)')
where hiredate='82/01/23';
--������Ʈ Ȯ��
select * from pr_employees;


/*
DML�� -> ���ڵ带 �Է� �� �����ϴ� ������
    ���ڵ��Է� : insert into ���̺�� (�÷�) values (��)
    ���ڵ���� : update ���̺�� set �÷�=�� where ����
    ���ڵ���� : delete from ���̺�� where ����
    ���ڵ���ȸ : select �÷� from ���̺�� where ����
*/



