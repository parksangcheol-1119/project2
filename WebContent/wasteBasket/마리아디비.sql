CREATE DATABASE kosmo_db;

CREATE user 'kosmo_user'@'localhost' IDENTIFIED BY '1234';

GRANT ALL PRIVILEGES ON kosmo_db.* TO 'kosmo_user'@'localhost';
kosmo_db
FLUSH PRIVILEGES;

kosmo_dbkosmo_db
/*************
데이터 타입의 종류

	1. 숫자형

******************/

CREATE TABLE tb_int (
	idx INT PRIMARY KEY AUTO_INCREMENT,
	
	num1 TINYINT UNSINGNED NOT NULL,
	num2 SMALLINT NOT NULL,
	num3 MEDIUMINT DEFAULT '100',
	num4 BIGINT,
	
	fnum1 FLOAT(10,5) NOT NULL,
	fnum2 DOUBLE(20,10)
	);