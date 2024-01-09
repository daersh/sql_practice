-- 
CREATE OR REPLACE VIEW department_view as
SELECT 
       c.name as '건물 이름'
	 , c.address as '건물 위치'
     , c.structure_img as '건물 사진'
	 , b.name as '단과 이름'
     , a.name as '학과 이름' 
  FROM department_tb a
  JOIN college_tb b on a.college_id = b.id
  JOIN structure_tb c on b.structure_id = c.id;
  
drop view department_view;
select * from department_view;