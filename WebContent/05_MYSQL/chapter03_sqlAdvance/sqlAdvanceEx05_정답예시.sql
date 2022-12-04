CREATE DATABASE SUBQUERY_TEST;
USE SUBQUERY_TEST;


CREATE TABLE MEMBER_TB(
    MEMBER_ID 		VARCHAR(20),
	MEMBER_NM 		VARCHAR(50),
	SEX 			VARCHAR(10),
	HP 				VARCHAR(20),
	EMAIL 			VARCHAR(20),
    RESIDENCE		VARCHAR(20)
);

CREATE TABLE PRODUCT_TB(
    PRODUCT_CD 		VARCHAR(20),
    PRODUCT_NM 		VARCHAR(100),
	PRICE 			INT,
	DELIVERY_PRICE 	INT
);

CREATE TABLE ORDER_TB(
	ORDER_CD 			VARCHAR(50),
	MEMBER_ID 			VARCHAR(50),
    PRODUCT_CD			VARCHAR(20),
	ORDER_GOODS_QTY 	INT,
    DELIVERY_MESSAGE 	VARCHAR(300),
    DELIVERY_STATUS 	VARCHAR(100),
	ORDER_DT 			DATETIME
);

INSERT INTO MEMBER_TB VALUES('user1', '메르켈' , 'f' , '010-1111-1111' , 'mer@gmail.com'  , '서울');
INSERT INTO MEMBER_TB VALUES('user2', '제임스고슬링' , 'm' , '010-2222-2222' , 'james@gmail.com' , '서울'); 
INSERT INTO MEMBER_TB VALUES('user3', '신사임당' , 'f' , '010-3333-3333' , 'shinsa@naver.com' , '경기');
INSERT INTO MEMBER_TB VALUES('user4', '유관순' , 'f' , '010-4444-4444' , 'yks@gmail.com' , '인천');
INSERT INTO MEMBER_TB VALUES('user5', '데니스리치' , 'm' , '010-5555-5555' , 'denis@gmail.com' , '부산');
INSERT INTO MEMBER_TB VALUES('user6', '팀버너스리' , 'm' , '010-6666-6666' , 'tim@naver.com' , '대구');
INSERT INTO MEMBER_TB VALUES('user7', '스티븐워즈니악' , 'm' , '010-7777-7777' , 'stevenw@gmail.com' , '경기');
INSERT INTO MEMBER_TB VALUES('user8', '선덕여왕' , 'f' , '010-8888-8888' , 'seonduk@gmail.com' , '서울');
INSERT INTO MEMBER_TB VALUES('user9', '스티브잡스' , 'm' , '010-9999-9999' , 'jobs@daum.net' , '부산');
INSERT INTO MEMBER_TB VALUES('user10', '빌게이츠' , 'm' , '010-1010-1010' , 'bill@naver.com' , '서울');

INSERT INTO PRODUCT_TB VALUES('product1', '삼성전자 2021 노트북 플러스2 15.6' , 598000 , 0 );    
INSERT INTO PRODUCT_TB VALUES('product2', '삼성전자 2021 갤럭시북 15.6' , 1208000 , 0 );
INSERT INTO PRODUCT_TB VALUES('product3', 'LG전자 10세대 코어i7 윈10탑재 17형 LG 그램 2020년형 17Z90N' , 2149000 , 0);
INSERT INTO PRODUCT_TB VALUES('product4', 'LG전자 2021그램 360 14' , 1740000 , 0 );
INSERT INTO PRODUCT_TB VALUES('product5', 'LG전자 2020 울트라 PC 14' , 477000 , 0 );
INSERT INTO PRODUCT_TB VALUES('product6', '2020 맥북 프로 13' , 2129650 , 3000 );
INSERT INTO PRODUCT_TB VALUES('product7', 'Apple 2020 맥북 에어 13' , 1489800 , 3000 );
INSERT INTO PRODUCT_TB VALUES('product8', '레노버 2021 IdeaPad Slim3 15.6' , 2129650 , 2500 );
INSERT INTO PRODUCT_TB VALUES('product9', '기가바이트 2021 Gaming G5 15.6' , 1499000 , 2500 );
INSERT INTO PRODUCT_TB VALUES('product10', 'HP 2021 노트북 15s' , 768840 , 2500 );

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

# 한번에 주문 수량이 10개 이상인 상품 정보 조회하기.
              
SELECT
		*
FROM
		PRODUCT_TB 
WHERE 
		PRODUCT_CD IN (SELECT 
								PRODUCT_CD
						FROM
								ORDER_TB 
						WHERE 
								ORDER_GOODS_QTY >= 10) ;     



# 한번에 제일 많은 수량을 주문한 주문 코드 조회하기.

