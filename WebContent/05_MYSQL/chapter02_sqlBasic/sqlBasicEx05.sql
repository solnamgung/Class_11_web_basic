/*
	
	# 비교 연산자

		>   : 크다.
		<   : 작다.
		>=  : 크거나 같다.
		<=  : 작거나 같다. 
		=   : 같다.    		(! 자바의 == 연산자와 다르다.)
		<>  : 다르다.  		(! 자바와 != 연산자와 다르다.)


	- 문자열 및 날짜 형식도 대소동등 비교 연산이 가능하다.
	- 자바의 조건식과 같이 WHERE 뒤에 조건식에 해당하는 데이터를 조회할 수 있다.

*/


INSERT INTO PRODUCT VALUES ('P10001' , '게이밍마우스패드' , 24850 , '2020-02-11'),
						   ('P10002' , '조립 PC' , 1000000 , '2020-06-30'),
						   ('P10003' , '브리츠 2채널 스피커' , 30750 , '2020-08-08'),
						   ('P10004' , '기계식키보드 화이트(적축)', 38150 , '2020-12-30'),
						   ('P10005' , 'USB 8GB', 4700 , '2021-01-07'),
						   ('P10005' , 'USB 16GB' , 8340 , '2021-06-27'),
						   ('P10005' , 'USB 허브' , 23500 , '2021-12-20');
						    
SELECT * FROM PRODUCT;  


# 가격이 10000원 이하의 상품 전체 컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRICE <= 10000;

		
# 가격이 10000원 초과의 상품 전체 컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRICE > 10000;  
		
        
# 상품코드가 'P10001'인 상품 전체 컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_CD = 'P10001';

		
# 상품코드가 'P10001'이 아닌 상품 전체 컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_CD <> 'P10001';
        
		
# 상품코드가 'P10004'이상인 상품 전체 컬럼 조회		
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_CD >= 'P10004';
		
        
# 상품등록 날짜가 2021년 이후부터의 상품의 전체 컬럼 조회		
SELECT
		*
FROM
		PRODUCT
WHERE
		REG_DT >= '2021-01-01';
		
	
	
/*


	# DISTINCT 
	
		- 중복을 제거한 값을 컬럼을 조회한다.
		

*/
SELECT
		PRODUCT_CD
FROM	
		PRODUCT;


SELECT	DISTINCT
		PRODUCT_CD
FROM	
		PRODUCT;
		
				
/*

	# 논리연산자 ( and , or , not )
	
		- 자바와 같다.
		- not > and > or 의 연산 순위를 가진다.

*/

# 상품코드가 'P10001' , 'P10003' , 'P10005'인 상품의 전체컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_CD = 'P10001' OR 
        PRODUCT_CD = 'P10003' OR
        PRODUCT_CD = 'P10005';
    

# 상품가격이 20000 ~ 50000인 상품의 전체컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRICE >= 20000 AND PRICE <= 50000;

		
# 상품가격이 20000 ~ 50000이 아닌 상품의 전체컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		NOT (PRICE >= 20000 AND PRICE <= 50000);

		
# 상품가격이 20000 ~ 50000이면서 2021년도 등록상품의 전체컬럼 조회		
SELECT
		*
FROM
		PRODUCT
WHERE
		(PRICE >= 20000 AND PRICE <= 50000) AND
		(REG_DT >= '2021-01-01' AND REG_DT <= '2021-12-31');
    
    
# 상품 등록날짜가 2020년도 1~3월 , 2021년도 1~3월 등록상품의 전체컬럼 조회
SELECT
		*
FROM	
		PRODUCT
WHERE
		(REG_DT >= '2020-01-01' AND REG_DT <= '2020-03-31') OR
		(REG_DT >= '2021-01-01' AND REG_DT <= '2021-03-31');


/*		
	
    # between 
    
		- 2개의 범위 사이의 값을 조회할 때 사용한다. ( 시작값과 종료값 포함 ) 
        
        [ 형식 ]
		
			컬럼 BETWEEN 시작값 AND 종료값  
        
    
    # in 
	
		- 특정 값이 있으면 포함된 값을 조회한다.
		
		[ 형식 ]
        
			IN (값1,값2,...값N)
    
*/
		
# 상품가격이 20000 ~ 50000인 상품의 전체컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRICE BETWEEN 20000 AND 50000;
		# PRICE >= 20000 AND PRICE <= 50000;
		
        
# 상품가격이 20000 ~ 50000이 아닌 상품의 전체컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRICE NOT BETWEEN 20000 AND 50000;
	
	
# 2021년에 등록된 상품의 전체컬럼 조회		
SELECT
		*
FROM	
		PRODUCT
WHERE
		REG_DT BETWEEN '2021-01-01' AND '2021-12-31';


# 2021년에 등록되지 않은 상품의 전체컬럼 조회		
SELECT
		*
FROM	
		PRODUCT
