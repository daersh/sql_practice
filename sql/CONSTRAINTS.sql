-- ------------------------			CONSTRAINTS			------------------------ --

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



