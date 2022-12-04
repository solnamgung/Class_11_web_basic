/*

	# 데이터 조작어 (DML :  Data Manipulation Language) > SELECT문

	- 데이터베이스에 들어 있는 데이터를 조회하거나 검색하기 위한 명령어
	
	
	[ 레코드 출력 형식 ]
    
   - SELECT  컬럼명1, 컬럼명2, ...  
   	  FROM 테이블명 
   	  
   - SELECT  컬럼명1, 컬럼명2, ...  
   	 FROM 테이블명
   	 WHERE 조건절
   	 GROUP BY 그룹컬럼명
   	 HAVING 그룹핑 조건절
   	 ORDER BY 정렬방식
   	 
   - SELECT문의 실행 순서
   FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
   	 
   	  

   EX)
	   1) 전체 컬럼 조회
	   SELECT  
				* 
	   FROM 
				MEMBER;
	   
	   2) 특정 컬럼 조회
	   SELECT 
				NO,
				NAME 
	   FROM 
				MEMBER;

*/

# 실습을 위한 데이터 셋팅 예시
INSERT INTO PRODUCT VALUES ('P10000' , 'USB 허브' , 23500 , NOW()),
						   ('P10001' , '모니터받침대' , 8340 , NOW()),
						   ('P10002' , '게이밍마우스패드' , 24850 , NOW()),
						   ('P10003' , '조립 PC' , 1000000 , NOW()),
						   ('P10004' , '브리츠 2채널 스피커' , 30750 , NOW()),
						   ('P10005' , '기계식키보드 화이트(적축)', 38150 , NOW()),
						   ('P10006' , '먼지제거제', 4700 , NOW());

# 전체 컬럼 조회
SELECT * FROM PRODUCT;


# PRODUCT_CD 컬럼만 조회
SELECT
		PRODUCT_CD
FROM 	
		PRODUCT;

		
# PRODUCT_CD , PRODUCT_NM 컬럼만 조회	
SELECT
		PRODUCT_CD,
        PRODUCT_NM
FROM 	
		PRODUCT;
        
		
# PRODUCT_CD , PRODUCT_NM , PRICE컬럼만 조회	  
SELECT
		PRODUCT_CD,
        PRODUCT_NM,
        PRICE
FROM 	
		PRODUCT;
		
        
# PRODUCT_CD , PRODUCT_NM , PRICE , REG_DT 컬럼만 조회	
SELECT
		PRODUCT_CD,
        PRODUCT_NM,
        PRICE,
        REG_DT
FROM 	
		PRODUCT;
        
        
# 컬럼을 적는 순서에 따라 보이는 화면이 달라진다.
SELECT
		PRICE,
		REG_DT,
        PRODUCT_CD,
        PRODUCT_NM
FROM 	
		PRODUCT;
      
      
SELECT
		REG_DT,
        PRODUCT_CD,
        PRODUCT_NM,
        PRICE
FROM 	
		PRODUCT;

		
# 테이블에 존재하지 않는 연산 데이터를 조회 할 수 있다. AS 키워드로 별칭을 지정할 수 있으며 별칭을 생략 가능하다.
SELECT
		PRICE,
        PRICE - 2000  		AS DISCOUNT_PRICE,
        PRICE * 0.1	  		AS ADDITIONAL_TAX,
        PRICE + PRICE * 0.1 TOTAL_PRICE
FROM
		PRODUCT;


DELETE FROM PRODUCT;
