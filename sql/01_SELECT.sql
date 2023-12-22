SELECT * FROM tbl_category;
SELECT menu_name, category_name
	FROM tbl_menu a
    JOIN tbl_category b ON (a.category_code = b.category_code);

-- 단독 SELECT 사용  
-- 띄어쓰기나 특수기호사용시에는 '' 안에 입력해야됨 (예: 7+3 '합 입니다.') - O
select 7+3 '합', 10*2 as '곱';
select 7+3 합, 10*2 곱;
select 7+3 '합', 10*2 as '곱';

-- 내장함수 sysdate
SELECT NOW(); 				    -- 현재시간
SELECT CONCAT('이',' ','현우');  -- 값을 합쳐서 문자열로 생성
SELECT CONCAT('L',' E E',' ','현우');  -- 값을 합쳐서 문자열로 생성
SELECT NOW() AS '현재시간';
 SELECT ASCII('c'); -- ascii로변환, 문자열일 경우 맨 앞 하나만 인식

-- ------------------------ 라인으로 쭉 그으려면 이렇해야됨 

DESC tbl_category; -- 해당 테이블에 대한 필드 정보 출력
