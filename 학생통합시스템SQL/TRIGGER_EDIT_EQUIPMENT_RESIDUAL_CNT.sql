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