SELECT
		ORDER_CD
FROM
		ORDER_TB
WHERE
		ORDER_GOODS_QTY = (SELECT 
									MAX(ORDER_GOODS_QTY) 
						   FROM 
									ORDER_TB);



# 한번에 제일 많은 수량을 주문한 상품명 조회하기.

SELECT
		PRODUCT_NM
FROM
		PRODUCT_TB
WHERE
		PRODUCT_CD = (SELECT
								PRODUCT_CD
						FROM
								ORDER_TB
						WHERE
								ORDER_GOODS_QTY = (SELECT 
															MAX(ORDER_GOODS_QTY) 
												   FROM 
															ORDER_TB));        
		
        
        
# 한번에 제일 많은 수량을 주문한 유저의 모든 정보 조회하기.

SELECT
		*
FROM
		MEMBER_TB
WHERE
		MEMBER_ID = (SELECT
							MEMBER_ID
					FROM
							ORDER_TB
					WHERE
							ORDER_GOODS_QTY = (SELECT 
														MAX(ORDER_GOODS_QTY) 
												FROM 
														ORDER_TB));       
                            
                                
                                
# 배송이 완료된 상품의 회원테이블의 모든 정보 조회하기.

SELECT
		*
FROM
		MEMBER_TB 
WHERE
		MEMBER_ID IN (SELECT 
							MEMBER_ID 
					  FROM 
							ORDER_TB 
					  WHERE 
							DELIVERY_STATUS = '배송완료');



# 배송이 완료되지 않은 상품의 상품명 조회하기.

SELECT
		PRODUCT_NM
FROM
		PRODUCT_TB 
WHERE
		PRODUCT_CD IN (SELECT 
								PRODUCT_CD 
						FROM 
								ORDER_TB 
						WHERE 
								DELIVERY_STATUS <> '배송완료');


# '메르켈' 회원이 주문한 상품 코드와 주문상품 명을 조회하기.

SELECT
		PRODUCT_CD,
		PRODUCT_NM
FROM 
		PRODUCT_TB
WHERE
		PRODUCT_CD IN (SELECT
								PRODUCT_CD
						FROM 
								ORDER_TB
						WHERE 
								MEMBER_ID = (SELECT
													MEMBER_ID
											FROM
													MEMBER_TB
											WHERE	
													MEMBER_NM = "메르켈")) ;


# '메르켈' 회원의 총 주문수량을 조회하기.

SELECT
		SUM(ORDER_GOODS_QTY)
FROM
		ORDER_TB
WHERE 
		MEMBER_ID = (SELECT
							MEMBER_ID
					FROM
							MEMBER_TB
					WHERE
							MEMBER_NM = "메르켈");
  
  
  
# 서울지역의 모든 제품의 판매수량의 총합을 조회하기.

SELECT
		SUM(ORDER_GOODS_QTY)
FROM
		ORDER_TB
WHERE
		MEMBER_ID IN (SELECT
								MEMBER_ID
					  FROM
								MEMBER_TB
					  WHERE
								RESIDENCE = '서울');



# 삼성전자 2021 노트북 플러스2 15.6이 판매된 지역을 조회하기.

SELECT DISTINCT
		RESIDENCE
FROM
		MEMBER_TB
WHERE
		MEMBER_ID IN (SELECT
							MEMBER_ID
					FROM
							ORDER_TB
					WHERE 
							PRODUCT_CD = (SELECT
													PRODUCT_CD
											FROM
													PRODUCT_TB
											WHERE
													PRODUCT_NM = '삼성전자 2021 노트북 플러스2 15.6'));



# 2020년 동안 판매된 상품의 양이 5개 미만인 상품 이름 조회하기.

SELECT
		PRODUCT_NM
FROM
		PRODUCT_TB
WHERE
		PRODUCT_CD IN (SELECT 
								PRODUCT_CD
						FROM 
								ORDER_TB 
						WHERE 
								ORDER_DT BETWEEN '2020-01-01' AND '2020-12-31'
						GROUP BY 
								PRODUCT_CD 
						HAVING
								SUM(ORDER_GOODS_QTY) < 5);
                                
                                

# user4가 주문한 주문보다 주문을 많이 한 회원의 아이디와 주문개수를 조회하기.

SELECT
		MEMBER_ID,
		SUM(ORDER_GOODS_QTY) AS TOTAL_ORDER
FROM
		ORDER_TB
GROUP BY
		MEMBER_ID
HAVING
		TOTAL_ORDER > (SELECT 
								SUM(ORDER_GOODS_QTY) 
						FROM 
								ORDER_TB 
						WHERE 
								MEMBER_ID = 'user4');
								
DROP DATABASE SUBQUERY_TEST;