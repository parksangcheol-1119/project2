/******************
���ϸ� : Or10SubQuery.sql
��������
���� : �������ȿ� �� �ٸ� �������� ���� ������ select��
*******************/

/*
������ ��������
    ����]
        select * from ���̺�� where �÷�=(
            select �÷� from ���̺�� where ����
        );
    �� ��ȣ���� ���������� �ݵ�� �ϳ��� ����� �����ؾ� �Ѵ�. 
*/
/*
�ó�����] ������̺��� ��ü����� ��ձ޿����� ���� �޿��� �޴� ������� 
�����Ͽ� ����Ͻÿ�.
    ����׸� : �����ȣ, �̸�, �̸���, ����ó, �޿�
*/
select employee_id, first_name, email, salary
from employees
where salary < round(avg(salary));/*
     �ش� �������� ���ƻ� �´µ��ϳ� �׷��Լ��� �����࿡
     ������ �߸��� ���������� ������ �߻��Ѵ�. 
*/
--1�ܰ� : ��ձ޿��� �������� ���Ѵ�. 
select round(avg(salary)) from employees;
--2�ܰ� : 6462���� ���� �޿��� �޴� ������ �����Ѵ�. 
select * from employees where salary<6462;
--3�ܰ� : 2���� ������ �ϳ��� �������������� ��ģ��. 
select * from employees where 
    salary<(select round(avg(salary)) from employees);

/*
�ó�����] ��ü ����� �޿��� �������� ����� �̸��� �޿��� ����ϴ� 
������������ �ۼ��Ͻÿ�.
����׸� : �̸�1, �̸�2, �̸���, �޿�
*/
select * from employees where salary<min(salary);--�����߻���.

--1�ܰ� : �ּұ޿��� ã�´�.
select min(salary) from employees;
--2�ܰ� : 2100�޷��� �޿��� �޴� ����� �����Ѵ�. 
select * from employees where salary=2100;
--3�ܰ� : ������ ����
select * from employees where 
    salary=(select min(salary) from employees);

/*
�ó�����] ��ձ޿����� ���� �޿��� �޴� ������� ����� ��ȸ�Ҽ� �ִ� 
������������ �ۼ��Ͻÿ�.
��³��� : �̸�1, �̸�2, ��������, �޿�
�� ���������� jobs ���̺� �����Ƿ� join�ؾ� �Ѵ�. 
*/
--1�ܰ� : ��ձ޿� ���ϱ�
select trunc(avg(salary),2) from employees;
--2�ܰ� : 6461.83���� �޿��� ���� ����� ����
select * from employees where salary>=6461.83;
--3�ܰ� : jobs ���̺�� ������ �Ǵ�.
select
    first_name, last_name, job_title
from employees inner join jobs using(job_id)
where salary>=6461.83;
--4�ܰ� : ���������� ����
select
    first_name, last_name, job_title
from employees inner join jobs using(job_id)
where salary>=(select trunc(avg(salary),2) from employees);


/*
������ ��������
    ����]
        select * from ���̺�� where �÷� in (
            select �÷� from ���̺�� where ����
        );
    �� ��ȣ���� ���������� 2�� �̻��� ����� �����ؾ� �Ѵ�.
*/
/*
�ó�����] ���������� ���� ���� �޿��� �޴� ����� ����� ��ȸ�Ͻÿ�.
    ��¸�� : ������̵�, �̸�, ���������̵�, �޿� 
*/
--1.������̺��� �ܼ� ������ ���� ������ ��׿����� Ȯ��
select job_id, salary from employees
order by job_id, salary desc;
--2.1������ Ȯ���� ���ڵ带 group by���� �׷�ȭ�Ͽ� �� ������
--  �ִ�޿��� Ȯ���Ѵ�. 
select 
    job_id, max(salary)
from employees
group by job_id;
--3.2���� ����� ������� �ܼ� ������ �ۼ�
select
    employee_id, first_name, job_id, salary
from employees
where 
    (job_id='IT_PROG' and salary=9000) or
    (job_id='AC_MGR' and salary=12008) or
    (job_id='AC_ACCOUNT' and salary=8300) or
    (job_id='ST_MAN' and salary=8200) or
    (job_id='PU_MAN' and salary=11000);/*
        2������ ����� 19���� ����� �ܼ������� �ۼ��ϸ� 
        ���Ͱ��� or�����ڸ� ���� �����Ҽ� �ִ�. ������
        ����� ���ٸ� �ۼ��� �Ұ����Ұ��̴�. 
    */
--4. 3�� �������� ���������� �����Ѵ�. �������̹Ƿ� in�� ����Ѵ�. 
select
    employee_id, first_name, job_id, salary
from employees
where 
    (job_id, salary) in (
        select 
            job_id, max(salary)
        from employees
        group by job_id
    );

