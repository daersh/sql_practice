

-- 1. 컴퓨터공학과 1학년의 커리큘럼 과목들 불러오기
SELECT b.name, a.name
  FROM subject_tb a
  JOIN (SELECT a.id , b.name
          FROM curriculum_tb a
          join department_tb b on a.department_id=b.id
          where b.name = '컴퓨터공학과'
            and a.grade=1)  as b
	ON a.curriculum_id = b.id;
          
-- 2. 모든 학과 과목 불러오기
SELECT b.name, a.name
  FROM subject_tb a
  JOIN (SELECT a.id , b.name
          FROM curriculum_tb a
          join department_tb b on a.department_id=b.id) AS b 
    ON a.curriculum_id = b.id;
