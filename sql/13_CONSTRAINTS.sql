-- ------------------------			CONSTRAINTS			------------------------ --
								   -- 제약 조건 --
					 			 -- 1. NOT NULL --
-- NULL을 허용하지 않는 제약 조건 
DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull (
    user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
) ENGINE=INNODB;
INSERT 
  INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');
SELECT * FROM user_notnull;



								  -- 2. UNIQUE --
-- 중복을 허용하지 않는 제약 조건
-- Table, insert
DROP TABLE IF EXISTS user_unique;
CREATE TABLE IF NOT EXISTS user_unique (
    user_no INT NOT NULL UNIQUE,   			-- 컬럼 레벨
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    UNIQUE (phone)    						-- 테이블레벨  
) ENGINE=INNODB;
INSERT
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');
-- 중복 테스트
INSERT
  INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(3, 'user03', 'pass03', '길동', '남', '010-1234-5678', 'hong1234@gmail.com');
SELECT * FROM user_unique;


								-- 3. PRIMARY KEY --
DROP TABLE IF EXISTS user_primarykey;
CREATE TABLE IF NOT EXISTS user_primarykey (
--     user_no INT PRIMARY KEY,
    user_no INT,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    PRIMARY KEY (user_no)
) ENGINE=INNODB;
INSERT 
  INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com'),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com');
SELECT * FROM user_primarykey;      


								-- 3. FOREIGN KEY --
-- PK TABLE 생성
DROP TABLE IF EXISTS user_grade;
CREATE TABLE IF NOT EXISTS user_grade (
    grade_code INT NOT NULL UNIQUE,
    grade_name VARCHAR(255) NOT NULL
) ENGINE=INNODB;
INSERT 
  INTO user_grade
VALUES 
(10, '일반회원'),
(20, '우수회원'),
(30, '특별회원');
SELECT * FROM user_grade;
-- FK 자식 테이블 생성
DROP TABLE IF EXISTS user_foreignkey1;
CREATE TABLE IF NOT EXISTS user_foreignkey1 (
    user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT ,
    FOREIGN KEY (grade_code) 
		REFERENCES user_grade (grade_code)
) ENGINE=INNODB;
INSERT 
  INTO user_foreignkey1
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);

SELECT a.user_name, b.grade_name 
  FROM user_foreignkey1 a 
  JOIN user_grade b ON a.grade_code= b.grade_code;

-- 자식 테이블 - DELETE 삭제룰이 있을 경우 --
-- 삭제 룰을 적용한 외래키 제약조건 
DROP TABLE IF EXISTS user_foreignkey2;
CREATE TABLE IF NOT EXISTS user_foreignkey2 (
    user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT ,
    FOREIGN KEY (grade_code) 
		REFERENCES user_grade (grade_code)
        ON UPDATE SET NULL  -- 이런 옵션들이 있어야 자식이 부모 참조하고 있을 떄 부모의 데이터 삭제, 수정 가능. 단, 부모를 참조하는 자식들 모두 이 옵션을 가지고 있는 경우만 가능 
        ON DELETE SET NULL  --
) ENGINE=INNODB;

INSERT 
  INTO user_foreignkey2
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(1, 'user01', 'pass01', '홍길동', '남', '010-1234-5678', 'hong123@gmail.com', 10),
(2, 'user02', 'pass02', '유관순', '여', '010-777-7777', 'yu77@gmail.com', 20);
-- 자식이 참조 있을 때 외래키들 모두 ON UPDATE SET NULL과 같은 것이 설정 되어 있어야 가능 -------------------------------------
DELETE  
  FROM user_grade
 WHERE grade_code = 20;

 SELECT a.user_name, a.grade_code,b.grade_name FROM user_foreignkey2 a JOIN user_grade b ON a.grade_code = b.grade_code;
INSERT
  INTO user_grade
VALUES (40,'에메랄드 회원');

UPDATE user_foreignkey2
   SET grade_code = 40
WHERE grade_code IS NULL;

								 -- 4. CHECK --
					-- 	조건식을 활용한 구체적인 제약 조건 - 논리연산 --
DROP TABLE IF EXISTS user_check;
CREATE TABLE IF NOT EXISTS user_check (
    user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3) CHECK(gender IN ('남','여')), -- 조건 1 (남 또는 여인지)
    age INT CHECK (age >= 19)  					   -- 조건 2 나이가 19이상인지
) ENGINE=INNODB;

INSERT INTO user_check VALUES (null, '홍길동', '남', 25), (null, '이순신', '남', 33); -- 되는 경우
INSERT INTO user_check VALUES (null, '홍길동', '냠', 10); -- 안되는 경우 1 - 성별
INSERT INTO user_check VALUES (null, '홍길동', '남', 10); -- 안되는 경우 2 - 나이 
SELECT * FROM user_check;

								-- 4. DEFUALT --
-- 컬럼에 NULL 대신 기본 값 적용
	-- type= date일 경우 current_date만 가능 
	-- type= datetime일 경우 current_date, current_timestamp, now() 모두 가능
DROP TABLE IF EXISTS tbl_country;
CREATE TABLE IF NOT EXISTS tbl_country (
    country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT '한국',     -- 디폴트 1. 한국
    population VARCHAR(255) DEFAULT '0명',		 -- 디폴트 2. 0명
    add_day DATE DEFAULT (current_date),		 -- 디폴트 3. 현재날자
    add_time DATETIME DEFAULT (current_time)     -- 디폴트 4. 현재시간
) ENGINE=INNODB;

SELECT * FROM tbl_country;
INSERT INTO tbl_country VALUES (null, default, default, default, default);
INSERT INTO tbl_country (country_code)VALUES (NULL); -- 무시해도 적용 가능 
SELECT * FROM tbl_country;