/*
�����࿬����2 : any
    ���������� �������� ���������� �˻������ �ϳ��̻�
    ��ġ�ϸ� ���� �Ǵ� ������. �� ���� �ϳ��� �����ϸ�
    �ش� ���ڵ带 �����´�. 
*/
/*
�ó�����] ��ü����߿��� �μ���ȣ�� 20�� ������� �޿����� ���� �޿��� �޴� �������� 
�����ϴ� ������������ �ۼ��Ͻÿ�. 
*/
--1.20���μ��� �޿��� Ȯ��
select * from employees where department_id=20;
--2.1�� ����� �ܼ� ������ ������...
select * from employees where salary>=13000 or salary>=6000;
--3.2�� ����� ���������� �ۼ��Ѵ�. �̶� any�� ����Ѵ�. 
select first_name, last_name, department_id, salary 
    from employees where 
    salary>=any(select salary from employees where department_id=20);/*
        ������ ������ any�� ����ϸ� 2�������� or�������� �������
        �����ϰԵȴ�. 6000 �Ǵ� 13000 �̻��� ���ڵ常 ����ȴ�. 
    */


/*
�����࿬����3 : all
    : ���������� �������� ���������� �˻������ ��� ��ġ�ؾ�
    ���̵ȴ�. 
*/
select first_name, last_name, department_id, salary 
    from employees where 
    salary>=all(select salary from employees where department_id=20);/*
        6000���ٵ� ũ��, 13000���ٵ� Ŀ���ϹǷ� ��������� 13000 �̻���
        ���ڵ常 �����ϰԵȴ�. 
    */


/*
Top���� : ��ȸ�� ������� ������ ���� ���ڵ带 �����ö� ����Ѵ�. 
    �ַ� �Խ����� ����¡�� ���ȴ�. 
    
    rownum : ���̺��� ���ڵ带 ��ȸ�� ������� ������ �ο��Ǵ�
        ������ �÷��� ���Ѵ�. �ش� �÷��� ��� ���̺� �����Ѵ�. 
*/
select * from employees;
select employee_id, first_name, rownum from employees;
select employee_id, first_name, rownum from employees order by first_name;
select employee_id, first_name, rownum from (
    select * from employees order by first_name
);


/*
������̺��� ������ ������ ���� �������� ���� ����������
*/
select * from
    (select Tb.*, rownum rNum from (
        select * from employees order by employee_id desc
    ) Tb)
--where rNum between 1 and 10;    
where rNum between 11 and 20;    
/*
    between�� ������ ���Ͱ��� �������ָ� �ش� �������� ���ڵ常
    �������Եȴ�. ���� ������ ���� JSP���� �������� ������ �����Ͽ�
    ����ؼ� �����ϰԵȴ�. 
    
    3.2���� ��� ��ü�� �����ͼ�...
        (2.1���� ����� rownum�� ���������� �ο��� (
             1.������̺��� ��� ���ڵ带 �������� �����ؼ� ����
        ) Tb)
    �ʿ��� �κ��� rownum���� ������ ���� �����Ѵ�.
*/
    




--------------------------------------------------------
--------------- Sub Query �� �� �� �� ------------------ 
--------------------------------------------------------

/*
01.�����ȣ�� 7782�� ����� ��� ������ ���� ����� ǥ���Ͻÿ�.
��� : ����̸�, ��� ����
*/
select job from emp where empno=7782; --MANAGER
select ename, job from emp where job='MANAGER';
select ename, job from emp where job=(select job from emp where empno=7782);


/*
02.�����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ���Ͻÿ�.
��� : ����̸�, �޿�, ������
*/
select * from emp where empno=7499; --1600
select * from emp where sal>1600;
select ename, sal, job from emp where sal>(select sal from emp where empno=7499);



/*
03.�ּ� �޿��� �޴� �����ȣ, �̸�, ��� ���� �� �޿��� ǥ���Ͻÿ�.
(�׷��Լ� ���)
*/
--�ּұ޿� Ȯ��
select min(sal) from emp;--Ȯ�� : 800
select * from emp where sal=800;--800�� �޴� ����Ȯ��
--���������� ����
select empno, ename, job, sal from emp 
    where sal=(select min(sal) from emp);


/*
04.��� �޿��� ���� ���� ����(job)�� ��� �޿��� ǥ���Ͻÿ�.
*/
--������̺� ��ü�� ��ȸ
select * from emp;
select * from emp group by job;/*�����߻�. 
            group by�� �׷�ȭ�� �����Ϳ��� �׷��Լ��� 
            ���� ��� �̿��� ���� ����� �ָ��ϹǷ�
            ������ �߻��ϰԵȴ�. 
*/
--�������� �׷�ȭ �Ͽ� ������ ��ձ޿��� ��ȸ
select job, round(avg(sal)) from emp group by job;
--�����߻���(ORA-00937: not a single-group group function)
select job, min(round(avg(sal))) from emp group by job;
--select������ job�� �������� ����
select min(round(avg(sal))) from emp group by job;
/*
    ��ձ޿��� ���������� �����ϴ� �÷��� �ƴϹǷ�
    where������ ����Ҽ����� having���� ����ؾ��Ѵ�. 
    ��, ��ձ޿��� 1017�� ������ ����ϴ� ������� 
    ���������� �ۼ��Ѵ�. 
*/
select job, round(avg(sal)) 
    from emp group by job
    having round(avg(sal))=(select min(round(avg(sal))) 
                            from emp group by job);




