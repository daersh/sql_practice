-- ------------------------			VIEW		------------------------ --
				  -- 조회한 결과를 가진 가상의 테이블을 만드는 것 --

-- 1. 한식(카테고리코드: 4)만 가지고 있는 테이블.
	-- REPLACE 넣으면 테이블 있어도 이걸로 대체해줌
CREATE OR REPLACE VIEW hansik AS 
SELECT
       menu_code 
	 , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 4;
	--  뷰 조회
SELECT * FROM hansik;

-- 2. 원본 바뀌면 뷰의 값도 바뀜
CREATE VIEW test1 AS SELECT * FROM tbl_menu;
UPDATE tbl_menu
   SET menu_price = 10
 WHERE menu_code = 11;
SELECT * FROM test1;
ROLLBACK;
-- 3. 뷰를 통해 원본 테이블 수정 -- 실무에서 절대 하지 말 
UPDATE test1
   SET menu_price = 10
 WHERE menu_code = 11;	
SELECT * FROM test1;
SELECT * FROM tbl_menu;
ROLLBACK;
	-- INSERT
	-- INSERT INTO hansik VALUES (null, '식혜맛국밥', 5500, 4, 'Y');    -- 에러 발생
INSERT 
  INTO hansik
VALUES (99, '수정과맛국밥', 5500, 4, 'Y');   
SELECT * FROM hansik;
SELECT * FROM tbl_menu;
	-- UPDATE
UPDATE hansik
   SET menu_name = '버터맛국밥', menu_price = 5700 
 WHERE menu_code = 99;
SELECT * FROM hansik;
SELECT * FROM tbl_menu;
	-- DELETE
DELETE FROM hansik WHERE menu_code = 99;
SELECT * FROM hansik;
SELECT * FROM tbl_menu;

DROP VIEW hansik;

