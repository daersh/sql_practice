-- 수강 신청 추가 시 장바구니에서 학번,강의코드가 일치하는 데이터 제거
DELIMITER //
CREATE OR REPLACE TRIGGER delete_basket_lecture
 AFTER INSERT
    ON course_registration_tb
   FOR EACH ROW
 BEGIN
	   DECLARE new_lec_id int;
       DECLARE new_student_id int;
           SET new_lec_id = NEW.lecture_id;
           SET new_student_id = NEW.student_id;
        DELETE 
          FROM course_basket_tb 
	     WHERE new_lec_id = course_basket_tb.lecture_id
           AND new_student_id = course_basket_tb.student_id;
END //
DELIMITER ;

-- 트리거 삭제
-- DROP TRIGGER delete_basket_lecture;

-- 조회
select * from course_basket_tb;
select * from course_registration_tb;

-- test 20160001, 10
-- 수강 신청 추가 시 장바구니에서 학번,강의코드가 일치하는 데이터 제거
insert into course_registration_tb values (20160001,10);

-- init
insert into course_basket_tb values (20160001,10);
delete from course_registration_tb where student_id=20160001 AND lecture_id = 10;

-- -------------------------------------------------------------------------------------------------------------------------------------------- --
-- 기자재 대여 시 수량에 맞춰 기자재 테이블 잔여량 조절
DELIMITER //
CREATE OR REPLACE TRIGGER edit_equiment_residual_cnt
 AFTER INSERT
    ON rent_equipment_tb
   FOR EACH ROW
 BEGIN
	   DECLARE new_equipment_id int;
       DECLARE new_rental_cnt int;
           SET new_equipment_id = NEW.equipment_id;
           SET new_rental_cnt = NEW.rental_cnt;

		UPDATE equipment_tb
           SET equipment_tb.residual_cnt = equipment_tb.residual_cnt - new_rental_cnt
	     WHERE equipment_tb.id = new_equipment_id;
END //
DELIMITER ;

-- test
select * from rent_equipment_tb;
select * from equipment_tb;
INSERT INTO rent_equipment_tb VALUES (NULL,CURDATE(),CURDATE(),'test',1,1,NULL,20160004);

-- init
DELETE FROM rent_equipment_tb WHERE rent_equipment_tb.student_id=20160004;
UPDATE equipment_tb
           SET equipment_tb.residual_cnt = 53
	     WHERE equipment_tb.id = 1;