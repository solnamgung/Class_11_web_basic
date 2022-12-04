/* 

	# SQL (Structured Query Language)
	
		- SQL(Structured Query Language)은 관계형 데이터베이스 관리 시스템(RDBMS)의 데이터를 관리하기 위해 설계된 특수 목적의 프로그래밍 언어이다. 	
		- 관계형 데이터베이스 관리 시스템에서 자료의 검색과 관리, 데이터베이스 스키마 생성과 수정, 데이터베이스 객체 접근 조정 관리를 위해 고안되었다. 		
		- 많은 수의 데이터베이스 관련 프로그램들이 SQL을 표준으로 채택하고 있다.		
		- 데이터베이스 언어 SQL 문법의 종류는 다음과 같이 구별된다.
		
			1) 데이터 정의 언어 (DDL : Data Definition Language)   		 Ex) CREATE , DROP , ALTER 
			2) 데이터 조작 언어 (DML : Data Manipulation Language) 		 Ex) SELECT , INSERT , UPDATE , DELETE 
			3) 데이터 제어 언어 (DCL : Data Control Language)	   		 Ex) GRANT , REVOKE
			4) 트랜잭션 제어 언어 (TCL : Transaction Control Language)   EX) COMMIT , ROLLBACK
		
*/
			
	
/*

	# 데이터베이스(database)
	
	- 여러 사람이 공유하여 사용할 목적으로 체계화하여 통합, 관리하는 데이터의 집합
	- 작성된 목록으로써 여러 응용 시스템들의 통합된 정보들을 저장하여 운영할 수 있는 공용 데이터들의 묶음

	[ 데이터 베이스 생성 형식 ]

		- CREATE DATABASE DB_NAME;

		EX) CREATE DATABASE BMS;
		
*/	
CREATE DATABASE TEST_DB;

/*
	
    [ 데이터 베이스 사용 형식 ]
		
        - USE DB_NAME;
			
		EX) USE BMS;

*/
USE TEST_DB;



/*

	# 테이블
	
	- 테이블(table)은 데이터베이스에서 행(가로, row, record)과 열(세로, column, field)로 짜여진 표에 기록된 데이터의 집합이다. 

	[ 테이블 생성 형식 ]

	- CREATE TABLE TABLE_NAME(FIELD1 TYPE, FIELD2 TYPE , .....);
	- 테이블명은 관용적으로 앞에 T_를 붙이기도 한다.
    - 테이블명은 관용적으로 앞에 TB_를 붙이기도 한다.
    - 테이블명은 관용적으로 뒤에 TB_를 붙이기도 한다.
    
	- 데이터 타입
		숫자 : INT , BIGINT
		문자열 : VARCHAR(최대길이) 
				최대길이를 초과할 수 없으며 최대길이보다 적은 데이터가 입력되면 입력된 데이터만큼의 자원이 할당된다.
				""  , '' 모두 사용가능하다.
        실수  : DOUBLE
		문자  : CHAR
		날짜  : DATE , DATETIME , TIMESTAMP
     
	   EX)
	   CREATE TABLE T_ADMIN_GOODS (
			NO INT,
			NAME VARCHAR (15),
			PHONE VARCHAR (15)
	   );
	   
*/

/*

 	[ 자주 사용되는 컬럼명 약어 ]
 	
 	1. CD > CODE  (ORDER_CD , ITEM_CD , PARTNER_CD , DEPT_CD)
 	2. NM > NAME  (ORDER_NM , ITEM_NM , PARTNER_NM , DEPT_NM)
 	3. DT > DATE  (JOIN_DT , REG_DT , START_DT , MODIFY_DT , ENROLL_DT)
 	4. NO > NUMBER (REPLY_NO , BOARD_NO , NOTICE_NO) 
 	5. CNT > COUNT (LOGIN_USER_CNT , CLIENT_CNT , MANAGER_CNT , EMPLOYEE_CNT)
 	6. AMT > AMOUNT (STOCK_AMT , RENTAL_FEE_AMT , PO_AMT)
 	7. QTY > QUANTITY (ORDER_QTY , PRODT_ORDER_QTY , ORDER_QTY_IN_BASE_UNIT , PROD_QTY_IN_ORDER_UNIT)
 	8. FL  > FLAG (ENROLL_FT , CONFIRM_FT , DEL_FT) 
 	9. YN  > YES OR NO (AGREE_YN)
 	
 */
CREATE TABLE T_MEMBER(
	
    MEMBER_ID 		VARCHAR(10),
    MEMBER_NAME 	VARCHAR(10),
    MEMBER_AGE 		INT,
    MEMBER_HEIGHT   DOUBLE,
    MEMBER_WEIGHT   DOUBLE,
    MEMBER_SEX	    CHAR,
    MEMBER_REG_DATE DATE

);



/*

	[ 테이블 관련 정보 확인 명령어 ]
	
    - DESC TABLE_NAME;
    
    EX) DESC T_SHOPPING_GOODS;
    
*/ 
DESC T_MEMBER;



/*
			
	[ 테이블 삭제 형식 ]
	- DROP TABLE TABLE_NAME;

*/
DROP TABLE T_MEMBER;


/*
	
	[ 데이터 베이스 삭제 형식 ]
	- DROP DATABASE DB_NAME;
		
		EX) DROP DATABASE TEST_DB;
*/
DROP DATABASE TEST_DB;


/*	
			
	 +@) 단축키 
	 
	 1) 실행 : 마우스 블록 + CTRL + SHIFT + ENTER
	 2) 대문자 전환 : CTRL + SHFIT + U
	 3) 쿼리 정렬 : CTRL + B
         
*/