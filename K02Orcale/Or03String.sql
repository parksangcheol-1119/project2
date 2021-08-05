/***************
���ϸ� : Or03String.sql
���ڿ� ó���Լ�
���� : ���ڿ��� ���� ��ҹ��ڸ� ��ȯ�ϰų� ���ڿ��� ���̸� ��ȯ�ϴ� �� ���ڿ���
    �����ϴ� �Լ�
***************/


/*
concat(���ڿ�1, ���ڿ�2)
    : ���ڿ� 1�� 2�� ���� �����ؼ� ����ϴ� �Լ�
    ����1 : concat('���ڿ�1', '���ڿ�2')
    ����2 : '���ڿ�1' || '���ڿ�2'
*/
select concat('Good ', 'morning') AS "��ħ�λ�" from dual;
select 'Oracle'||' 11g'||' Good' from dual;
-- => ���� SQL ���� concat()���� �����ϸ�...
    select concat(concat('Oracle', ' 11g'), ' Good') from dual;

/*
initcap(���ڿ�)
    : ���ڿ��� ù���ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ�. 
    ��, ù���ڸ� �ν��ϴ� ������ ������ ����. 
    -���鹮�� ������ ������ ù���ڸ� �빮�ڷ� ��ȯ�Ѵ�. 
    -���ĺ��� ���ڸ� ������ ������ ���� ������ ������
        ù��° ���ڸ� �빮�ڷ� ��ȯ�Ѵ�. 
*/
select initcap('hi hello �ȳ�') from dual;
select initcap('good/bad morning') from dual;
select initcap('never6say*good��bye') from dual;

--������̺��� john �� ã�Ƽ� �����Ͻÿ�
select first_name, last_name from employees
    where first_name='john';--�������
select first_name, last_name from employees
    where first_name='John';--3������
select first_name, last_name from employees
    where first_name=initcap('john');--3������


/*
��ҹ��ں���
lower() : �ҹ��ڷ� ������
upper() : �빮�ڷ� ������
*/
select lower('GOOD'), upper('bad') from dual;
--�������� ���� john�� �˻��Ϸ���...
select * from employees where lower(first_name)='john';
select * from employees where upper(first_name)='JOHN';
--�÷��� ����� ���� �빮�� Ȥ�� �ҹ��ڷ� ������ �� �������� �˻��Ѵ�.


/*
lpad(), rpad()
    : ���ڿ��� ����, �����ʿ� Ư���� ��ȣ�� ä�ﶧ ����ϴ� �Լ�
    ����] lpad('���ڿ�', '��ü�ڸ���', 'ä�﹮�ڿ�')
        ->  ��ü�ڸ������� ���ڿ��� ���̸�ŭ�� ������ ������
        �����κ��� �־��� ���ڿ��� ä���ִ� �Լ�.
        rpad()�� �������� ä����.
*/
select
    'good', 
    lpad('good', 7, '#'),
    rpad('good', 7, '#'),
    lpad('good', 7),
    rpad('good', 7)
from dual;

/*
trim() : ������ �����Ҷ� ����ϴ� �Լ�
    ����] trim([leading | trailing | both] �����ҹ��� from �÷�)
        - leading : ���ʿ��� ������
        - trailing : �����ʿ��� ������
        - both : ���ʿ��� ������. �������� ������ both�� ����Ʈ��.
        [����1] ���ʳ��� ���ڸ� ���ŵǰ�, �߰��� �ִ� ���ڴ� ���ŵ��� ����.
        [����2] '����'�� �����Ҽ��ְ�, '���ڿ�'�� �����Ҽ� ����. �����߻���
*/
select
    ' ���������׽�Ʈ ' as trim1,
    trim(' ���������׽�Ʈ ') as trim2,
    trim('��' from '�ٶ��㰡 ������ ž�ϴ�') as trim3,
    trim(both '��' from '�ٶ��㰡 ������ ž�ϴ�') as trim4,
    trim(leading '��' from '�ٶ��㰡 ������ ž�ϴ�') as trim5,
    trim(trailing '��' from '�ٶ��㰡 ������ ž�ϴ�') as trim6,
    trim(both '��' from '�ٶ��㰡 �ٸ����� ������ ž�ϴ�') as trim7
from dual;
--trim7 : �߰��� '��'�� ���ŵ��� �ʴ´�.
--�ɼ��� ���°�� both�� ����Ʈ�̹Ƿ� trim3, trim4�� ������ ����� ���´�.

/*
�Ʒ� ������ �������� �߻���. trim()�� ���ڸ� �����Ҽ� �ִ�. ���� 
���ڿ��� �����ϰ� �ʹٸ� replace() �Լ��� ����ؾ��Ѵ�. 
*/
select
    trim(both '�ٶ���' from '�ٶ��㰡 �ٸ����� ������ ž�ϴ�') as trimError
