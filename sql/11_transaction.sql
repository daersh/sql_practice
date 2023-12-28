-- ------------------------			TRANSACTION			------------------------ --
-- autocommit 확인, 오프
SELECT @@AUTOCOMMIT;
SET autocommit = 0;

START TRANSACTION;
INSERT
  INTO tbl_menu
VALUES
(
  NULL, '바나나해장국', 8500,
  4, 'Y'
);

UPDATE tbl_menu
   SET menu_name = '수정된 메뉴1'
 WHERE menu_code = 5;
UPDATE tbl_menu
   SET menu_name = '수정된 메뉴2'
 WHERE menu_code = 6;

SELECT * FROM tbl_menu; -- 롤백 전
-- COMMIT; 				-- 컴밋 후에는 롤백 안됨
ROLLBACK;  	-- 트랜젝션 안하면 업데이트 두개 했을때나 인설트 두번 했을 때는 롤백 되는데 섞이면 문제 발생
SELECT * FROM tbl_menu; -- 롤백 후
