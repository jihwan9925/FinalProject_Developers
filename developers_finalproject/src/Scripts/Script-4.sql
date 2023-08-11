SELECT * FROM FOOD;
SELECT * FROM FOOD_temp;
DELETE FROM FOOD_temp;


SELECT * FROM FOOD_temp WHERE EXISTS (SELECT FOOD_NO FROM FOOD_temp);
SELECT * FROM FOOD_PHOTO;
DELETE FROM FOOD_PHOTO;
ALTER TABLE FOOD_PHOTO ADD FP_ID VARCHAR2(100) NULL;

SELECT * FROM FOOD_PHOTO_TEMP;
DELETE FROM FOOD_PHOTO_TEMP;
ALTER TABLE FOOD_PHOTO_TEMP ADD FP_ID VARCHAR2(100) NULL;

SELECT COUNT(*) FROM FOOD_temp;

MERGE INTO FOOD_PHOTO F
			  USING FOOD_PHOTO_TEMP T
				 ON (F.FP_ID = T.FP_ID)
			  WHEN MATCHED THEN
				 UPDATE SET	F.FP_NAME = T.FP_NAME
				   		  , F.FP_MAIN = T.FP_MAIN
			  WHEN NOT MATCHED THEN
			  	 INSERT(FP_NO,FOOD_NO,FP_NAME,FP_MAIN,FP_ID)
			   	 VALUES(SEQ_FP_NO.NEXTVAL,T.FOOD_NO,T.FP_NAME,T.FP_MAIN,T.FP_ID)
			   	 ;
			   	 
SELECT FOOD_MENU FROM FOOD WHERE FOOD_NO = 2788416;