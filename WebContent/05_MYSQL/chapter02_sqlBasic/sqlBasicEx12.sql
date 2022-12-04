/*
   
		 # 집계함수 
		 
			 1) COUNT : 조회될 데이터들의 개수를 가져온다.
			 2) SUM   : 조회될 데이터들의 합을 가져온다.
			 3) AVG   : 조회될 데이터들의 평균을 가져온다.
			 4) MAX   : 조회될 데이터들의 최대값을 가져온다.
			 5) MIN   : 조회될 데이터들의 최소값을 가져온다.
         
         
         #  GROUP BY
         
			- 출력된 레코드를 그룹으로 묶고 각 그룹에대한 요약 값을 계산한다. ( 집계함수랑 같이 사용해야 한다. )
				
			[ 형식 ]
                
			SELECT 
				집계함수(<필드명>) 
			FROM 
				<테이블명> 
            GROUP BY 
				<필드명> 
			
                            
		 # HAVING
			
            - GROUP BY문법에 조건식을 추가할경우 HAVING을 사용한다.
        
			[ 형식 ]
                
			SELECT 
				집계함수(<필드명>) 
			FROM 
				<테이블명> 
			{WHERE					생략가능
				<조건식>}
            GROUP BY 
				<필드명> 
			HAVING 
				<GROUP BY조건>
        
 */	
CREATE DATABASE DML_TEST;
USE DML_TEST;

CREATE TABLE ORDER_TB(
	ORDER_CD 			VARCHAR(50),
	MEMBER_ID 			VARCHAR(50),
    PRODUCT_CD			VARCHAR(20),
	ORDER_GOODS_QTY 	INT,
    DELIVERY_MESSAGE 	VARCHAR(300),
    DELIVERY_STATUS 	VARCHAR(100),
	ORDER_DT 			DATETIME
);

