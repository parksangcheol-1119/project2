Microsoft Windows [Version 10.0.19041.867]
(c) 2020 Microsoft Corporation. All rights reserved.

C:\Users\kosmo_00>sqlplus

SQL*Plus: Release 11.2.0.2.0 Production on �� 4�� 7 09:46:01 2021

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: system
Enter password:

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> show user;
USER is "SYSTEM"
SQL> conn kosmo;
Enter password:
Connected.
SQL> show user;
USER is "KOSMO"
SQL> exit;
Disconnected from Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

C:\Users\kosmo_00>sqlplus

SQL*Plus: Release 11.2.0.2.0 Production on �� 4�� 7 11:46:26 2021

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: test_user1
Enter password:
ERROR:
ORA-01017: invalid username/password; logon denied


Enter user-name: test_user1
Enter password:

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL>
SQL>
SQL>
SQL>
SQL> create table tb(
  2  idx number
  3  );
create table tb(
*
ERROR at line 1:
ORA-01950: no privileges on tablespace 'SYSTEM'


SQL> create table tb(
  2  idx number
  3  );
create table tb(
*
ERROR at line 1:
ORA-01950: no privileges on tablespace 'SYSTEM'


SQL> create table tb(
  2  idx number
  3  );

Table created.

SQL> conn test_user2
Enter password:
ERROR:
ORA-01045: user TEST_USER2 lacks CREATE SESSION privilege; logon denied


Warning: You are no longer connected to ORACLE.
SQL> conn test_user2
Enter password:
Connected.
SQL> create table tb(
  2  idx number
  3  );
create table tb(
*
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> create table tb(
  2  idx number
  3  );
create table tb(
*
ERROR at line 1:
ORA-01950: no privileges on tablespace 'USERS'


SQL> create table tb(
  2  idx number
  3  );

Table created.

SQL> ed new_table

SQL> @new_table
  postdate date default sysdate
  *
ERROR at line 6:
ORA-00907: missing right parenthesis


SQL> ed new_table

SQL> @new_table

Table created.

SQL> desc tb_kosmo;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 IDX                                       NOT NULL NUMBER
 USER_ID                                   NOT NULL VARCHAR2(30)
 USER_PW                                   NOT NULL VARCHAR2(50)
 USER_NAME                                          VARCHAR2(50)
 POSTDATE                                           DATE

SQL> ed new_table

SQL> ed new_table2

SQL> exit
Disconnected from Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

C:\Users\kosmo_00>dir *.sql
 C ����̺��� �������� �̸��� �����ϴ�.
 ���� �Ϸ� ��ȣ: C2AE-FD8D

 C:\Users\kosmo_00 ���͸�

2020-12-22  ���� 11:08             2,139 hr����.sql
2020-10-23  ���� 09:50               183 kosmo_edit.sql
2021-04-07  ���� 12:37               186 new_table.sql
2021-04-07  ���� 12:38               169 new_table2.sql
               4�� ����               2,677 ����Ʈ
               0�� ���͸�  66,803,556,352 ����Ʈ ����

C:\Users\kosmo_00> ed new_table
'ed'��(��) ���� �Ǵ� �ܺ� ���, ������ �� �ִ� ���α׷�, �Ǵ�
��ġ ������ �ƴմϴ�.

C:\Users\kosmo_00>sqlplus

SQL*Plus: Release 11.2.0.2.0 Production on �� 4�� 7 12:46:29 2021

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: test_user2
Enter password:

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> ed new_table

SQL> @new_table
create sequence seq_kosmo
*
ERROR at line 1:
ORA-01031: insufficient privileges


ERROR:
ORA-01756: quoted string not properly terminated


SQL> @new_table
create sequence seq_kosmo
*
ERROR at line 1:
ORA-01031: insufficient privileges


ERROR:
ORA-01756: quoted string not properly terminated


SQL> @new_table
create sequence seq_kosmo
*
ERROR at line 1:
ORA-01031: insufficient privileges


ERROR:
ORA-01756: quoted string not properly terminated


SQL> exit
Disconnected from Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

C:\Users\kosmo_00>sqlplus

SQL*Plus: Release 11.2.0.2.0 Production on �� 4�� 7 13:01:03 2021

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: test_user2
Enter password:

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> ed new_table

SQL> @new_table

Sequence created.

ERROR:
ORA-01756: quoted string not properly terminated


SQL> ed new_table

SQL> select seq_kosmo.nextval from dual;

   NEXTVAL
----------
         1

SQL> select seq_kosmo.nextval from dual;

   NEXTVAL
----------
         2

SQL> select seq_kosmo.nextval from dual;

   NEXTVAL
----------
         3

SQL> select seq_kosmo.nextval from dual;

   NEXTVAL
----------
         4

SQL> select seq_kosmo.nextval from dual;

   NEXTVAL
----------
         5

SQL> insert into tb_kosmo values (seq_kosmo.nextval, 'gasan1','2222','3333',sysdate);

1 row created.

SQL> ed new_table

SQL> @new_table
create sequence seq_kosmo
                *
ERROR at line 1:
ORA-00955: name is already used by an existing object



1 row created.

SQL> ed new_table

SQL> @new_table
create sequence seq_kosmo
                *
ERROR at line 1:
ORA-00955: name is already used by an existing object



1 row created.

SQL> select * from tb_kosmo;

       IDX USER_ID
---------- ------------------------------------------------------------
USER_PW
--------------------------------------------------------------------------------
USER_NAME
--------------------------------------------------------------------------------
POSTDATE
--------
         6 gasan1
2222
3333
21/04/07


       IDX USER_ID
---------- ------------------------------------------------------------
USER_PW
--------------------------------------------------------------------------------
USER_NAME
--------------------------------------------------------------------------------
POSTDATE
--------
         7 gasan1
1111
digital
21/04/07


       IDX USER_ID
---------- ------------------------------------------------------------
USER_PW
--------------------------------------------------------------------------------
USER_NAME
--------------------------------------------------------------------------------
POSTDATE
--------
         8 gasan1
1111
digital
21/04/07


SQL> conn test_user3
Enter password:
Connected.
SQL> exit
Disconnected from Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

C:\Users\kosmo_00>sqlplus

SQL*Plus: Release 11.2.0.2.0 Production on �� 4�� 7 13:14:23 2021

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: test_user3
Enter password:
ERROR:
ORA-01045: user TEST_USER3 lacks CREATE SESSION privilege; logon denied


Enter user-name: test_user1
Enter password:
ERROR:
ORA-01045: user TEST_USER1 lacks CREATE SESSION privilege; logon denied


Enter user-name:
ERROR:
ORA-01017: invalid username/password; logon denied


SP2-0157: unable to CONNECT to ORACLE after 3 attempts, exiting SQL*Plus

C:\Users\kosmo_00>
C:\Users\kosmo_00>
C:\Users\kosmo_00>
C:\Users\kosmo_00>
C:\Users\kosmo_00>
C:\Users\kosmo_00>sqlplus

SQL*Plus: Release 11.2.0.2.0 Production on �� 4�� 7 16:33:51 2021

Copyright (c) 1982, 2014, Oracle.  All rights reserved.

Enter user-name: hr
Enter password:

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> set serveroutput on;
SQL> declare
  2  cnt number;
  3  begin
  4  cnt := 10;
  5  cnt := cnt + 1;
  6  dbms_output.put_line(cnt);
  7  end;
  8  /
11

PL/SQL procedure successfully completed.

SQL>