-- ------------------------			 DISTINCT			 ------------------------ --
		   -- 중복 값 제거를 위해 사용 ->  컬럼에 있는 컬럼값들의 종류를 쉽게 파악 가능 --
							 -- 해당 컬럼의 종류를 보여줌 --
								 -- 올바른 사용법 --
SELECT
	DISTINCT category_code
 FROM tbl_menu;
 
								 -- 잘못된 사용법 --
				   -- ** 주의 distinct 사용 시 일반 컬럼 사용 불가 ** --
SELECT
	DISTINCT category_code
    , menu_name
 FROM tbl_menu;

						-- **  주의 distinct는 셀렉에서만 가능 ** --
		-- 기본 정렬 개념(순번, 별칭을 사용하지 않고는 정렬 불가)는 신텍스에러 발생(문법에러) --
								 -- 잘못된 예시 --
-- SELECT
-- 	DISTINCT ref_category_code
-- FROM tbl_category
-- ORDER BY DISTINCT ref_category_code DESC;

								 -- 올바른 예시 --
SELECT
	DISTINCT ref_category_code 
FROM tbl_category
ORDER BY ref_category_code DESC;  -- 널도 묶어줌 --
SELECT
	DISTINCT ref_category_code as 'rcc'
FROM tbl_category
ORDER BY rcc;

		-- ** 컬럼 두개 이상을 distinct에 넣어야 하는 경우에는 group by 절을 사용해야함 --





