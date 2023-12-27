-- ------------------------			DDL			------------------------ --

							  -- 1. CREATE --
DROP TABLE IF EXISTS tb1 CASCADE;
DROP TABLE IF EXISTS tb2 CASCADE;
-- 1. 테이블 생성
CREATE TABLE IF NOT EXISTS tb1
(
    pk INT PRIMARY KEY, -- 컬럼 레벨에서 제약조건 추가
		fs INT,
		col1 VARCHAR(255),
		CHECK(col1 IN ('Y','N')) -- 테이블 레벨에서 제약조건 추가
)ENGINE=INNODB;

	-- 테이블 구조 확인
DESCRIBE tb1;
	-- or 
DESC tb1;
	-- INSERT test
INSERT INTO tb1 values(1,10,'Y');
SELECT * FROM tb1;

-- 2. AUTO_INCREMENT 적용
	-- 테이블 생성
CREATE TABLE IF NOT EXISTS tb2
(
    pk INT PRIMARY KEY auto_increment, -- 컬럼 레벨에서 제약조건 추가
		fs INT,
		col1 VARCHAR(255),
		CHECK(col1 IN ('Y','N')) -- 테이블 레벨에서 제약조건 추가
)ENGINE=INNODB;
	-- 테이블 구조 확인
DESCRIBE tb2;
	-- INSERT test
INSERT INTO tb2 values(NULL,10,'Y');
SELECT * FROM tb2;

-- 3. ALTER
	-- 추가
ALTER TABLE tb2 ADD col2 INT NOT NULL;
DESC tb2;
	-- 삭제
ALTER TABLE tb2 DROP col2;
DESC tb2;
	-- 열 이름 및 데이터 형식 변경
ALTER TABLE tb2 CHANGE fs change_fk INT NOT NULL; -- NULLABLE or NOT NULL
	-- 제약조건 제거
ALTER TABLE tb2 DROP PRIMARY KEY; -- auto_increment가 있으면 불가 (auto_increment는 primary키에만 적용 가능하기 때문)
ALTER TABLE tb2 MODIFY pk INT; -- 이걸 통해 auto_increment 제거 
ALTER TABLE tb2 DROP PRIMARY KEY; -- 후 primary key 제거
ALTER TABLE tb2 ADD PRIMARY KEY(pk); -- 다시 키 추가

-- 4. DROP
DROP TABLE IF EXISTS tb2 CASCADE; -- 테이블 있으면 제거  없으면 그만
-- 5. TRUNCATE

	-- table tb6
CREATE TABLE IF NOT EXISTS tb6(
  pk INT AUTO_INCREMENT PRIMARY KEY,
  fk INT,
  col1 varchar(255),
 CHECK(col1 IN ('Y','N'))
)ENGINE=INNODB;
	-- INSERT
INSERT INTO tb6 VALUES
(null,10,'Y'),
(null,20,'Y'),
(null,30,'Y'),
(null,40,'Y');
SELECT * FROM tb6;
	-- truncate tb6
TRUNCATE tb6;  -- table 스킵 가능
SELECT * FROM tb6;
ROLLBACK;







