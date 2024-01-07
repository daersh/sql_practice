-- ---------------------------------------- 회원 관련 ---------------------------------------- --

								  -- 1. 학생의 전체 정보 조회 --
SELECT a.id as '학번'
	 , a.name as '이름'
    -- , a.password as '비밀번호'
	 , d.name as '학과'
     , c.name as '지도교수'
     , b.eng_name  as '영어이름'
    -- , b.resident_registration_no  as '주민등록번호'
	 , b.student_img  as '학생사진'
     , b.gender as '성별'
	 , b.nationality  as '국적'
     , b.email as '이메일'
     , b.phone_no as '연락처'
     , b.address as '주소'
     , b.admission as '입학년도'
	 , b.graduation as '졸업년도'
     , b.complete_term as '이수학기'
     , b.grade as '학년'
	 , b.status as '학적상태'
     , b.process as '과정구분'
     , b.credit as '신청학점'
     , b.get_credit as '이수학점'
     , b.grade_point_avg as '평균학점'
  FROM student_tb as a
  JOIN college_recode_tb b on a.id= b.student_id
  JOIN professor_tb c on a.advisor_id = c.id
  JOIN department_tb d on a.department_id = d.id;
							  -- 2. 학생 자신의 정보를 조회할 시 --
SELECT a.id as '학번'
	 , a.name as '이름'
     , a.password as '비밀번호'
	 , d.name as '학과'
     , c.name as '지도교수'
     , b.eng_name  as '영어이름'
     , b.resident_registration_no  as '주민등록번호'
	 , b.student_img  as '학생사진'
     , b.gender as '성별'
	 , b.nationality  as '국적'
     , b.email as '이메일'
     , b.phone_no as '연락처'
     , b.address as '주소'
     , b.admission as '입학년도'
	 , b.graduation as '졸업년도'
     , b.complete_term as '이수학기'
     , b.grade as '학년'
	 , b.status as '학적상태'
     , b.process as '과정구분'
     , b.credit as '신청학점'
     , b.get_credit as '이수학점'
     , b.grade_point_avg as '평균학점'
  FROM student_tb as a
  JOIN college_recode_tb b on a.id= b.student_id
  JOIN professor_tb c on a.advisor_id = c.id
  JOIN department_tb d on a.department_id = d.id
 WHERE a.id= 20230056;

								 -- 3. 교수 전체 정보 조회 --
SELECT 
	   a.id as '교수코드'
	 , a.name as '이름'
	-- , a.password as '비밀번호'
     , a.professor_img as '교수사진'
	-- , a.resident_registration_no as '주민등록번호'
     , a.email as '이메일'
     , a.phone_no as '연락처'
     , a.position as '직급'
    -- , a.contract as '계약형태'
    -- , a.salary as '급여'
     , b.name as '소속학과'
  FROM professor_tb as a
  JOIN department_tb as b on a.department_id= b.id;

							 -- 4. 교수 자신의 정보 조회 시 --
SELECT 
	   a.id as '교수코드'
	 , a.name as '이름'
	 , a.password as '비밀번호'
     , a.professor_img as '교수사진'
	 , a.resident_registration_no as '주민등록번호'
     , a.email as '이메일'
     , a.phone_no as '연락처'
     , a.position as '직급'
     , a.contract as '계약형태'
     , a.salary as '급여'
     , b.name as '소속학과'
  FROM professor_tb as a
  JOIN department_tb as b on a.department_id= b.id
 WHERE a.id = 10;