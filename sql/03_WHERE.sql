-- --------------------------------   WHERE(조건문)    --------------------------------
-- 1. orderable_status 가 Y인 경우만 출력
SELECT
		menu_name
		, MENu_price
		, ordErable_status
	FROM tbl_menu
 WHERE ORDerable_statUS = 'Y';
-- 2. orderabLe_status 가 N인 경우만 출력
SELECT
		menu_name
		, menu_price
		, ORderable_status
	FROM tbl_menu
 WHERE orderable_staTUS = 'N';
 
-- ------------------------ 기타 카고리에 해당하지 않는 메뉴 조회 ------------------------
-- 1.. 기타 카테고리의 번호 파악
SELECT * FROM tbl_category WHERE category_name = '기타';
-- 2. 해당 번호를 가지지 않는 메뉴 조회
SELECT * FROM TbL_MEnu WHERE categORY_Code != 10;
SELECT * FROM tbl_menu WHERE category_code <> 10;
-- ------------------------------------------------------------------------------

-- ------------------------ 가격대로 메뉴 조회               ------------------------
 -- 1.만원 이상
SELECT * FROM tbl_menu WHERE menu_price >=10000;
 -- 2. 만원 미만
SELECT * FROM tbl_menu WHERE menu_price <10000;
 -- 3. 만원 이상, 12000이하 and or &&
SELECT * FROM Tbl_menu WHERE Menu_price >=10000 && menu_price <= 12000;
SELECT * FROM Tbl_menu WHERE menu_price BETWEEN 10000 AND 12000 order by 3;-- ~이상 ~이하 -> 끝자리도 포함
-- ------------ 중요!!!!!!!NOT은 WHERE뒤에도 붙을 수 있고, BETWEEN앞에 붙어도 됨  ----------------
SELECT * FROM Tbl_menu WHERE NOT MENU_pRICe BETWEEN 10000 AND 12000 order by 3;

-- 4. 가격은 5000 초과하거나 코드가 10인 것들만 출력
select
		menu_code
		,menu_name
		,menu_price
		,category_code
		,orderable_status
	FROM tbl_menu
WHERE MENu_pRICE > 5000 || CATEgORY_code = 10 ;
-- ------------------------			 LIKE 연산자			 ------------------------
-- LIKE 연산자: 찾고자하는 값을 포함하고 있는 것 찾기
-- 메뉴 중 밥이 들어간 메뉴 조회
SELECT *
from tbL_menu
where mEnu_name LIKE '%밥%'; -- 밥이 맨 뒤거나 맨 앞이여도 출력 되는 듯
-- REVErs
SELECT *
FrOM TbL_menu
where menu_nAMe NOT LIKE '____밥%';
 
-- ------------------------			많이 사용되는 기능		 ------------------------
-- 1. IN 연산자 
-- 중식, 커피, 기타 카테고리 메뉴 조회 
select *
from tbl_category
where category_name IN('중식','커피','기타');
-- 2. IS NULL
-- ref_카테고리 코드가 없는 것 찾기 
Select *
from tbl_category
where ref_category_code is NULL;
Select *
from tbl_caTEGORY
WhERE ref_categoRY_COde is NOT NULL;
 
 
-- ------------------------ 참고|DESC를 통한 컬럼명 빠르게 확인 -----------------------
DESC tbl_MENU;
 

 