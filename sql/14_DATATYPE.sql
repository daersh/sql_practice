-- ------------------------			DATATYPE			------------------------ --
							  -- 1. 명시적 형 변환 --
							 -- CONVERT OR CAST  --
SELECT AVG(menu_price) FROM tbl_menu;
SELECT CAST(AVG(menu_price) AS SIGNED INTEGER) AS '평균 메뉴 가격' FROM tbl_menu;
SELECT CONVERT(AVG(menu_price), SIGNED INTEGER) AS '평균 메뉴 가격' FROM tbl_menu;
-- 소수점 한자리까지
SELECT CAST(AVG(menu_price) AS FLOAT) AS '평균 메뉴 가격' FROM tbl_menu; 
-- 소수점 12자리까지
SELECT CONVERT(AVG(menu_price), DOUBLE) AS '평균 메뉴 가격' FROM tbl_menu;

-- 날짜 변환
SELECT CAST('2023$5$30' AS DATE);
SELECT CAST('2023/5/30' AS DATE);
SELECT CAST('2023%5%30' AS DATE);
SELECT CONVERT('2023''5''30' , DATE);


-- 메뉴 가격 구하기 
-- CONCAT: 문자들을 합쳐줌

SELECT CONCAT(CAST(menu_price AS CHAR(5))) FROM tbl_menu;
SELECT CONCAT(CAST(menu_price AS CHAR(5)), '원') FROM tbl_menu;
SELECT category_code, CONCAT(CAST(SUM(menu_price) AS CHAR(10)), '원') FROM tbl_menu GROUP BY category_code;

-- 숫자 -> 문자
SELECT CONCAT(CAST(1000 AS CHAR), '원');
SELECT 1000+'원'; -- '원'=0 -> 1000 만 나옴

							  -- 2. 암시적 형 변환 -- 
						 -- 연산자 사용 시 자동 형변환 주의 --
								 -- 사용 자제?? --
SELECT '1' + '2';    -- 각 문자가 정수로 변환됨
SELECT CONCAT('1','2','3');
SELECT CONCAT(menu_price, '원') FROM tbl_menu;    -- menu_price가 문자로 변환됨
SELECT '안녕'+'하세요'; -- 0 문자열이면 연산자 주의
SELECT 1+'2';
SELECT 3 > 'MAY';    -- 문자는 0으로 변환되어 3이 더 크다고 true 반환


