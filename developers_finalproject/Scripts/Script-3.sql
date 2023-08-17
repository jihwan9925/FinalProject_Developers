SELECT COUNT(*) FROM FOOD;
ALTER TABLE FOOD_TEMP DROP COLUMN FOOD_TYPE;
DROP SEQUENCE SEQ_FOOD_NO;

SELECT * FROM FOOD_BLACK_LIST;

ALTER TABLE FOOD DROP COLUMN FOOD_ID;

ALTER TABLE FOOD MODIFY FOOD_NO NOT NULL;
ALTER TABLE FOOD
ADD CONSTRAINT FOOD_TEMP_PK PRIMARY KEY(FOOD_ID);
SELECT * FROM ALL_CONSTRAINTS
WHERE CONSTRAINT_NAME = 'SYS_C0072815';

CREATE TABLE FOOD_TEMP AS SELECT * FROM FOOD WHERE 1=2;

SELECT * FROM FOOD_TEMP WHERE FOOD_NO = 2995934;

INSERT INTO FOOD_TEMP (FOOD_NO, FOOD_NAME, FOOD_ADDRESS) VALUES (2995934,'강릉한우마크나인','강원특별자치도 강릉시 경강로2255번길 13');
			
UPDATE FOOD_TEMP SET
				FOOD_OPENTIME=#{foodOpenTime},
				FOOD_MENU=#{foodMenu},
				FOOD_PHONE=#{foodPhone}
			WHERE FOOD_NO = #{foodNo}
			
			UPDATE FOOD_Photo SET
				FP_NAME=#{fpName},
				FP_MAIN=#{fpMain},
				FP_ID=#{fpId}
			WHERE FOOD_NO = #{foodNo}

SELECT * FROM FOOD;
SELECT * FROM FOOD_temp;
SELECT * FROM FOOD_photo;
SELECT * FROM FOOD_photo_temp;

selectFoodPhotoByNo

SELECT * FROM FOOD_photo;
SELECT * FROM food f LEFT JOIN FOOD_PHOTO fp using(food_no) WHERE fp_no = 2906287;
DELETE FROM FOOD;
DELETE FROM FOOD_temp;
DELETE FROM FOOD_PHOTO;
DELETE FROM FOOD_PHOTO_TEMP;
CREATE TABLE FOOD_TEMP AS SELECT * FROM FOOD WHERE 1=2;

UPDATE 테이블명 AS A SET 복사될 컬럼명 = (SELECT 복사할 컬럼명 FROM 테이블명 AS B WHERE A.매칭컬럼 = B.매칭컬럼);
UPDATE FOOD_TEMP A SET FOOD_ID = (SELECT FOOD_NO FROM FOOD B WHERE A.FOOD_NO = B.FOOD_NO);

SELECT * FROM FOOD_TEMP;
DELETE FROM FOOD_TEMP;

SELECT * FROM FOOD LEFT OUTER JOIN FOOD_PHOTO USING(FOOD_NO) WHERE ROWNUM <= 50 ORDER BY FOOD_NO DESC;

ALTER TABLE FOOD DROP COLUMN([컬럼명]);
INSERT INTO 복사할테이블명 SELECT * FROM 테이블명 [WHERE 절];
ALTER TABLE FOOD ADD FOOD_ID NUMBER;
INSERT INTO FOOD_TEMP SELECT * FROM FOOD;

SELECT * FROM FOOD JOIN FOOD_TEMP USING(FOOD_NO);

alter table FOOD modify FOOD_ALLOW default 1;
alter table FOOD_TEMP modify FOOD_ALLOW default 1;

SELECT * FROM FOOD_PHOTO;
DELETE FROM FOOD_PHOTO;

CREATE TABLE FOOD_PHOTO_TEMP AS SELECT * FROM FOOD_PHOTO WHERE 1=2;
SELECT * FROM FOOD_PHOTO_TEMP;
DELETE FROM FOOD_PHOTO_TEMP;

CREATE SEQUENCE SEQ_FT_NO
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

