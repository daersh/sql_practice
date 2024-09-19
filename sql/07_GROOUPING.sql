-- ------------------------			GROUPING			------------------------ --
							    -- GROUP BY 절 -- 
					-- 결과 집합을 특정 열의 값에 따라 그룹화하는데 사용 -- 
								 -- HAVING 절 --                     
			  -- HAVING은 그룹 절과 함께 사용, 그룹에 대한 조건을 적용하는데 사용 --
						-- 1. 메뉴가 존재하는 카테고리 그룹 조회 --
SELECT 
	   category_code				-- 4
  FROM tbl_menu						-- 1
 WHERE category_code IS NOT NULL     -- 2
 GROUP BY category_code;				-- 3

-- ------------------------		      그룹함수	 		 ------------------------ --
							  -- COUNT, SUM, AVG --			
SELECT 
	   category_code, COUNT(*),SUM(menu_price), AVG(menu_price)
  FROM tbl_menu					
 WHERE category_code IS NOT NULL     
 GROUP BY category_code
 ORDER BY 2;		

-- ------------------------		      HAVING	 		 ------------------------ --
			  -- HAVING은 그룹 절과 함께 사용, 그룹에 대한 조건을 적용하는데 사용 --
SELECT 
		  category_code, COUNT(*),SUM(menu_price), AVG(menu_price)
  FROM tbl_menu					
WHERE category_code IS NOT NULL     
GROUP BY category_code
HAVING SUM(menu_price) >= 24000
ORDER BY 2;

						-- 6가지 모두 활용한 예제 --
-- select : group by 절에서 그룹을 묶는 조건으로 활용한 컬럼만 조회
-- 또는 그룹 함수를 통해 조회
-- FROM: 테이블 또는 조인을 활용한 결과 세트를 작성
-- WHERE: FROM절의 각 행마다 적용될 조건 작성  
-- GROUP BY: WHERE절까지 만족하는 행들에 대해 그룹이 될 컬럼을 작성
-- HAVING : 그룹별ㄹ로 적용할 조건을 그룹 바이에서 작성한 컬럼 또는 그룹 함수를 통해 조회
-- ORDER BY: 제일 마지막에 해석. SELECT의 결과의 순번, 별칭, 컬럼 명 등으로 오름차순 혹은 내림차순으로함
SELECT 
		  a.category_code
		, COUNT(*)
        , SUM(menu_price)
  FROM tbl_menu a
 RIGHT JOIN tbl_category b ON (a.category_code = b. category_code)
 WHERE a.category_code IS NOT NULL     
 GROUP BY a.category_code
 HAVING a.category_code != 1
 ORDER BY SUM(menu_price);


-- ------------------------		      ROLLUP	 		 ------------------------ --
						-- 최종 합계를 구해줄 수 있는 유용한 함수 --
                          -- GROUPBY절에 WITH ROLLUP 사용 --
-- 1. 컬럼 한개 활용
SELECT
       category_code
     , SUM(menu_price)
  FROM tbl_menu
 GROUP BY category_code
  WITH ROLLUP;

-- 2. 컬롬 2개 활용
	-- 1번째 가격의 합계도 나옴
SELECT
       menu_price
     , category_code
     , SUM(menu_price)
  FROM tbl_menu
 GROUP BY menu_price, category_code
  WITH ROLLUP;

							-- SALES 테이블 예제 --
SELECT * FROM sales;

SELECT
        year
	  , month
      , product
      , SUM(amount) AS 'total_sales'
  FROM sales
 GROUP BY YEAR, MONTH, product
  WITH ROLLUP;
-- -년-월-제품의 가격
-- -년-월의 가격
-- -년의 가격 의 값들을 보여줌


-- ------------------------		      참고 	 		 ------------------------ --
-- 1. COUNT(*) vs COUNT(category_code)
	-- * : 모든 행 갯수 세기
    -- category_code : null이 아닌 행만 갯수 세기
SELECT 
		  COUNT(*)
		, COUNT(a.menu_name)
  FROM tbl_menu a
 RIGHT JOIN tbl_category b ON (a.category_code = b. category_code);

-- 2. 함수의 종류 
-- 단일행 함쉬: NVL or IFNULL과 같이 단일 행마다 적용되어 행의 갯수만큼 결과가 나오는 경우
-- 그룹 함수: COUNT, SUM, AVG와 같이 그룹마다 적용되어 그룹의 갯수만큼 결과가 나오는 경우	-
-- 단 그룹 바이 절이 없는 조회는 그룹 함수의 결과가 단일행(행 하나)이다.
	