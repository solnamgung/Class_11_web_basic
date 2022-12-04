CREATE DATABASE JOIN_TEST;
USE JOIN_TEST;


CREATE TABLE MEMBER_TB(
    MEMBER_ID 		VARCHAR(20),
	MEMBER_NM 		VARCHAR(50),
	SEX 			VARCHAR(10),
	HP 				VARCHAR(20),
	EMAIL 			VARCHAR(20),
    RESIDENCE		VARCHAR(20)
);

CREATE TABLE PRODUCT_TB(
    PRODUCT_CD 			VARCHAR(20),
    PRODUCT_NM 			VARCHAR(100),
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

# 남자가 주문한 상품의 총 주문량을 조회하기

SELECT
		SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
			 ON O.MEMBER_ID = M.MEMBER_ID
			AND M.SEX = 'm';

			
# 여자가 주문한 상품의 총 주문량을 조회하기

SELECT
		SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
			 ON O.MEMBER_ID = M.MEMBER_ID
			AND M.SEX = 'f';

			
# 서울지역 주민이 주문한 상품의 총 주문량을 조회하기

SELECT
		SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
			 ON O.MEMBER_ID = M.MEMBER_ID
			AND M.RESIDENCE = '서울';
		
			
# 서울지역에 사는 여자가 주문한 상품의 총개수를 조회하기

SELECT
		SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
			 ON O.MEMBER_ID = M.MEMBER_ID
			AND M.RESIDENCE = '서울'
			AND M.SEX = 'f';
			
			
# '서울' , '경기' , '인천' 지역에 사는 여자가 주문한 상품의 총 개수를 조회하기

SELECT
		SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
			 ON O.MEMBER_ID = M.MEMBER_ID
			AND M.RESIDENCE IN ('서울' , '경기' , '인천')
			AND M.SEX = 'f';
			
			
# 남자가 주문한 상품별로 상품의 이름을 조회하되, 주문량의 합이 적은 순서로 정렬하여 3개만 조회하기.

SELECT
		M.SEX,
        P.PRODUCT_NM,
		SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
			 ON O.MEMBER_ID = M.MEMBER_ID
	 INNER JOIN PRODUCT_TB P
	 		 ON P.PRODUCT_CD = O.PRODUCT_CD
			AND M.SEX = 'm'
GROUP BY
		P.PRODUCT_CD
ORDER BY
		SUM(O.ORDER_GOODS_QTY)
LIMIT
		3;
		
		
# 여자가 주문한 상품별로 상품의 이름을 조회하되, 주문량의 합이 많은 순서로 정렬하여 3개만 조회하기.

SELECT
		M.SEX,
        P.PRODUCT_NM,
		SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
			 ON O.MEMBER_ID = M.MEMBER_ID
	 INNER JOIN PRODUCT_TB P
	 		 ON P.PRODUCT_CD = O.PRODUCT_CD
			AND M.SEX = 'f'
GROUP BY
		P.PRODUCT_CD
ORDER BY
		SUM(O.ORDER_GOODS_QTY) DESC
LIMIT
		3;

			
# 2020년에 가장 많이 팔린 상품명 3개를 조회하기.

SELECT
		P.PRODUCT_NM,
		SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN PRODUCT_TB P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.ORDER_DT BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY
		P.PRODUCT_CD
ORDER BY	
		SUM(O.ORDER_GOODS_QTY) DESC
LIMIT 
		3;


# 배송중인 상품의 주문량의 총합을 지역별로 조회하기

SELECT
		M.RESIDENCE,
		SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
             ON O.MEMBER_ID = M.MEMBER_ID
			AND O.DELIVERY_STATUS = "배송중"
GROUP BY
		M.RESIDENCE;


# 'Apple 2020 맥북 에어 13'를 구매한 유저의 아이디와 이름을 조회하기

SELECT
		M.MEMBER_ID 	AS MEMBER_ID ,
		M.MEMBER_NM 	AS MEMBER_NM
FROM
		ORDER_TB O
	 INNER JOIN PRODUCT_TB P
             ON O.PRODUCT_CD = P.PRODUCT_CD
             AND P.PRODUCT_NM = 'Apple 2020 맥북 에어 13'
	 INNER JOIN MEMBER_TB M
			 ON M.MEMBER_ID = O.MEMBER_ID;
			

# 1000000 ~ 2000000가격의 판매된 상품별로 상품의 코드 , 이름 , 총 판매량 조회하기

SELECT
		P.PRODUCT_CD AS PRODUCT_CD,
        P.PRODUCT_NM AS PRODUCT_NM,
        SUM(O.ORDER_GOODS_QTY)
FROM
		ORDER_TB O
	 INNER JOIN PRODUCT_TB P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND P.PRICE BETWEEN 1000000 AND 2000000
GROUP BY
		P.PRODUCT_CD;

		
# 1000000 ~ 2000000가격의 판매된 상품별로 상품의 코드 , 이름 , 총 판매량을 조회하되 판매량이 5개 이상인 상품을 판매량이 높은순서 , 상품이름을 ㄱ~ㅎ 순서로 조회하기

SELECT
		P.PRODUCT_CD 		   AS PRODUCT_CD,
        P.PRODUCT_NM 		   AS PRODUCT_NM,
        SUM(O.ORDER_GOODS_QTY) AS TOTAL_ORDER_GOODS_QTY
FROM
		ORDER_TB O
	 INNER JOIN PRODUCT_TB P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND P.PRICE BETWEEN 1000000 AND 2000000
GROUP BY
		P.PRODUCT_CD
HAVING
		SUM(O.ORDER_GOODS_QTY) >= 5
ORDER BY
		SUM(O.ORDER_GOODS_QTY) DESC,
        P.PRODUCT_NM ASC;
        

# 한번에 주문 수량이 10개 이상인 상품 정보 모두와 주문수량 조회하기.

SELECT
		P.*,
        O.ORDER_GOODS_QTY
FROM
		ORDER_TB O
	 INNER JOIN PRODUCT_TB P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.ORDER_GOODS_QTY >= 10;


# 2020년 동안 판매된 매출총액 조회하기.(가격 * 개수 + 배송비)

SELECT
		SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) AS ANNUAL_2020_SALES
