--  트랜잭션은 2개이상의 각종 쿼리문의 실행을 되돌리거나 영구히 반영할때 사용합니다.
CREATE TABLE bank_acount(
	act_num INT(5) AUTO_INCREMENT PRIMARY KEY,
    act_owner VARCHAR(5) NOT NULL,
    balance INT(10) NOT NULL DEFAULT 0
);

DROP TABLE bank_acount;

SELECT * FROM bank_acount;

INSERT INTO bank_acount VALUES (null,'나구매',50000),(null,'가판매',0);

-- 트랜젝션 시작(ROLLBACK 수행 시 이 지점 이후의 내용을 전부 취소)
START TRANSACTION;

UPDATE bank_acount SET balance = (balance - 30000) WHERE act_owner = '나구매';
UPDATE bank_acount SET balance = (balance + 30000) WHERE act_owner = '가판매';

-- UPDATE 반영이전으로 돌아감
ROLLBACK;

START TRANSACTION;

UPDATE bank_acount SET balance = (balance - 25000) WHERE act_owner = '나구매';
UPDATE bank_acount SET balance = (balance + 25000) WHERE act_owner = '가판매';

COMMIT;
ROLLBACK;

-- SAVEPOINT는 ROLLBACK 해당 지점 전까지는 반영, 해당 지점 이후는 반영 안하는 경우 사용
START TRANSACTION;

UPDATE bank_acount SET balance = (balance - 3000) WHERE act_owner = '나구매';
UPDATE bank_acount SET balance = (balance + 3000) WHERE act_owner = '가판매';

SAVEPOINT first_txi; -- 저장지점 생성 (START TRANSACTION과 함께 사용해야한다

UPDATE bank_acount SET balance = (balance - 5000) WHERE act_owner = '나구매';
UPDATE bank_acount SET balance = (balance + 5000) WHERE act_owner = '가판매';

ROLLBACK TO first_txi;
SELECT * FROM bank_acount;
-- COMMIT, ROLLBACK 시 SAVEPOINT(STAR TRANSACTION)는 사라진다
