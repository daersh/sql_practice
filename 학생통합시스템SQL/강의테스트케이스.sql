-- ---------------------------------------- 강의 관련 ---------------------------------------- --
									   -- 1. 강의 출력 --

SELECT a.id
     , a.name
     ,a.explain
     ,major
     ,plan
     ,date
     ,credit
     ,time
     ,face_to_face
     ,max_capacity
     ,recommend_grade
     ,semester
     ,b.name
     ,c.name
     ,lecture_room_number
  FROM lecture_tb a
  JOIN subject_tb b on a.subject_id=b.id
  JOIN professor_tb c on a.professor_id = c.id;

                            -- 2. 기계공학과에 해당하는 강의 출력 --
SELECT a.id
     , a.name
     , a.explain
     , major
     , plan
     , date
     , credit
     , time
     , face_to_face
     , max_capacity
     , recommend_grade
	 , semester
     , b.name
     , c.name
     , lecture_room_number
  FROM lecture_tb a
  JOIN subject_tb b on a.subject_id=b.id
  JOIN professor_tb c on a.professor_id = c.id
  JOIN curriculum_tb d on b.curriculum_id = d.id
  JOIN department_tb e on e.id = d.department_id
 WHERE e.name='기계공학과';

							-- 3. 2번 강의를 듣는 학생의 출석부 --
SELECT a.lecture_id, b.name,a.date,attendance_status,late_status,c.name
  FROM ATTENDANCE_TB a
  JOIN lecture_tb b on a.lecture_id = b.id
  JOIN student_tb c on a.student_id = c.id
 WHERE a.lecture_id=2;
                      -- 4. 20160003 학번 학생이 수강 신청한 과목들 --
SELECT a.student_id, b.name, c.name
  FROM course_registration_tb a
  JOIN student_tb b on a.student_id =b.id
  JOIN lecture_tb c on a.lecture_id = c.id
 where b.id= 20160003;
                    -- 5. 20160003 학번 학생이 장바구니 담은 과목들 --
SELECT a.student_id, b.name, c.name
  FROM course_basket_tb a
  JOIN student_tb b on a.student_id =b.id
  JOIN lecture_tb c on a.lecture_id = c.id
 where b.id= 20160003;
                                 -- 6. 수강 가능 학과 --
SELECT b.name, c.name
  FROM able_department_tb a
  JOIN lecture_tb b on a.lecture_id = b.id
  JOIN department_tb c on a.department_id = c.id;
                        -- 7. 20160003 학번 학생의 이수 강의 목록 --
SELECT 
       b.id
	 , b.name
     , c.name
     , result_eng
     , result_no
     , complete_division
	 , appraisal_status
     , appraisal_content
     , complete_year
  FROM course_lecture_tb a
  JOIN student_tb b on a.student_id=b.id
  JOIN lecture_tb c on a.lecture_id=c.id
 WHERE b.id = 20160003;
					 -- 8. 20160003학번 학생이 이수하지 못한 과목 조회 --
SELECT 
       b.id
	 , b.name
     , c.name
     , result_eng
     , result_no
     , complete_division
	 , appraisal_status
     , appraisal_content
     , complete_year
  FROM course_lecture_tb a
  JOIN student_tb b on a.student_id=b.id
  JOIN lecture_tb c on a.lecture_id=c.id
 WHERE b.id = 20160003
   AND complete_division = false;
-- ------------------------------------------------------------------------------------------- --


select * from course_lecture_tb;
select * from attendance_tb;
select * from course_registration_tb;
select * from course_basket_tb;