FROM 
		ORDER_TB O
	 INNER JOIN PRODUCT_TB P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.ORDER_DT BETWEEN '2020-01-01' AND '2020-12-31';


# '상품별'로 2020년 동안 판매된 수량(내림차순)순으로 정렬하여 상품코드 , 상품이름 , 상품판매량 조회하기.

SELECT
		P.PRODUCT_CD			AS PRODUCT_CD,
		P.PRODUCT_NM 			AS PRODUCT_NM,
        SUM(O.ORDER_GOODS_QTY)  AS TOTAL_ORDER_COUNT
FROM 
		ORDER_TB O
	 INNER JOIN PRODUCT_TB P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.ORDER_DT BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY
		P.PRODUCT_CD
ORDER BY
		TOTAL_ORDER_COUNT DESC;


# '지역별'로 판매량이 많은 순서대로 정렬하여 지역명과 판매량 조회하기.

SELECT
		M.RESIDENCE			   AS RESIDENCE,
        SUM(O.ORDER_GOODS_QTY) AS TOTAL_ORDER_COUNT
FROM 
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
			 ON O.MEMBER_ID = M.MEMBER_ID
GROUP BY
		M.RESIDENCE
ORDER BY
		TOTAL_ORDER_COUNT DESC;


# 배송이 완료된 상품의 회원테이블의 모든 정보와 배송상태 조회하기.

SELECT
		M.*,
        O.DELIVERY_STATUS	AS DELIVERY_STATUS
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
             ON M.MEMBER_ID = O.MEMBER_ID
			AND O.DELIVERY_STATUS = '배송완료';


