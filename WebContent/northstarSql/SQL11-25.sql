
	//11 매장별 사원수
	SELECT 
					s.STORE_CODE       AS  STORE_CODE,
					s.STORE_ADDR       AS  STORE_ADDR,
					COUNT(e.EMP_CODE)  AS  EMP_COUNT
			FROM
					BURGER_STORE s
	   LEFT JOIN
					BURGER_EMP e
			  ON
			  		e.STORE_CODE = s.STORE_CODE
	       GROUP BY 
	      			s.STORE_CODE,
	      		    s.STORE_ADDR;
		
	//12 매장별 매출
	
	    SELECT
	    		s.STORE_CODE   AS  STORE_CODE ,
	    		s.STORE_ADDR   AS  STORE_ADDR ,
	    		SUM(o.AMOUNT)  AS  TOT_AMOUNT
		FROM 
				BURGER_STORE s
        JOIN
   				BURGER_ORD_ITEM o 
   		  ON
   		  		o.STORE_CODE = s.STORE_CODE 
  	GROUP BY 
  				s.STORE_CODE ,
  				s.STORE_ADDR ;
  				
  	//13 품목구분별 매출액 구하라			
  		SELECT 		
					ITEM_NAME    AS  ITEM_NAME,
					SUM(AMOUNT)  AS  TOTAL_AMT
			  FROM
			  		BURGER_ITEM b
	  	 LEFT JOIN
	  		  		BURGER_ORD_ITEM O 
	  		    ON
	  		    	o.ITEM_CODE = b.ITEM_CODE   		    	
	      GROUP BY
	      			b.ITEM_NAME ;
	      			
	      					
  				
  				
  	// 14 . 최근 30일 이내 가장 많이 팔린 상품 3개와 매출액을 구하라. 2018년 3월 31일 기준 (3/1~3/31)	
  				
	  		 SELECT	
		     		b.ITEM_NAME     AS  상품,
		     		SUM(o.AMOUNT)   AS  판매액
	     	   FROM
	     	   		BURGER_ITEM b
	   		   JOIN
	   		   		BURGER_ORD_ITEM o
		   		 ON
		   			o.ITEM_CODE = b.ITEM_CODE 
		   	   JOIN
		   	   		BURGER_ORD bo
		   	   	 ON
		   	   	 	bo.ORD_CODE = o.ORD_CODE 
			  WHERE 
			 		bo.ORD_DATE >= '20180301' AND bo.ORD_DATE <= '20180302'
			
			GROUP BY 
					b.ITEM_NAME 
	   	   ORDER BY
	   	   			판매액 DESC
	   	      FETCH
	   	     		FIRST 3 ROWS ONLY ;
	   	   		
   	   					
  				
  	// 15) 2017.03 중 가장 많이 팔린 상품 순으로 나열 하시고, 판매 수량도 같이 적어라 (단, 세트메뉴는 구성된 단품으로 ....)!
  				
  			
  		SELECT 
	  			COUNT(*)
		  FROM
		  		BURGER_ORD_ITEM; //123,627
		  		
		  	
	  	SELECT 
	  			  b.ITEM_CODE    AS  상품코드,
		  		  b.ITEM_NAME    AS  상품명,
		  	 COUNT(o.ORD_CODE)   AS  판매수량
		  FROM
		  		BURGER_ITEM b
  		  JOIN 
  				BURGER_ORD_ITEM o
			ON 
				o.ITEM_CODE = b.ITEM_CODE 
      GROUP BY 
      			b.ITEM_CODE,
      			b.ITEM_NAME
      	HAVING
      			
       ORDER BY
       			판매수;
       			
       			SELECT I.ITEM_CODE, SUM(O.QTY) AS TOTAL_QTY
				FROM EXAM.BURGER_ITEM I
				JOIN EXAM.BURGER_ORD_ITEM O
				ON I.ITEM_CODE = O.ITEM_CODE
				WHERE I.SET_YN = 'N' AND O.CANCEL_YN = 'N' AND O.ORD_CODE IN (
				  SELECT ORD_CODE FROM EXAM.BURGER_ORD WHERE ORD_DATE BETWEEN '20170301' AND '20170331'
				)
				GROUP BY I.ITEM_CODE
				ORDER BY TOTAL_QTY DESC;
				
				
	//16
			
			SELECT 
		  ITEM_NAME,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201701' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS JAN,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201702' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS FEB,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201703' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS MAR,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201704' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS APR,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201705' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS MAY,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201706' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS JUN,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201707' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS JUL,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201708' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS AUG,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201709' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS SEP,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201710' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS OCT,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201711' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS NOV,
		  SUM(
		    CASE 
		      WHEN SUBSTR(ORD_DATE, 1, 6) = '201712' THEN AMOUNT 
		      ELSE 0 
		    END
		  ) AS DEC
		FROM 
		  BURGER_ORD_ITEM 
		  JOIN 
		  BURGER_ORD 
		  ON
		  BURGER_ORD.ORD_CODE = BURGER_ORD_ITEM.ORD_CODE
		  JOIN
		  BURGER_ITEM 
		  ON BURGER_ORD_ITEM.ITEM_CODE = BURGER_ITEM.ITEM_CODE 
		WHERE 
		  SUBSTR(ORD_DATE, 1, 4) = '2017' 
	 GROUP BY 
  			GROUPING SETS ((ITEM_NAME), ())
		  
		// GROUP BY 
  			ROLLUP(ITEM_NAME);
  				
  		
		  //17 시간대별 매출을 구하라 
				  
				  SELECT
			  STORE_ADDR  AS 지점,
			  EMP_NAME	  AS 사원,
		  SUM(
		    CASE
		      WHEN TO_CHAR(ORD_TIME, 'HH24') BETWEEN '00' AND '05' THEN BURGER_ORD_ITEM.AMOUNT
		      ELSE 0
		    END
		  ) AS "00~06",
		  SUM(
		    CASE
		      WHEN TO_CHAR(ORD_TIME, 'HH24') BETWEEN '06' AND '12' THEN BURGER_ORD_ITEM.AMOUNT
		      ELSE 0
		    END
		  ) AS "06~13",
		  SUM(
		    CASE
		      WHEN TO_CHAR(ORD_TIME, 'HH24') BETWEEN '13' AND '19' THEN BURGER_ORD_ITEM.AMOUNT
		      ELSE 0
		    END
		  ) AS "13~20",
		  SUM(
		    CASE
		      WHEN TO_CHAR(ORD_TIME, 'HH24') BETWEEN '20' AND '23' THEN BURGER_ORD_ITEM.AMOUNT
		      ELSE 0
		    END
		  ) AS "20~24"
		FROM
		     BURGER_STORE 
		JOIN 
			 BURGER_EMP 
		  ON 
		  	 BURGER_EMP.STORE_CODE = BURGER_STORE.STORE_CODE
		JOIN
			 BURGER_ORD 
		  ON
		  	 BURGER_ORD.STORE_CODE = BURGER_STORE.STORE_CODE AND BURGER_ORD.EMP_CODE = BURGER_EMP.EMP_CODE 
		JOIN
			 BURGER_ORD_ITEM
		  ON
			 BURGER_ORD.ORD_CODE = BURGER_ORD_ITEM.ORD_CODE
		GROUP BY
				  STORE_ADDR,
				  EMP_NAME;

		  
  				
  				
  				
  				
  				
  				
  				
	
				