/*    
    1) BOOKSHOP 데이터베이스를 생성하고 사용하기.
*/	

CREATE DATABASE BOOKSHOP;
USE BOOKSHOP;



/*    
    2) MANAGER 테이블을 생성하기.
    	
    	[ 컬럼명 ] 
    
		MANAGER_ID (글자 20)
		PASSWD 	   (글자 500)
*/

CREATE TABLE MANAGER (
	MANAGER_ID VARCHAR(20),
    PASSWD 	   VARCHAR(500)
);



/*    

    3) MEMBER 테이블을 생성하기.
    
    	[ 컬럼명 ] 
    	
		MEMBER_ID 글자(20)
		MEMBER_NM 글자(20)
		PASSWD 	  글자(16)  
		REG_DT    날짜(일자)
		ADDRESS   글자(100)
		TEL 	  글자(20)
        
*/

CREATE TABLE MEMBER (
	MEMBER_ID VARCHAR(20),
	MEMBER_NM VARCHAR(20),
    PASSWD 	  VARCHAR(16),  
    REG_DT    DATE,
    ADDRESS   VARCHAR(100),
    TEL 	  VARCHAR(20)
);



/*    
    4) BOOK 테이블을 생성하기.
    
    	[ 컬럼명 ] 
    	
		BOOK_CD 		글자(100)
		TITLE 			글자(100)
		BOOK_PRICE 		숫자
		AUTHOR 			글자(40)
		PUBLISHING_COM 	글자(30)
		PUBLISHING_DT	날짜(일자)
		CONTENT 		글자(500)
		DISCOUNT_RATE 	숫자	
*/

CREATE TABLE BOOK (
	BOOK_CD 		VARCHAR(100),
    TITLE 			VARCHAR(100),
    BOOK_PRICE 		INT,
    AUTHOR 			VARCHAR(40),
    PUBLISHING_COM 	VARCHAR(30),
    PUBLISHING_DT	DATE,
    CONTENT 		VARCHAR(500),
    DISCOUNT_RATE 	INT				
);



/*    
    4) BOOK 테이블을 생성하기.
    
    	[ 컬럼명 ] 
    	
		BOOK_CD 		글자(100)
		TITLE 			글자(100)
		BOOK_PRICE 		숫자
		AUTHOR 			글자(40)
		PUBLISHING_COM 	글자(30)
		PUBLISHING_DT	날짜(일자)
		CONTENT 		글자(500)
		DISCOUNT_RATE 	숫자	
*/

CREATE TABLE BOOK (
	BOOK_CD 		VARCHAR(100),
    TITLE 			VARCHAR(100),
    BOOK_PRICE 		INT,
    AUTHOR 			VARCHAR(40),
    PUBLISHING_COM 	VARCHAR(30),
    PUBLISHING_DT	DATE,
    CONTENT 		VARCHAR(500),
    DISCOUNT_RATE 	INT				
);



/*    

    5) CART 테이블을 생성하기.
    	
    	[ 컬럼명 ] 
    
		CART_CD 	글자(100)
		BOOK_CD 	글자(100)
		BUYER 		글자(50)
		BOOK_TITLE  글자(100)
		BUY_PRICE 	숫자
		BUY_CNT 	숫자
		BOOK_IMAGE 	글자(100)
        
*/

CREATE TABLE CART (
	CART_CD 	VARCHAR(100),
	BOOK_CD 	VARCHAR(100),
    BUYER 		VARCHAR(50),
    BOOK_TITLE  VARCHAR(100),
    BUY_PRICE 	INT,
    BUY_CNT 	INT,
    BOOK_IMAGE 	VARCHAR(100)			
);



/*    

    6) BUY 테이블을 생성하기.
     
     	[ 컬럼명 ] 
    
		BUY_ID 		    글자(100)
		BUYER 		   	글자(50)
		BOOK_CD 	   	글자(12)
		BOOK_TITLE     	글자(100)
		BUY_TOT_PRICE   숫자
		BUY_CNT        	숫자
		BUY_DT 	   		날짜(시간)
		DELIVERY_NAME   글자(10)
		DELIVERY_TEL    글자(20)
		DELIVERY_ADRESS 글자(10)
        
*/

CREATE TABLE BUY (
	BUY_ID 		    VARCHAR(100),
    BUYER 		   	VARCHAR(50),
    BOOK_CD 	   	VARCHAR(100),
    BOOK_TITLE     	VARCHAR(100),
    BUY_TOT_PRICE   INT,
    BUY_CNT        	INT,
    BUY_DT 	   		DATETIME,
    DELIVERY_NAME   VARCHAR(10),
    DELIVERY_TEL    VARCHAR(20),
    DELIVERY_ADRESS VARCHAR(10)
);



/*    
    7) BANK 테이블을 생성하기.
    
    	[ 컬럼명 ] 
    	
		BANK_CD    (글자 10)
		BANK_NM    (글자 10)
        ACCOUNT_ID (글자 30)
*/

CREATE TABLE BANK (
	BANK_CD 	VARCHAR(10),
	BANK_NM 	VARCHAR(10),
    ACCOUNT_ID  VARCHAR(30)
);



/*    

    8) QNA 테이블을 생성하기.
    
    	[ 컬럼명 ] 
    
		QNA_CD 		글자(100)
		BOOK_CD 	글자(100)
		QNA_WRITER  글자(20)
		QNA_CONTENT 글자(500)
		REG_DT 		날짜(시간)
        
*/

CREATE TABLE QNA (
	QNA_CD 		VARCHAR(100),
    BOOK_CD 	VARCHAR(100),
    QNA_WRITER  VARCHAR(20),
    QNA_CONTENT VARCHAR(500),
    REG_DT 		DATETIME
);



 /*
	9) MANAGER테이블 삭제하기.
 */
DROP TABLE MANAGER; 

 /*
	10) MEMBER테이블 삭제하기.
 */
DROP TABLE MEMBER; 

 /*
	11) BOOK테이블 삭제하기.
 */
 DROP TABLE BOOK; 
 
 /*
	12) CART테이블 삭제하기
 */
 DROP TABLE CART; 
 
 /*
	13) BUY테이블 삭제하기.
  */
 DROP TABLE BUY; 
 
 /*
	14) BANK테이블 삭제하기.
 */
 DROP TABLE BANK; 

 /*
	15) QNA테이블 삭제하기.
 */
 DROP TABLE QNA;  
 
 /*   
    16) BOOKSHOP데이터 베이스 삭제하기.
 */
DROP DATABASE BOOKSHOP;