/*
05.���μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
*/
select deptno, sal from emp order by deptno, sal;
select deptno, min(sal) from emp group by deptno;
select ename, sal, deptno from emp where (deptno, sal) in (
                                            select deptno, min(sal) 
                                            from emp group by deptno);



/*
06.��� ������ �м���(ANALYST)�� ������� �޿��� �����鼭 
������ �м���(ANALYST)�� �ƴ� ������� ǥ��(�����ȣ, �̸�, ������, �޿�)�Ͻÿ�.
*/
select * from emp where job='ANALYST';--3000
select * from emp where sal<3000 and job<>'ANALYST';

select empno, ename, job, sal from emp 
where sal<all(select sal from emp where job='ANALYST') and job<>'ANALYST';


/*
07.���������� ���� ����� �̸��� ǥ���Ͻÿ�.
*/
--�����ڰ� �ƴ� ����� �̾ƾ� ��

--�������� ����� �ߺ��� �����ؼ� ����
select distinct mgr from emp where mgr is not null;
--�������� ����� �ƴ� ������� ����
select * from emp where empno not in (select distinct mgr from emp where mgr is not null);


/*
08.���������� �ִ� ����� �̸��� ǥ���Ͻÿ�
*/
select * from emp where empno in (select distinct mgr from emp where mgr is not null);


/*
09.BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�
(��. BLAKE�� ����).
*/

select * from emp where ename='BLAKE';--30
select * from emp where deptno=30;

select ename, hiredate from emp 
    where deptno=(select deptno from emp where ename='BLAKE') and ename<>'BLAKE';


/*
10.�޿��� ��� �޿� ���� ���� ������� �����ȣ�� �̸�, �޿��� ǥ���ϵ� 
����� �޿��� ���ؼ� ������������ ���� �Ͻÿ�.
*/
select avg(sal) from emp ; --2077.08
select empno, ename, sal from emp where sal>(select avg(sal) from emp) order by sal asc;




/*
11.�̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� 
�����ȣ�� �̸�, �μ���ȣ�� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�
*/
select * from emp where ename like '%K%';-- �μ���ȣ Ȯ�� : 10, 30
select * from emp where deptno=10 or deptno=30;-- or�� ���ǰɱ�
select * from emp where deptno in (10, 30);-- in���� ���ǰɱ�
/*
    or������ in���� ������ �� �����Ƿ�, ������������ ������
    ���꿡 in�� ����Ѵ�. 2���̻��� ����� or�� �����Ͽ�
    ����ϴ� ȿ���� ������. 
*/
select empno, ename, deptno from emp where deptno in 
    (select deptno from emp where ename like '%K%');



/*
12.�μ� ��ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� ��� ������ ǥ���Ͻÿ�.
*/

select * from dept where loc='DALLAS';
select ename, deptno, job from emp where deptno=(select deptno from dept where loc='DALLAS');





/*
13.KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.
*/
--�޴����� KING�� ����� ����ϸ� �ȴ�. 
select empno from emp where ename='KING'; --KING�ǻ����ȣ:7839
select * from emp where mgr=7839;--�޴��� ���̵� 7839�� ���� ���
select ename, to_char(sal, '999,000') from emp 
    where mgr=(select empno from emp where ename='KING');


/*
14.RESEARCH �μ��� ����� ���� �μ���ȣ ����̸� �� ��� ������ ǥ���Ͻÿ�.
*/

select deptno from dept where dname='RESEARCH';
select deptno, ename, job from emp where deptno=(select deptno from dept where dname='RESEARCH');




/*
15.��� �޿� ���� ���� �޿��� �ް� 
�̸��� K�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� 
����� �����ȣ, �̸�, �޿��� ǥ���Ͻÿ�.
*/
--��ձ޿�
select round(avg(sal)) from emp; --���:2077
--�̸��� K�� ���Ե� ���
select * from emp where ename like '%K%';--���:10, 30
--�޿��� 2077�̻��̰�, �μ���ȣ 10,30�� ������
select * from emp 
    where sal>2077 
    and deptno in (10, 30);
--���������� �ۼ�    
select * from emp 
    where sal>(select round(avg(sal)) from emp)
    and deptno in (select deptno from emp where ename like '%K%');



/*
16.��� �޿��� ���� ���� ������ ã���ÿ�.
*/

select job, avg(sal) from emp group by job;
select min(avg(sal)) from emp group by job;

select job, round(avg(sal)) from emp 
group by job 
having avg(sal)=(select min(avg(sal)) from emp group by job);




/*
17.��� ������ MANAGER�� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ���Ͻÿ�.
*/
select * from emp where job='MANAGER';
select deptno from emp where job='MANAGER';
select * from emp where deptno in (select deptno from emp where job='MANAGER');

 









