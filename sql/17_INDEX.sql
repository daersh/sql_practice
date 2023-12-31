-- ------------------------			INDEX			------------------------ --

-- INDEX가 ㄱ달려있는 애들로 조회하는게 좋음

-- 테이블 생성
CREATE TABLE phone (
    phone_code INT PRIMARY KEY,
    phone_name VARCHAR(100),
    phone_price DECIMAL(10, 2)
);
-- 값 입력
INSERT 
  INTO phone (phone_code , phone_name , phone_price )
VALUES 
(1, 'galaxyS23', 1200000),
(2, 'iPhone14pro', 1433000),
(3, 'galaxyZfold3', 1730000);
SELECT * FROM phone;

-- EXPLAIN으로 쿼리 실행 계획 확인
SELECT * FROM phone WHERE phone_name = 'galaxyS23';
EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

-- 인덱스 제거
ALTER TABLE phone DROP INDEX idx_name;

-- 인덱스 생성
CREATE INDEX idx_name ON phone (phone_name);
	-- ALTER TABLE phone ADD INDEX idx_name(phone_name); -- 또는 이걸로 해도 됨
EXPLAIN SELECT * FROM phone WHERE phone_name = 'galaxyS23';

-- 복합 인덱스
-- 2개 이상 컬럼을 하나의 인덱스로 설정하여 생성 가능
CREATE INDEX idx_name_price ON phone (phone_name, phone_price);
SHOW INDEX FROM phone;

SELECT * FROM phone WHERE phone_name = 'iPhone14pro';
EXPLAIN SELECT * FROM phone WHERE phone_name = 'iPhone14pro';

-- 인덱스 최적화(재구성 )
OPTIMIZE TABLE phone;