from dual;

/*
ltrim(), rtrim() -> L[eft]TRIM, R[ight]TRIM
    : ����, ���� '����' Ȥ�� '���ڿ�'�� �����Ҷ� ����Ѵ�.
    �� TRIM�� ���ڿ��� ������ �� ������, LTRIM�� RTRIM�� ���ڿ����� 
    ������ �� �ִ�.
*/
select
    ltrim(' ������������ ') ltrim1,
    ltrim('�������ڿ�����', '����') ltrim2,
    rtrim('�������ڿ�����', '����') ltrim3,
    rtrim('�������ڿ�����', '���ڿ�') ltrim4
from dual;--ltrim4ó�� �߰��� �ִ� ���ڿ��� ���ŵ��� �ʴ´�.

/*
substr() : ���ڿ����� �����ε������� ���̸�ŭ �߶� ���ڿ��� ����Ѵ�. 
    ����] substr(�÷�, �����ε���, ����)
    
    ����1) ����Ŭ�� �ε����� 1���� �����Ѵ�. (0���;ƴ�)
    ����2) '����'�� �ش��ϴ� ���ڰ� ������ ���ڿ��� �������� �ǹ��Ѵ�.
    ����3) �����ε����� ������ ���������� �·� �ε����� �����Ѵ�. 
*/
select substr('good morning john', 8, 4) from dual;--rnin
select substr('good morning john', 8) from dual;--rning john
--�ε��� 2���� �߶�. �ѱ��̹Ƿ� �������� ����� ���� �ٸ�.
select substr('�ȳ��ϼ���', 2) from dual;--���ϼ���

/*
substrb() : ����Ʈ(byte)������ �߶󳽴�. 
    ��������� �ѱ۰� ���� �����ڵ�� �ѱ��ڿ� 3byte�� ǥ���ǳ�
    ���ݽ� ��߳��� ��찡 ����Ƿ� �׽�Ʈ�� �ʿ��ϴ�. 
*/
select substrb('�ȳ��ϼ���', 1) from dual;
select substrb('�ȳ��ϼ���', 2) from dual;
select substrb('�ȳ��ϼ���', 3) from dual;
select substrb('�ȳ��ϼ���', 4) from dual;
select substrb('�ȳ��ϼ���', 5) from dual;
select substrb('�ȳ��ϼ���', 6) from dual;
select substrb('�ȳ��ϼ���', 7) from dual;
select substrb('�ȳ��ϼ���', 8) from dual;


/*
replace() : ���ڿ��� �ٸ� ���ڿ��� ��ü�Ҷ� ����Ѵ�. 
    ����] replace(�÷��� or ���ڿ�, '������ ����� ����', '������ ����')

     ��trim(), ltrim(), rtrim()�޼ҵ��� ����� replace()�޼ҵ� �ϳ��� ��ü�Ҽ� 
    �����Ƿ� trim()�� ���� replace()�� �ξ� �� ���󵵰� ����.
*/
select replace('good morning tom', 'morning', 'evening') as "���ڿ���ü"
from dual;
select replace('good morning tom', 'morning ', '') as "���ڿ�����"
from dual;

--trim�� �¿����� ������ ���ŵǳ�, �߰��� ������ ���ŵ��� �ʴ´�.
select trim(' blank1 blank2 ') as "��������1" from dual;
--replace�� �¿��� �Ӹ� �ƴ϶� �߰��� ���鵵 �����Ҽ� �ִ�.
select replace(' blank1 blank2 ', ' ', '') as "��������2" from dual;
    

/*
instr() : �ش� ���ڿ����� Ư�����ڰ� ��ġ�� �ε������� ��ȯ�Ѵ�. 
    ����1] instr(�÷���, 'ã������')
        => ���ڿ��� ó������ ���ڸ� ã�´�. 
    ����2] instr(�÷���, 'ã������', 'Ž���� ������ �ε���', '���°����')
        => Ž���� �ε������� ���ڸ� ã�´�. ��, ã�� ������ ���°�� 
        �ִ� �������� ������ �� �ִ�. 
*/
--n�� �߰ߵ� ù��° �ε��� ��ȯ
select instr('good morning john', 'n') from dual;--9
--n�� �߰ߵ� �ι�° �ε��� ��ȯ
select instr('good morning john', 'n', 1, 2) from dual;--11
--10��° �ε������� Ž���� �����Ͽ� n�� �߰ߵ� 2��° �ε��� ��ȯ
select instr('good morning john', 'n', 10, 2) from dual;--17












