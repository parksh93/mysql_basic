/* 실행은 ctrl + enter
DEFAULT CHARATER SET UTF8; 붙여주면 한글서정*/
create database bitcamp06 default character set UTF8;

/* 데이터베이스 조회는 좌측하단 schemas 클릭후 -> 새로고침한 다음, 생성 확인 후 우클릭 -> set as default schema
선택 시 볼드처리 */
/* 해당 DB에 접근할 수 있는 사용자 계정 생성 user 아이디 identified by 비밀번호*/
CREATE USER 'adminid' IDENTIFIED BY '2023502';

/* 사용자에게 권한 부여 GRANT 주고싶은 기능1, 주고싶은 기능2 ...
만약 모든 권한을 주고 싶다면 ALL PRIVILEGES(모든권한) TO 부여받은 계정*/
GRANT ALL PRIVILEGES ON bitcamp06.* to 'adminid';

/* 테이블 생성 명령*/
CREATE TABLE users(
	u_number INT(3) PRIMARY KEY,
	u_id VARCHAR(20) UNIQUE NOT NULL,
    u_name VARCHAR(30) NOT NULL,
    email VARCHAR(80)
);


/*INSERT INTO 테이블명(컬럼) VALUES (값)*/
INSERT INTO users(u_number, u_id, u_name, email) VALUES(1,'abc1234','가나다',NULL);
INSERT INTO users VALUES(2,'abc5678','마바사','abc@naver.com');
INSERT INTO users VALUES(3,'avs2345','박큐엘','asd@gmail.com');


/*데이터 조회*/
SELECT * FROM users;
SELECT u_id, u_name FROM users;
SElECT EMAIL, u_number, u_id FROM users;


/*계정 추가*/
-- select 권한만
CREATE USER 'adminid02' IDENTIFIED BY '2023502';
GRANT SELECT ON bitcamp06.* to 'adminid02';

DELETE FROM users where u_number = 2;

-- 컬럼 추가
ALTER TABLE users ADD (u_address varchar(30));

-- 컬럼 삭제
ALTER TABLE users DROP COLUMN email; 
-- ALTER TABLE users DROP email; 

-- 컬럼명 변경
ALTER TABLE users change u_n  u_name varchar(20);

-- 제약 조건 추가
ALTER TABLE users ADD CONSTRAINT u_address_unique UNIQUE (u_address);

INSERT INTO users VALUES(7,'abc5345','사자','서울특별시 강남구');

INSERT INTO users VALUES(8,'abc5122','하마','서울특별시 강남구');
ALTER TABLE users DROP CONSTRAINT u_address_unique;

-- 테이블명 변경
RENAME TABLE users to members;

-- truncate : 테이블 내부 데이터 삭제
TRUNCATE TABLE members;
SELECT * FROM members;

-- 테이블 삭제
DROP TABLE members;