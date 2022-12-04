/*    
    1) SHOPPING 데이터베이스를 생성하고 사용하기.
*/	

CREATE DATABASE SHOPPING;
USE SHOPPING;



/*    
    2) MEMBER_TB 테이블을 생성하기.
    
    	[ 컬럼명 ] 
    	
		MEMBER_ID 	글자(100)
		MEMBER_NM 	글자(50)
		GENDER 		글자(10)
		HP 			글자(20)
		EMAIL 		글자(20)
		RESIDENCE	글자(20)
*/

CREATE TABLE MEMBER_TB (
    MEMBER_ID 	VARCHAR(100),
	MEMBER_NM 	VARCHAR(50),
	GENDER 		VARCHAR(10),
	HP 			VARCHAR(20),
	EMAIL 		VARCHAR(20),
    RESIDENCE	VARCHAR(20)
);



/*    
    3) PRODUCT_TB 테이블을 생성하기.
    
    	[ 컬럼명 ] 
    	
		PRODUCT_CD 		글자(100)
		PRODUCT_NM 		글자(100)
		PRICE 			숫자
		DELIVERY_PRICE 	숫자
*/

CREATE TABLE PRODUCT_TB (
    PRODUCT_CD 		VARCHAR(100),
    PRODUCT_NM 		VARCHAR(100),
	PRICE 			INT,
	DELIVERY_PRICE 	INT
);



/*    
    4) ORDER_TB 테이블을 생성하기.
    
    	[ 컬럼명 ] 
		ORDER_CD 		 글자(100)
		MEMBER_ID 		 글자(100)
		PRODUCT_CD		 글자(100)
		ORDER_GOODS_QTY  숫자
		DELIVERY_MESSAGE 글자(100)
		DELIVERY_STATUS  글자(10)
		ORDER_DT 		 날짜(시간)
*/

CREATE TABLE ORDER_TB (
	ORDER_CD 		 VARCHAR(100),
	MEMBER_ID 		 VARCHAR(100),
    PRODUCT_CD		 VARCHAR(100),
	ORDER_GOODS_QTY  INT,
    DELIVERY_MESSAGE VARCHAR(100),
    DELIVERY_STATUS  VARCHAR(10),
	ORDER_DT 		 DATETIME
);



/*    
    5) MEMBER_TB 테이블을 삭제하기.
*/
DROP TABLE MEMBER_TB;

/*    
    6) PRODUCT_TB 테이블을 삭제하기.
*/
DROP TABLE PRODUCT_TB;

/*    
    7) ORDER_TB 테이블을 삭제하기.
*/
DROP TABLE ORDER_TB;

 /*   
    8) SHPPOING 데이터베이스 삭제하기
 */
DROP DATABASE SHPPOING;