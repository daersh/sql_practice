-- ------------------------			SUBQUERY			------------------------ --
						   -- 다른 쿼리 내에서 실행되는 쿼리 --
-- 1. 유재식씨와 같은 부서의 직원 추출
SELECT
	   *
  FROM EMPLOYEE a
 WHERE a.DEPT_CODE = ( SELECT dept_code
						 FROM EMPLOYEE
						WHERE emp_name = '유재식')
  AND EMP_NAME != '유재식';
SELECT
	   *
  FROM EMPLOYEE a
 WHERE DEPT_CODE = ( SELECT dept_code
					   FROM EMPLOYEE
					  WHERE emp_name = '유재식')
   AND emp_id <> ( SELECT emp_id     -- '<>' = '!='
					 FROM EMPLOYEE
					WHERE emp_name = '유재식');

-- 2. 메뉴의 카테고리의 가격보다 높은 메뉴만 조회(상관서브쿼리 사용한 예시)
SELECT
	   a.menu_code
	 , a.menu_name
	 , a.menu_price
	 , a.category_code
	 , a.orderable_status
  FROM tbl_menu a
 WHERE a.menu_price > ( SELECT AVG(b.menu_price)
						  FROM tbl_menu b
					     WHERE b.category_code = a.category_code);

-- 다중 행 
-- 3. 자신의 카테고리의 평균과 같은 가격의 메뉴 조회  (상관 서브쿼리 안쓰고 다중 행 서브쿼리 사용한 예시)
SELECT
	   *
  FROM tbl_menu a
 WHERE a.menu_price IN ( SELECT AVG(b.menu_price)
						  FROM tbl_menu b
						 WHERE b.category_code = a.category_code
						 GROUP BY b.category_code);

-- EXISTS
-- 4. 메뉴가 있는 카테고리 조호
SELECT 
	   category_name
  FROM tbl_category a
 WHERE EXISTS (SELECT 1
				 FROM tbl_menu b
				WHERE b.category_code = a.category_code)
 ORDER BY 1;
-- 4-1. use join
SELECT
	   a.category_code
	 , a.category_name
  FROM tbl_category a
  LEFT JOIN tbl_menu b ON (a.category_code = b.category_code)
  WHERE menu_name IS NOT NULL
  GROUP BY a.category_code;


SELECT 1
  FROM tbl_menu b
 WHERE b.category_code = 4;


-- 가장 높은 급여를 받는 사원 조회
SELECT EMP_NAME, SALARY
  FROM EMPLOYEE a
 WHERE a.SALARY = (SELECT MAX(SALARY)
				     FROM EMPLOYEE);

-- 평균 급여가 가장 높은 부서 조회
SELECT AVG(a.SALARY)
  FROM EMPLOYEE a
 GROUP BY a.DEPT_CODE
HAVING AVG(a.SALARY) >= ALL (SELECT AVG(b.SALARY)
							   FROM EMPLOYEE b
							  GROUP BY b.DEPT_CODE);
 
-- 인라인 뷰 -- 



-- 