INSERT INTO ORDER_TB VALUES('order1', 'user1' , 'product1' ,  1 , '배송전 연락 주세요.' , '배송준비중' , '2019-01-03');
INSERT INTO ORDER_TB VALUES('order2', 'user1' , 'product2' ,  1 , '배송전 연락 주세요.' , '배송준비중' , '2019-02-25');
INSERT INTO ORDER_TB VALUES('order3', 'user1' , 'product3' ,  1 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-03-12');
INSERT INTO ORDER_TB VALUES('order4', 'user5' , 'product8' ,  2 , '배송전 연락 주세요.' ,  '배송중' , '2019-04-11');
INSERT INTO ORDER_TB VALUES('order5', 'user6' , 'product2' ,  2 , '배송전 연락 주세요.' , '배송준비중' , '2019-05-30');
INSERT INTO ORDER_TB VALUES('order6', 'user3' , 'product1' ,  1 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-06-01');
INSERT INTO ORDER_TB VALUES('order7', 'user2' , 'product2' ,  2 , '배송전 연락 주세요.' , '배송준비중' , '2019-07-12');
INSERT INTO ORDER_TB VALUES('order8', 'user10' , 'product1' ,  10 ,  '배송전 연락 주세요.' , '배송준비중' , '2019-12-25');
INSERT INTO ORDER_TB VALUES('order9', 'user9' , 'product2' ,  2 ,  '문 앞에 놓고 벨 눌러주세요.' , '배송중' , '2020-01-07');
INSERT INTO ORDER_TB VALUES('order10', 'user5' , 'product10' , 1 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-02-28');
INSERT INTO ORDER_TB VALUES('order11', 'user7' , 'product4' , 1 , '경비실에 맡겨 주세요.' , '배송완료' , '2020-03-03');
INSERT INTO ORDER_TB VALUES('order12', 'user2' , 'product4' , 2 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-04-27');
INSERT INTO ORDER_TB VALUES('order13', 'user8' , 'product3' , 1 , '배송전 연락 주세요' , '배송완료' , '2020-05-05');
INSERT INTO ORDER_TB VALUES('order14', 'user9' , 'product7' , 2 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-05-08');
INSERT INTO ORDER_TB VALUES('order15', 'user3' , 'product2' , 3 ,  '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-06-27');
INSERT INTO ORDER_TB VALUES('order16', 'user3' , 'product9' , 10 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-07-08');
INSERT INTO ORDER_TB VALUES('order17', 'user4' , 'product7' , 7 ,  '경비실에 맡겨 주세요.' , '배송중' , '2020-08-15');
INSERT INTO ORDER_TB VALUES('order18', 'user6' , 'product6' , 3 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-10-03');
INSERT INTO ORDER_TB VALUES('order19', 'user7' , 'product6' , 12 , '문 앞에 놓고 벨 눌러주세요.' , '배송완료' , '2020-11-11');
INSERT INTO ORDER_TB VALUES('order20', 'user10' , 'product8' , 5 , '배송전 연락 주세요' , '배송중' , '2020-12-20');

        

# 전체 주문개수를 조회하기
SELECT
		COUNT(*)
FROM
		ORDER_TB;


# 배송이 완료된 주문개수를 조회하기
SELECT
		COUNT(*)
FROM
		ORDER_TB
WHERE
		DELIVERY_STATUS = '배송완료';
      
      		
# 배송준비중인 주문개수를 조회하기
SELECT
		COUNT(*)
FROM
		ORDER_TB
WHERE
		DELIVERY_STATUS = '배송준비중';      
        
		
# 'product1'상품의 주문개수를 조회하기
SELECT
		COUNT(*)
FROM
		ORDER_TB
WHERE
		PRODUCT_CD = 'product1';

		
# 'product1'상품의 총 판매 수량을 조회하기
SELECT
		SUM(ORDER_GOODS_QTY)
FROM
		ORDER_TB
WHERE
		PRODUCT_CD = 'product1';    
        
		
# 'product1'상품의 평균 주문량을 조회하기
SELECT
		AVG(ORDER_GOODS_QTY)
FROM
		ORDER_TB
WHERE
		PRODUCT_CD = 'product1';            
     
     
# 'user3'의 주문개수를 조회하기.
SELECT
		COUNT(*)
FROM	
		ORDER_TB
WHERE
		MEMBER_ID = 'user3';
 
 
# 주문량이 제일 많았던 주문량을 조회하기.
SELECT
		MAX(ORDER_GOODS_QTY)
FROM
		ORDER_TB;

		
# 주문량이 제일 적었던 주문량을 조회하기.
SELECT
		MIN(ORDER_GOODS_QTY)
FROM
		ORDER_TB;


# 'user1' , 'user2' , 'user3' 의 주문개수 조회하기 (3 유저의 주문개수(O), 3 유저별 주문개수(X))
SELECT
		COUNT(*)
FROM	
		ORDER_TB
WHERE
		MEMBER_ID IN ('user1' , 'user2' , 'user3');


# 'product1' , 'product3' , 'product5' 의 총 주문상품량 조회하기
SELECT
		SUM(ORDER_GOODS_QTY)
FROM	
		ORDER_TB
WHERE
		PRODUCT_CD IN ('product1' , 'product3' , 'product5');       
     
     
# 사용자별로 주문상품의 개수를 조회하기
SELECT
		MEMBER_ID,
		COUNT(*)
FROM
		ORDER_TB
GROUP BY
		MEMBER_ID;
    
		
# 사용자별로 총 주문상품의 양을 조회하기
SELECT
		MEMBER_ID,
		SUM(ORDER_GOODS_QTY)
FROM
		ORDER_TB
GROUP BY
		MEMBER_ID;	
        
		
# 배송상태별로 주문개수를 조회하기
SELECT
		DELIVERY_STATUS,
		COUNT(*)
FROM	
		ORDER_TB
GROUP BY
		DELIVERY_STATUS;

    		
# 배송완료가 아닌 배송상태별로 주문개수를 조회하기
SELECT
		DELIVERY_STATUS,
		COUNT(*)
FROM	
		ORDER_TB
WHERE	
		DELIVERY_STATUS <> '배송완료'
GROUP BY
		DELIVERY_STATUS;

        
# 상품별로 주문상품의 총수량을 조회하기
SELECT
		PRODUCT_CD,
		SUM(ORDER_GOODS_QTY)
FROM
		ORDER_TB
GROUP BY
		PRODUCT_CD;
	
	
# 상품별로 주문상품의 총 판매량을 조회하고 판매량이 10개 이상인 상품만 조회하기
SELECT
		PRODUCT_CD,
		#SUM(ORDER_GOODS_QTY)
		SUM(ORDER_GOODS_QTY) AS TOTAL_QTY
FROM
		ORDER_TB
GROUP BY
		PRODUCT_CD
HAVING
		#SUM(ORDER_GOODS_QTY) >= 10;
        TOTAL_QTY >= 10;
        

# 사용자별로 배송상태별로 주문상품의 총수량을 조회하기
SELECT
		MEMBER_ID,
        DELIVERY_STATUS,
		SUM(ORDER_GOODS_QTY)
FROM
		ORDER_TB
GROUP BY
		MEMBER_ID,
        DELIVERY_STATUS
ORDER BY
		MEMBER_ID DESC;


# 사용자별로 배송상태별로 2020년에 주문한 주문상품의 총수량을 조회하기
SELECT
		MEMBER_ID,
        DELIVERY_STATUS,
        ORDER_DT,
		SUM(ORDER_GOODS_QTY)
FROM
		ORDER_TB
WHERE
		ORDER_DT BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY
		MEMBER_ID,
        DELIVERY_STATUS
ORDER BY
		MEMBER_ID DESC;


# 연도별로 총 주문건수 , 주문수량 조회하기.
SELECT
		SUBSTR(ORDER_DT , 1 , 4),
		COUNT(*),
        SUM(ORDER_GOODS_QTY)
FROM
		ORDER_TB
GROUP BY
		SUBSTR(ORDER_DT , 1 , 4);





DROP TABLE ORDER_TB;