WHERE
		REG_DT NOT BETWEEN '2021-01-01' AND '2021-12-31';

		
# 상품코드가 'P10001' , 'P10003' , 'P10005'인 상품의 전체컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_CD IN ('P10001' , 'P10003' , 'P10005');

		
# 상품코드가 'P10001' , 'P10003' , 'P10005'이 아닌 상품의 전체컬럼 조회
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_CD NOT IN ('P10001' , 'P10003' , 'P10005');


/*

	# like 
    
		- 패턴 매칭기법으로 패턴에 매칭된 데이터만 조회한다. 
		- 데이터 매칭 와일드카드로 %를 사용한다.
        - 데이터 자리수 매칭 와일드 카드로 _를 사용한다.
    
    
*/
		
# 상품명에 '스피커'단어가 들어있는 상품의 전체 컬럼 검색
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_NM LIKE "%스피커%";

		
# 상품명에 'USB'단어가 들어있는 상품의 전체 컬럼 검색
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_NM LIKE "%USB%";
	
	
# 상품명이 'U'로 시작하는 상품의 전체 컬럼 검색
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_NM LIKE "U%";
        
		
# 상품명이 'GB'로 끝나는 상품의 전체 컬럼 검색
SELECT
		*
FROM
		PRODUCT
WHERE
		PRODUCT_NM LIKE "%GB";
        
        
/*

	# 테이블 조회 정렬 ORDER BY 

		- 오름차순 정렬 ASC와 내림차순 정렬 DESC 2가지가 있다.
        - 조건식이 있을 경우 WHERE절 밑에 작성한다.
		- DESC를 명시하지 않으면 기본 값으로 ASC로 작동한다.
		- 여러가지의 컬럼을 정렬 할 수 있다.
    	- 기본적으로 정렬방식에 컬럼명을 작성하나 인덱스로 작성할 수도 있다.

*/


# 상품의 전체 컬럼 검색 (가격이 낮은 순서대로 정렬)
SELECT
		*
FROM
		PRODUCT
ORDER BY 
		PRICE; # PRICE ASC;
	
	
# 상품의 전체 컬럼 검색 (가격이 높은 순서대로 정렬)
SELECT
		*
FROM
		PRODUCT
ORDER BY 
		PRICE DESC; 
		
        
# 상품의 전체 컬럼 검색 (상품코드가 높은 순서대로 정렬)
SELECT
		*
FROM
		PRODUCT
ORDER BY 
		PRODUCT_CD DESC; 

		
# 상품의 전체 컬럼 검색 (최신상품으로 정렬)
SELECT
		*
FROM
		PRODUCT
ORDER BY 
		REG_DT DESC; 
		
        
# 2021년도에 등록된 상품의 전체 컬럼 검색 (가격이 높은 순서대로 정렬)
SELECT
		*
FROM
		PRODUCT
WHERE
		REG_DT BETWEEN '2021-01-01' AND '2021-12-31'
ORDER BY
		PRICE DESC;
		
        
# 상품의 전체 컬럼 검색 (가격이 높은 순서대로 정렬 , 최신순으로 정렬)
SELECT
		*
FROM
		PRODUCT
ORDER BY
		PRICE DESC,
        REG_DT DESC;


# 상품의 전체 컬럼 검색 (가격이 낮은 순서대로 정렬 , 최신순으로 정렬)
SELECT
		*
FROM
		PRODUCT
ORDER BY
		PRICE ASC,
        REG_DT DESC;
        
        
# 상품의 전체 컬럼 검색 (최신순으로 정렬 , 가격이 높은 순으로 정렬)
SELECT
		*
FROM
		PRODUCT
ORDER BY
		REG_DT DESC,
		PRICE DESC;
 
/*
 
	# LIMIT : 특정 개수만큼 레코드 조회하기
    
    [ 형식 ]
	LIMIT x 	: x row만 조회
	LIMIT x,y   : x번째 부터 y row만 조회
    
    Ex)
		LIMIT 3      : 3row만 조회
		LIMIT 12     : 12row만 조회
		LIMIT 10,3   : 10번째부터 3row만 조회
		LIMIT 100,10 : 100번째부터 10row만 조회
        
 */
 		
# 가격이 가장 높은 3개의 상품의 전체 컬럼 조회
SELECT
		*
FROM
		PRODUCT
ORDER BY
		PRICE DESC
LIMIT
		3;
 
 		
# 가장 최신에 등록된 3개의 상품의 전체 컬럼 조회
SELECT
		*
FROM
		PRODUCT
ORDER BY
		REG_DT DESC
LIMIT
		3;
 
 
# 최신에 등록된 3개의 상품의 전체 컬럼 조회 (2번째 래코드 이후부터 조회)
SELECT
		*
FROM
		PRODUCT
ORDER BY
		REG_DT DESC
LIMIT
		2 , 3;		
		
DELETE FROM PRODUCT;
