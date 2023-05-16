SELECT * FROM user_tbl WHERE user_address = '서울' OR user_address = '경기';
SELECT * FROM user_tbl WHERE user_address IN ('서울','경기');

-- 서브쿼리 활용한 조회
-- 구매 내역이 있는 유저만 가져옴
SELECT * FROM user_tbl WHERE user_num IN (SELECT user_num FROM buy_tbl); 

SELECT * FROM user_tbl WHERE user_address LIKE '%남도';

SELECT * FROM user_tbl WHERE user_height BETWEEN 165 and 175;

SELECT * FROM user_tbl WHERE user_height >= 165 AND user_height <= 175;

INSERT INTO user_tbl VALUES(null,'박진영',1990,'제주',null,'2020-10-01'),
(null,'김혜정',1992,'강원',null,'2020-10-02'),
(null,'신지수',1993,'서울',null,'2020-10-05');

select * from user_tbl WHERE user_height is null;



