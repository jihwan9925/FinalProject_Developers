<<<<<<< HEAD
SELECT * FROM ACCOMMODATION a ;
SELECT * FROM AC_FILE;
=======

SELECT * FROM FOOD;
SELECT COUNT(*) FROM FOOD;
SELECT COUNT(*) FROM FOOD_PHOTO fp ;
SELECT * FROM food f LEFT OUTER JOIN FOOD_PHOTO fp using(food_no) WHERE fp_no = null;
DELETE FROM FOOD;
CREATE TABLE FOOD_TEMP AS SELECT * FROM FOOD WHERE 1=2;
SELECT * FROM FOOD_TEMP;
DELETE FROM FOOD_TEMP;

ALTER TABLE FOOD DROP COLUMN([컬럼명]);

alter table FOOD modify FOOD_ALLOW default 1;
alter table FOOD_TEMP modify FOOD_ALLOW default 1;

SELECT * FROM FOOD_PHOTO;
DELETE FROM FOOD_PHOTO;

CREATE TABLE FOOD_PHOTO_TEMP AS SELECT * FROM FOOD_PHOTO WHERE 1=2;
SELECT * FROM FOOD_PHOTO_TEMP;
DELETE FROM FOOD_PHOTO_TEMP;
CREATE SEQUENCE SEQ_FP_TEMP_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

SELECT * FROM FOOD RIGHT OUTER JOIN FOOD_PHOTO USING(FOOD_NO) WHERE FOOD_NO = 2901530;
SELECT * FROM ALL_SEQUENCES WHERE SEQUENCE_NAME = 'SEQ_FP_NO';

INSERT INTO FOOD_PHOTO_TEMP (FP_NO,FOOD_NO,FP_NAME,FP_MAIN) VALUES(SEQ_FP_TEMP_NO.NEXTVAL,2901530,'http://tong.visitkorea.or.kr/cms/resource/12/2901512_image2_1.jpg',1);
SELECT * FROM FOOD_PHOTO_TEMP fpt 

SELECT * FROM FOOD LEFT OUTER JOIN FOOD_PHOTO USING(FOOD_NO);

MERGE INTO FOOD F
USING FOOD_TEMP T
   ON (F.FOOD_NO = T.FOOD_NO)
 WHEN MATCHED THEN
   UPDATE SET F.FOOD_OPENTIME = T.FOOD_OPENTIME
   			, F.FOOD_MENU = T.FOOD_MENU
   			, F.FOOD_PHONE = T.FOOD_PHONE   
;

--MERGE INTO FOOD F
--USING FOOD_TEMP T
--   ON (F.FOOD_NO = T.FOOD_NO)
-- WHEN MATCHED THEN
--   UPDATE SET F.FOOD_NAME = T.FOOD_NAME
--   			, F.FOOD_ADDRESS = T.FOOD_ADDRESS
-- WHEN NOT MATCHED THEN
--   INSERT(FOOD_NO,FOOD_NAME,FOOD_ADDRESS) 
--   VALUES(T.FOOD_NO,T.FOOD_NAME,T.FOOD_ADDRESS)
--;
--
--MERGE INTO FOOD_PHOTO F
--USING FOOD_PHOTO_TEMP T
--   ON (F.FOOD_NO = T.FOOD_NO)
-- WHEN MATCHED THEN
--   UPDATE SET F.FP_NAME = T.FP_NAME
--   			, F.FP_MAIN = T.FP_MAIN
-- WHEN NOT MATCHED THEN
--   INSERT(FP_NO, FOOD_NO, FP_NAME, FP_MAIN) 
--   VALUES(SEQ_FP_NO.NEXTVAL, T.FOOD_NO, T.FP_NAME, T.FP_MAIN)
--;
SELECT * FROM FOOD_TEMP ft ;
UPDATE FOOD_TEMP SET
				FOOD_OPENTIME='09:00~18:00',
				FOOD_MENU='말고기,양고기,닭고기',
				FOOD_PHONE='010-1234-1234'
			WHERE FOOD_NO = 2901530;
		
MERGE INTO FOOD_PHOTO F
			  USING FOOD_PHOTO_TEMP T
				 ON (F.FP_NAME = T.FP_NAME)
			  WHEN NOT MATCHED THEN
			  	 INSERT(FP_NO,FOOD_NO,FP_NAME,FP_MAIN)
			   	 VALUES(SEQ_FP_NO.NEXTVAL,T.FOOD_NO,T.FP_NAME,T.FP_MAIN)
;

SELECT * FROM FOOD_TEMP WHERE EXISTS (SELECT FOOD_NO FROM FOOD_TEMP);

SELECT *
FROM FOOD_TEMP
WHERE EXISTS(SELECT * FROM FOOD_TEMP WHERE FOOD_NO != NULL);

>>>>>>> branch 'main' of https://github.com/HSH-1616/FinalProject_Developers