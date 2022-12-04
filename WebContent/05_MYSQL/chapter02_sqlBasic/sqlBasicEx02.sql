/*

	# 데이터 조작어 (DML : Data Manipulation Language) > UPDATE문
	
	 - 데이터베이스의 레코드를 수정한다.
	 - 대부분 where절과 같이 사용한다.

	[ 레코드 수정 형식 ]
    
   - UPDATE 
   			테이블명 
   	 SET 
   	 		컬럼명1 = 값1 ,
   	 		컬럼명2 = 값2
   	 WHERE
   	 		조건식
   
  
  
  EX) 
		UPDATE 
				MEMBER 
		SET 
				NAME = 'JACKSON', 
				HEIGHT = '185.1' 
		WHERE 
				NO = 3;

*/
UPDATE PRODUCT SET PRODUCT_NM = '조립 PC' WHERE PRODUCT_CD = 'P10003';

UPDATE
		PRODUCT
SET
		PRICE = 1000000,
        REG_DT = NOW()
WHERE
		PRODUCT_CD = 'P10003';

UPDATE
		PRODUCT
SET
		PRICE = PRICE + 1000,
        REG_DT = NOW()
WHERE
		PRODUCT_CD = 'P10003';


UPDATE
		PRODUCT
SET
		PRICE = 30750,
        REG_DT = NOW()
WHERE
		PRODUCT_CD = 'P10004';


UPDATE
		PRODUCT
SET
		REG_DT = NOW()
WHERE
		PRODUCT_CD = 'P10005';

COMMIT;