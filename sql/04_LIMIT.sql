-- ------------------------			 LIMIT			 ------------------------ --


			-- SELECT문의 결과 집합에서 반환할 행의 수를 제한하는데 사용 --
		  -- 자르는 용도임 그래서 select, from, where,이런거와는 좀 별개? --
		   -- LIMIT offset,row_count; offset 위치 시작부터 count까지 --
           
           
-- ------------------------			 활용			 ------------------------ --


				-- 시작지점을 지정하는 경우 LIMIT offset , cnt --
							-- 1. 0번부터 4개 --
SELECT * From tbl_menu LIMIT 0,4; 
							-- 2. 4번부터 5개 --
SELECT * From tbl_menu LIMIT 4,5; 
					 -- 시작지점부터 cnt 만큼 LIMIT cnt --
SELECT * From tbl_menu LIMIT 4;



-- ------------------------			 참고			 ------------------------ --


			 -- LIMIT은 자주 사용하지 않지만 TOP-N분석이나 paging 처리할 때 사용 --
             
             

