-- ------------------------			 JOIN			 ------------------------ --
						  -- 두 개의 테이블을 엮을 때 사용 --
								
							  -- JOIN 5줄 요약 --
-- 조인은 두 개의 테이블을 서로 묶어서 하나의 결과를 만들어 내는 것을 말한다.
-- INNER JOIN(내부 조인)은 두 테이블을 조인할 때, 두 테이블에 모두 지정한 열의 데이터가 있어야 한다.
-- OUTER JOIN(외부 조인)은 두 테이블을 조인할 때, 1개의 테이블에만 데이터가 있어도 결과가 나온다.
-- CROSS JOIN(상호 조인)은 한쪽 테이블의 모든 행과 다른 쪽 테이블의 모든 행을 조인하는 기능이다.
-- SELF JOIN(자체 조인)은 자신이 자신과 조인한다는 의미로, 1개의 테이블을 사용한다.


-- ------------------------		  1. INNER JOIN		   ------------------------ --
								 -- 기본 조인 --
							-- 두 테이블의 교집합을 반환 --
			 -- 두 테이블을 조인할 때, 두 테이블에 모두 지정한 열의 데이터가 있어야함 --
			-- on 또는 using 뒤에 오는 join 조건을 만족하여 매칭되는 결과들만 join --
            
							-- 1. 메뉴와 카테고리 묶기 --
SELECT * 
  FROM tbl_menu a
  JOIN tbl_category b ON (a.category_code = b.category_code);

					 -- 2. 메뉴명, 카테고리명, 카테고리 코드 조회 --
SELECT 
		  a.menu_name
		, b.category_name 
        , a.category_code   -- 카테고리코드 컬럼이 중복되기 때문에 구분지어야함
  FROM tbl_menu a 
  JOIN tbl_category b ON (a.category_code = b.category_code);

				       -- 3. 카테고리 7번인 메뉴 조회 --
			 -- 조회 결과 없음 (7번 카테고리는 존재하지만 join에는 없음) --
SELECT 
		  a.menu_name
		, b.category_name 
        , a.category_code   
  FROM tbl_menu a 
  JOIN tbl_category b ON (a.category_code = b.category_code)
WHERE b.category_code = 7; 


-- ------------------------		  2. OUTER JOIN		   ------------------------ --
	-- --------------------		  2-1. LEFT JOIN	   -------------------- --
				 -- 조인 키워드 기준 왼쪽 테이블의 행이 모두 나오도록 조인 --
                 -- 2) left join: join 키워드 기준 왼쪽 테이블의 행이 모두 나오도록 join
                 
						-- --카테고리가 없는 메뉴를 만들기 위해-- --
			 -- --a. 메뉴 카테고리에 null이 들어갈 수 있게 not null 제약 조건 해제-- --
					SELECT * FROM tbl_menu WHERE menu_code = 1; 
					ALTER TABLE tbl_menu CHANGE category_code category_code INTEGER DEFAULT NULL; -- Not null 해제
	-- --ALTER TABLE tbl_menu MODIFY COLUMN category_code INTEGER NOT NULL;-- -- 
								-- NOT NULL로 재설정--
				-- -- b. 1번 메뉴의 메뉴 카테고리가 null로 변경 되게 설정 -- --
						UPDATE tbl_menu
						   SET category_code = 6
						 WHERE menu_code = 1;
								-- inner join 예시 --
SELECT
       *
  FROM tbl_menu a
  LEFT JOIN tbl_category b ON a.category_code = b.category_code;

	-- --------------------		  2-2. RIGHT JOIN	   -------------------- --
				-- 조인 키워드 기준 오른쪽 테이블의 행이 모두 나오도록 조인 --
                
SELECT
       *
  FROM tbl_menu a
  RIGHT JOIN tbl_category b ON a.category_code = b.category_code;

-- ------------------------		  4. CROSS JOIN		   ------------------------ --
			-- 한쪽의 테이블의 모든 행과 다른 쪽 테이블의 모든 행을 조인하는 기능 --
						-- 이건 보통 좋은 경우로 발생되는 것이 아님. --
                        
SELECT *
  FROM tbl_menu a
  Join tbl_category b ON (1=1);
SELECT *
  FROM tbl_menu a
  CROSS Join tbl_category b;
  
-- ------------------------		  5. SELF  JOIN		   ------------------------ --
					-- 자신이 자신과 조인하는 것으로 1개의 테이블 사용 --
				   -- 테이블 안에 상위, 하위 개념이 모두 있는 경우 사용 --
                     -- (식사,음료,디저트) | 라면,밥,국밥,콜라 --
								-- 사수 | 신입들 --
                                -- 댓글 | 대댓글 --
SELECT 
		  a.category_name
		, b.category_name
  FROM tbl_category a
  join tbl_category b ON a.ref_category_code = b.category_code
 WHERE a.ref_category_code IS NOT NULL;

-- ------------------------			  참고			  ------------------------ --

						   -- ON 다음 괄호로 묶어도 됨 --
                           
					 -- TABLE 명도 별칭(ALIAS)를 붙일 수 있음 --
			-- 관례) 조인 시에는 쿼리에 사용되는 모든 컬럼에 별칭을 다는 것이 원칙 --
			-- 별칭은 a,b,c,d.. 순으로 하는 것이 가시성과 순서 정하기 가장 좋음 --
                     
				 -- **주의 두 테이블에 같은 컬럼명이 있는 상태에서 조인 시 ** --
							-- 구분이 되지 않아 실행 불가 --
-- SELECT m.menu_name, c.category_name FROM tbl_menu m JOIN tbl_category c ON (category_code = category_code);                 

                     