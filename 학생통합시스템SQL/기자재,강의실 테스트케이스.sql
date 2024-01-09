-- ---------------------------------------- 기자재 관련 ---------------------------------------- --

								    -- 1. 대여한 기자재 이력 조회 -- 제외
SELECT c.id as '대여자id',c.name as '대여자' ,b.name as '기자재',a.rental_cnt as '대여수량',a.rental_dt as '대여일',a.due_dt as '반납일'
  FROM rent_equipment_tb a 
  JOIN equipment_tb b on a.equipment_id = b.id
  JOIN student_tb c   on a.student_id = c.id;
select * from rent_equipment_tb; 

								   -- 2. 기자재 대여 이력 조회 --
SELECT  b.id as '학번 or 교수ID',b.name as '대여자',c.name as '기자재 이름' ,a.rental_cnt as '대여수량',a.rental_dt as '대여일',a.due_dt as '반납일'
  FROM rent_equipment_tb a
  JOIN student_tb b on a.student_id = b.id
  JOIN equipment_tb c on c.id=a.equipment_id
 UNION
SELECT  b.id as '학번 or 교수ID',b.name as '대여자',c.name as '기자재 이름',a.rental_cnt as '대여수량',a.rental_dt as '대여일',a.due_dt as '반납일'
  FROM rent_equipment_tb a
  JOIN professor_tb b on a.professor_id = b.id
  JOIN equipment_tb c on c.id=a.equipment_id
;

								  -- 3-1. 특정 학생이 대여한 기자재 이력 조회 --
SELECT c.id as '대여자id',c.name as '대여자' ,b.name as '기자재',a.rental_cnt as '대여수량',a.rental_dt as '대여일',a.due_dt as '반납일'
  FROM rent_equipment_tb a 
  JOIN equipment_tb b on a.equipment_id = b.id
  JOIN student_tb c on a.student_id=c.id
 WHERE c.id= 20230061;
								  -- 3-2. 특정 교수가 대여한 기자재 이력 조회 --
SELECT c.id as '대여자id',c.name as '대여자' ,b.name as '기자재',a.rental_cnt as '대여수량',a.rental_dt as '대여일',a.due_dt as '반납일'
  FROM rent_equipment_tb a 
  JOIN equipment_tb b on a.equipment_id = b.id
  JOIN professor_tb c on a.professor_id=c.id
 WHERE c.id= 6;
									 -- 4. 기자재 목록 조회 --
SELECT b.name as '카테고리',a.id as '기자재번호', a.name as '기자재 이름', a.explain as '설명', a.total_cnt as '총 수량', a.residual_cnt as '잔여수량', a.equipment_img as '사진', c.name as '위치'
  FROM EQUIPMENT_TB a
  JOIN equipment_category_tb b on a.category_code_id=b.id
  JOIN structure_tb c on a.structure_id = c.id;

								   -- 5. 대여 가능한 기자재 조회 --
SELECT b.name as '카테고리',a.id as '기자재번호', a.name as '기자재 이름', a.explain as '설명', a.total_cnt as '총 수량', a.residual_cnt as '잔여수량', a.equipment_img as '사진', c.name as '위치'
  FROM EQUIPMENT_TB a
  JOIN equipment_category_tb b on a.category_code_id=b.id
  JOIN structure_tb c on a.structure_id = c.id
 WHERE a.residual_cnt != 0;
								  -- 6. 대여 불가능한 기자재 조회 --
SELECT b.name as '카테고리',a.id as '기자재번호', a.name as '기자재 이름', a.explain as '설명', a.total_cnt as '총 수량', a.residual_cnt as '잔여수량', a.equipment_img as '사진', c.name as '위치'
  FROM EQUIPMENT_TB a
  JOIN equipment_category_tb b on a.category_code_id=b.id
  JOIN structure_tb c on a.structure_id = c.id
 WHERE a.residual_cnt = 0;

-- ------------------------------------------------------------------------------------------------------------------------ --

-- ---------------------------------------- 강의실 관련 ---------------------------------------- --

-- 1. 모든 강의실 조회 --
SELECT 
       b.name as '건물이름'
	 , a.id as '강의실'
     , a.rental_availability as '대여가능여부'
  FROM lecture_room_tb a
  join structure_tb b on a.structure_id = b.id;

-- 2. 대여 가능한 강의실 조회 --

SELECT 
       b.name as '건물이름'
	 , a.id as '강의실'
     , a.rental_availability as '대여가능여부'
  FROM lecture_room_tb a
  join structure_tb b on a.structure_id = b.id
 WHERE a.rental_availability = true;

-- 3. 대여 불가능한 강의실 조회 --
SELECT 
       b.name as '건물이름'
	 , a.id as '강의실'
     , a.rental_availability as '대여가능여부'
  FROM lecture_room_tb a
  join structure_tb b on a.structure_id = b.id
 WHERE a.rental_availability = false;
-- insert into rent_structure_tb values (13,'2020-01-02 09:00:00',3,'예약 설명 12',2105,NULL,4); 교수 데이터 추가
-- 4. 현재 대관중인 강의실들 조회 --
SELECT a.*, d.stu_name
  FROM rent_structure_tb a
  right join (select b.id , c.name as stu_name from rent_structure_tb b join student_tb c on b.student_id = c.id) as d on a.id = d.id
UNION
SELECT a.*, e.pro_name
  FROM rent_structure_tb a
  right join (select b.id, c.name as pro_name from rent_structure_tb b join professor_tb c on b.professor_id = c.id) as e on a.id = e.id;
  
-- 5. 현재 대관중인 강의실들 조회 - 학생 --
SELECT a.*
  FROM rent_structure_tb a
  right join (select b.id from rent_structure_tb b join student_tb c on b.student_id = c.id) as d on a.id = d.id;
 -- 6. 현재 대관중인 강의실들 조회 - 교수 --
SELECT a.*
  FROM rent_structure_tb a
  right join (select b.id from rent_structure_tb b join professor_tb c on b.professor_id = c.id) as d on a.id = d.id;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ --

select * from rent_structure_tb;