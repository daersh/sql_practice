-- ------------------------			GROUPING			------------------------ --
							    -- GROUP BY 절 -- 
					-- 결과 집합을 특정 열의 값에 따라 그룹화하는데 사용 -- 
								 -- HAVING 절 --                     
			  -- HAVING은 그룹 절과 함께 사용, 그룹에 대한 조건을 적용하는데 사용 --

SELECT 
		  category_code
  FROM tbl_menu
GROUP BY category_code;