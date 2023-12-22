-- 오름차순
SELECT
       menu_code
     , menu_name
     , menu_price p
  FROM tbl_menu
--  ORDER BY menucode ASC;	-- ASCending는 오름차순  descending: DESC 
-- orderby는 문조건 맨 뒤 
 ORDER BY p ;

-- 내림차순 
SELECT
       menu_code
     , menu_name
     , menu_price
  FROM tbl_menu
ORDER BY menu_price  DESC;


SELECT
		menu_price -- 1번 쩨
		,menu_name -- 2번 쩨
	FROM tbl_menu ;
  
-- 컬럼 순번을 활용한 정렬
SELECT
		menu_price -- 1번 쩨
		,menu_name -- 2번 쩨
	FROM tbl_menu 
Order by 1 asc;
  
-- 별칭을 활용한 정렬
SELECT 
		menu_price as 'mp'
        , menu_name as 'mn'
	from tbl_menu
    order by mp desc;  -- 별칭으로 정렬 시 별침영에 single quatatuin(')을 붙이면 안됨?

-- 복수 정렬
SELECT 
		menu_price as 'mp'
		, menu_name as 'mn'
    from tbl_menu
order by 1 desc, 2 ASC; -- 가격으로 내림차순 먼저 정렬, 이후 이름으로 오름차순
 
 
--   ------------------------------- 특수 경우(필드, 널 정렬) -------------------------------
-- -----------------------------------------------------------------------
-- Field 
SELECT FIELD('a','b', 'z', 'a'); -- a: 찾고싶은 값 b,z,a: 값들  결곽값: 3
-- table에서 조회 시 field 활용
SELECT 
		  FIELD(orderable_status,'N','Y')
		, orderable_status
        , menu_name
        , menu_code
	From tbl_menu;

-- 필드를 활용항 order by
SELECT 
		  menu_name
		, orderable_status
	FROM tbl_menu
ORDER BY FIELD(orderable_status, 'N','Y') DESC;

-- ----------------------------------------------------------------------------------------
-- null 값에 대한 정렬
-- 1) 오름차순 시 널이 먼저 나옴
SELECT
		  *
	FROM tbl_category
ORDER BY ref_category_code ASC;

-- 2)내림차순 시 널 값이 나중에 나옴
SELECT
		  *
	FROM tbl_category
ORDER BY ref_category_code DESC;

--  ------------------- '-' 추가, 내림이면 오름으로 오름이면 내림으로 바꿈 -------------------------------
-- 3)오름차순에서 널이 나중에 오도록 바꾸기
SELECT 
		*
	FROM tbl_category
ORDER BY -ref_category_code DESC;

-- 4)내림차순에서 널이 처음에x 오도록 바꿈
SELECT 
		*
	FROM tbl_category
ORDER BY -ref_category_code ASC;

