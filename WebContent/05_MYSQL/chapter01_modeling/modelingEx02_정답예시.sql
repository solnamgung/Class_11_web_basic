/* 
  	1) RENTCAR 데이터베이스를 생성 및 사용하기
*/

CREATE DATABASE RENTCAR;
USE RENTCAR;       



/*    
	2) CAR 테이블을 생성하기.
    
		[ 컬럼명 ] 
		CAR_CD   		글자 (20)
		CAR_NM    		글자 (20)
		CATEGORY 		글자 (20)
		PRICE 			숫자
		COMPANY_CD      글자 (10)
		IMAGE_NM		글자 (100)
		INFO       		글자 (500)
*/

CREATE TABLE CAR(
	CAR_CD 			VARCHAR(20),
	CAR_NM 			VARCHAR(20),
	CATEGORY 		VARCHAR(20),
	PRICE 			INT,
	COMPANY_CD 		VARCHAR(10),
	IMAGE_NM		VARCHAR(100),
	INFO			VARCHAR(500)
);



/*    
	3) MEMBER 테이블을 생성하기.
    
		[ 컬럼명 ] 
		MEMBER_ID   	 글자 (20)
		MEMBER_NM    	 글자 (20)
		PWD  	 		 글자 (20)
		AGE    	 		 숫자
		HP 		 		 글자 20)
		IFNO      		 글자 500)
		JOIN_DT 		 날짜 (시간)
*/

CREATE TABLE MEMBER(
	MEMBER_ID 	VARCHAR(20),
	MEMBER_NM 	VARCHAR(20),
	PWD 		VARCHAR(20),
	AGE 		INT,
	HP 			VARCHAR(20),
	INFO		VARCHAR(500),
	JOIN_DT		DATETIME
);



/*    
	3) RESERVE 테이블을 생성하기.
    
		[ 컬럼명 ] 
		RESERVE_CD  글자 (20)
		START_DT  	날짜 (시간)
		END_DT		날짜 (시간)
		MEMBER_ID	글자 (20)
		CAR_CD		글자 (20)
		
*/

CREATE TABLE RESERVE(
	RESERVE_CD 	VARCHAR(20),
	START_DT 	DATETIME,
	END_DT 		DATETIME,
	MEMBER_ID 	VARCHAR(20),
	CAR_CD		VARCHAR(20)
);



/*        
	4) CAR 테이블 삭제하기
*/
DROP TABLE CAR;



/*        
	5) MEMBER 테이블 삭제하기
*/
DROP TABLE MEMBER;



/*        
	6) RESERVE 테이블 삭제하기
*/
DROP TABLE RESERVE;



/*
	7) RENTCAR 데이터베이스 삭제하기    
*/    
DROP DATABASE RENTCAR; 