# '배송이 완료되지 않은 상품'별로  상품코드 , 상품 이름 , 배송이 완료되지 않은 주문 건수 조회하기.

SELECT
		P.PRODUCT_CD	AS PRODUCT_CD,
		P.PRODUCT_NM	AS PRODUCT_NM,
        COUNT(*)		AS COUNT
FROM
		ORDER_TB O
	 INNER JOIN PRODUCT_TB P
             ON O.PRODUCT_CD = P.PRODUCT_CD
			AND O.DELIVERY_STATUS <> '배송완료'
GROUP BY
		PRODUCT_NM;


# '상품별'로 상품코드,상품이름,판매금액 총합을 판매급액이 많은 순으로 조회하기. 

SELECT
		P.PRODUCT_CD														AS PRODUCT_CD,
		P.PRODUCT_NM														AS PRODUCT_NM,
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) AS TOTAL_SALES
FROM
		ORDER_TB O
	 INNER JOIN PRODUCT_TB P
             ON P.PRODUCT_CD = O.PRODUCT_CD
GROUP BY
		P.PRODUCT_CD
ORDER BY
		TOTAL_SALES DESC;


# '메르켈' 회원의 주문 상품 이름과 배송상태를 조회하기.

SELECT 
		P.PRODUCT_NM    AS PRODUCT_NM,
		O.DELIVERY_STATUS  AS DELIVERY_STATUS
FROM
		ORDER_TB O
 INNER JOIN MEMBER_TB T
		 ON T.MEMBER_ID = O.MEMBER_ID
		AND T.MEMBER_NM = '메르켈'
 INNER JOIN PRODUCT_TB P
         ON P.PRODUCT_CD = O.PRODUCT_CD;


# '메르켈' 회원의 주문금액 총합을 조회하기.

SELECT
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) AS TOTAL_PRICE
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
		     ON M.MEMBER_ID = O.MEMBER_ID
			AND M.MEMBER_NM = '메르켈'
	 INNER JOIN PRODUCT_TB P
             ON P.PRODUCT_CD = O.PRODUCT_CD;


#'사용자'별로 사용자 아이디 , 사용자 이름 , 주문금액 총합을 조회 하기.

SELECT
		M.MEMBER_ID											AS MEMBER_ID,
        M.MEMBER_NM											AS MEMBER_NM,
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) AS TOTAL_PRICE
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
		     ON M.MEMBER_ID = O.MEMBER_ID
	 INNER JOIN PRODUCT_TB P
             ON P.PRODUCT_CD = O.PRODUCT_CD
GROUP BY
		M.MEMBER_ID;


# '사용자'별로 주문금액 총합이 700만원 이상인 회원의 이름을 오름차순으로 정렬하여 조회하기.

SELECT
		M.MEMBER_NM											AS MEMBER_NM,
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) AS TOTAL
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
		     ON M.MEMBER_ID = O.MEMBER_ID
	 INNER JOIN PRODUCT_TB P
             ON P.PRODUCT_CD = O.PRODUCT_CD
GROUP BY
		M.MEMBER_ID
HAVING 
		TOTAL >= 7000000
ORDER BY
		M.MEMBER_NM;


#'사용자'별로 주문금액 총합이 가장 많은 사람 3명의 이름과 총 주문 금액을 순서대로 조회하기.

SELECT
		M.MEMBER_NM												AS MEMBER_NM,
        SUM(P.PRICE * O.ORDER_GOODS_QTY + P.DELIVERY_PRICE) 	AS TOTAL_PRICE
FROM
		ORDER_TB O
	 INNER JOIN MEMBER_TB M
		     ON M.MEMBER_ID = O.MEMBER_ID
	 INNER JOIN PRODUCT_TB P
             ON P.PRODUCT_CD = O.PRODUCT_CD
GROUP BY
		M.MEMBER_NM
ORDER BY 
		 TOTAL_PRICE DESC
LIMIT
		3;
        
DROP DATABASE JOIN_TEST;