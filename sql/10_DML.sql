

-- insert
DESC tbl_menu;
INSERT 
  INTO tbl_menu
( -- 컬럼명을 생략하고 순서대로 삽입하는 것도 가능
	-- menu_code, -- null부분은 이름과 values null 뺴고 써도 됨
	menu_name,
	menu_price,
	category_code,
	orderable_status
)
VALUES 
(
  -- NULL,
  '바나나해장국', 8500, 4, 'Y'
);
SELECT * FROM tbl_menu;

-- delete
DELETE 
  FROM tbl_menu
 WHERE menu_name = '버네너해장국';
 -- 두줄 삭제?
DELETE FROM tbl_menu
 ORDER BY menu_price
 LIMIT 2;
-- 전체삭제
DELETE FROM tbl_menu where 1 = 1;

-- UPDATE 
-- 서브커리 활용도 가능
UPDATE tbl_menu
   SET menu_name = "버네너해장국"
 WHERE menu_name = "바나나해장국";
 

-- REPLACE
-- 권장하지 않는 방법.
-- 삽입 시 PRIMARY KEY 또는 UNIQUE KEY가 충돌발생한다면 이를 통해 중복된 데이터 덮어쓸 수 있음
-- INTO는 생략 가능
-- UPDATE 시 WHERE 구문 없이 가능
REPLACE
  INTO tbl_menu
(
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
)
VALUES
(
22,
  '바나나해장국', 8500, 4, 'Y'
);
