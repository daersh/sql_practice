-- ------------------------			SET OPERATOR			------------------------ --

					-- 두 개 이상의 SELECT문의 결과 집합을 결합하는데 사용 --
				  -- SET 연산자를 통해 결합하는 결과 집합의 컬럼이 동일해야함. --
						
								-- 1. UNION: 합집합 --    
                                 -- 아래에 추가 삽입됨 --
SELECT
	   menu_code
	 , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 UNION
SELECT
	   menu_code
	 , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000;

								-- 2. UNION ALL: 덧셈 -- 
								 -- 교집합 중복되어 나옴 --
SELECT
	   menu_code
	 , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE category_code = 10
 UNION ALL
SELECT
	   menu_code
	 , menu_name
     , menu_price
     , category_code
     , orderable_status
  FROM tbl_menu
 WHERE menu_price < 9000
 ORDER BY 1;
								-- 3. INTERSECT: 교집합 -- 
						  -- mysql은 기본적으로 제공하지 않은 기능임 --
						 -- innter join이나 in을 사용하여 구현 가능 --
SELECT
       a.menu_code
     , a.menu_name
     , a.menu_price
     , a.category_code
     , a.orderable_status
  FROM tbl_menu a
 INNER JOIN (SELECT menu_code
                  , menu_name
                  , menu_price
                  , category_code
                  , orderable_status
               FROM tbl_menu
              WHERE menu_price < 9000) b ON (a.menu_code = b.menu_code)
 WHERE a.category_code = 10;
 
								-- 4. MINUS: 차집합-- 
						  -- mysql은 기본적으로 제공하지 않은 기능임 --
							 -- LEFT JOIN 활용하여 구현 --
SELECT
       a.menu_code
     , a.menu_name
     , a.menu_price
     , a.category_code
     , a.orderable_status
     , b.*
  FROM tbl_menu a
  LEFT JOIN (SELECT menu_code
                  , menu_name
                  , menu_price
                  , category_code
                  , orderable_status
               FROM tbl_menu
              WHERE menu_price < 9000) b ON (a.menu_code = b.menu_code)
 WHERE a.category_code = 10 -- 여기까지하면 교집합아닌것 교집합인 것 포함됨
   AND b.menu_code IS NULL; -- 교집합이 아닌것만 