SELECT * FROM FOOD_REVIEW fr ;
DELETE FROM FOOD_REVIEW;

SELECT * FROM FOOD_REVIEW_PHOTO frp ;
DELETE FROM FOOD_REVIEW_PHOTO;

CREATE SEQUENCE SEQ_RP_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

SELECT * FROM FOOD_REVIEW fr ;

SELECT * 
FROM FOOD_REVIEW 
LEFT OUTER JOIN FOOD_REVIEW_PHOTO USING(FR_NO) 
LEFT OUTER JOIN MEMBER USING(MEMBER_ID)
WHERE FOOD_NO = 2906155;

SELECT * 
FROM FOOD
LEFT OUTER JOIN FOOD_REVIEW USING(FOOD_NO)
LEFT OUTER JOIN FOOD_REVIEW_PHOTO USING(FR_NO) 
WHERE FOOD_NO = 2906287;

SELECT * FROM FOOD RIGHT OUTER JOIN FOOD_PHOTO USING(FOOD_NO) 
			LEFT OUTER JOIN FOOD_REVIEW USING(FOOD_NO)
			LEFT OUTER JOIN FOOD_REVIEW_PHOTO USING(FR_NO)
			LEFT OUTER JOIN MEMBER USING(MEMBER_ID)
			WHERE FOOD_NO = 2906287
			ORDER BY FR_WRITE_DATE DESC;
			
		SELECT * FROM FOOD RIGHT OUTER JOIN FOOD_PHOTO USING(FOOD_NO) 
			LEFT OUTER JOIN FOOD_REVIEW USING(FOOD_NO)
			LEFT OUTER JOIN FOOD_REVIEW_PHOTO USING(FR_NO) 
			LEFT OUTER JOIN MEMBER USING(MEMBER_ID)
			WHERE FOOD_NO = 2906287 ORDER BY FR_WRITE_DATE DESC;

SELECT * FROM ACCOMMODATION a ;
SELECT * FROM AC_FILE;

SELECT * FROM MEMBER;

SELECT * FROM FOOD_REVIEW fr ;

UPDATE FOOD_REVIEW SET
				FR_CONTENT ='사장님이 친절하고 음식이 맛있어요 ^^',
				FR_GRADE =3.5,
				FR_WRITE_DATE = SYSDATE
			WHERE FR_NO = 44;
		
SELECT * FROM FOOD_REVIEW_PHOTO frp ;

SELECT RP_NO FROM FOOD_REVIEW_PHOTO WHERE FR_NO = 45;

UPDATE FOOD_REVIEW_PHOTO SET
				FR_NO =44,
				RP_NAME ='TEST파일.jpg',
				RP_RENAME = '20230814_123123123_0814.jpg'
			WHERE RP_NO = 62;


		
		
CREATE TABLE FOOD_BLACK_LIST(
    FOOD_NO NUMBER 
);
SELECT * FROM FOOD;
DELETE FROM FOOD_BLACK_LIST;
INSERT INTO FOOD_BLACK_LIST VALUES(123123);

SELECT * FROM FOOD_PHOTO WHERE FOOD_NO = 2995934;

			  MERGE INTO FOOD F
			  USING FOOD_TEMP T
				 ON (F.FOOD_PHONE IS NULL)
 			  WHEN MATCHED THEN
				 UPDATE SET F.FOOD_OPENTIME = T.FOOD_OPENTIME
				   		  , F.FOOD_MENU = T.FOOD_MENU
				   		  , F.FOOD_PHONE = T.FOOD_PHONE
				   		  , F.FOOD_ALLOW  = T.FOOD_ALLOW
				   		  , F.FOOD_READCOUNT = T.FOOD_READCOUNT
		      WHEN NOT MATCHED THEN
			  	 INSERT(FOOD_NO,FOOD_NAME,FOOD_ADDRESS,FOOD_ALLOW)
			   	 VALUES(T.FOOD_NO,T.FOOD_NAME,T.FOOD_ADDRESS,T.FOOD_ALLOW);