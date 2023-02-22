//11
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

  //12

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
  			
  			
	//13
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
	
	   //14
	   
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
   	   		
   	   		//혜원씨
   	   		SELECT * 
				FROM 
				    (SELECT ITEM.ITEM_NAME 상품명, SUM(I.AMOUNT) 매출액
				     FROM BURGER_ORD_ITEM I, BURGER_ITEM ITEM,
				         (SELECT ORD_CODE, ORD_DATE
				          FROM BURGER_ORD
				          WHERE ORD_DATE>='20180301' AND ORD_DATE <='20180331') ORD_LIST
				     WHERE I.ORD_CODE = ORD_LIST.ORD_CODE AND ITEM.ITEM_CODE = I.ITEM_CODE
				     GROUP BY ITEM.ITEM_NAME
				     ORDER BY 2 DESC)
				WHERE ROWNUM < 4;
   	   		
   	   	//정현
   	   	select item_name 상품, 판매액 from
			(
			    select item_name, sum(qty), sum(amount) "판매액"
			    from burger_ord_item b
			    join burger_ord o using(ord_code)
			    join burger_item i using(item_code)
			    where b.cancel_yn = 'N' and
			    ord_date between to_date('20180301') and to_date('20180331')
			    group by item_name
			    order by sum(qty) desc
			    )
			where rownum <4;
	
		//이사님 -> 가독성
		SELECT b.ITEM_CODE,
		b.ITEM_NAME,
		,
		   FROM(
		   
		   SELECT  item_code, qty, sum(AMOUNT) total_amount 
			FROM   BURGER_ORD a
			     , BURGER_ORD_ITEM b
			     , BURGER_ITEM c
			WHERE 1 = 1
			  AND a. store_code = b.STORE_CODE 
			  AND a.ORD_CODE = b.ORD_CODE 
			  AND a.ord_date BETWEEN '20180301' AND '20180331'
			GROUP BY	
						item_code
			ORDER BY 		
					total_amount DESC 
		   )a
		   ,burger_item b
		   WHERE 1=1
		   AND 
		  WHERE ROW  < 4;


	  	// 15) 2017.03월 중 가장 많이 팔린 상품 순으로 나열 하고, 판매 수량도 같이 적어라 (단, 세트메뉴는 구성된 단품으로 ....)!	
	  	
	
	  	
	  	SELECT
    REGEXP_REPLACE(ITEM_CODE, '[^1-9]', '') AS 상품코드,
    ITEM_NAME AS 상품명,
    SUM(판매수량) AS 판매수량
FROM (
    SELECT 
        oi.item_code AS 상품코드, SUM(QTY) AS 판매수량
    FROM
        BURGER_ORD_ITEM oi
        JOIN BURGER_ORD o
            ON o.ORD_CODE = oi.ORD_CODE
    WHERE 
        1 = 1
        AND oi.SET_YN  = 'N'
        AND o.ORD_DATE BETWEEN '20170301' AND '20170331'
    GROUP BY
        oi.item_code
    UNION ALL
    SELECT 
        s.UNIT_ITEM_CODE AS 상품코드, SUM(QTY*UNIT_QTY) AS 판매수량
    FROM
        BURGER_ORD_ITEM bi
        JOIN BURGER_ORD o
            ON o.ORD_CODE = bi.ORD_CODE 	
        JOIN BURGER_SET_ITEM s
            ON s.SET_ITEM_CODE = bi.ITEM_CODE 
    WHERE
        1 = 1
        AND bi.SET_YN = 'Y'
        AND o.ORD_DATE BETWEEN '20170301' AND '20170331'
    GROUP BY
        s.UNIT_ITEM_CODE
) a
JOIN BURGER_ITEM 
    ON a.상품코드 = ITEM_CODE 
GROUP BY
    a.상품코드, ITEM_NAME
ORDER BY
    판매수량 DESC;

	  		  	
	  	
	  	
	  	    SELECT 	
	  	    	  REGEXP_REPLACE(ITEM_CODE, '[^1-9]', '') 	AS 상품코드,
	  	    	  ITEM_NAME		AS 상품명,
	  	    	  SUM(판매수량)		AS 판매수량
  	    	 FROM (
  	    	 		SELECT 
  	    	 			  oi.item_code AS 상품코드, SUM(QTY) AS 판매수량
  	    	 		  FROM
  	    	 		  	   BURGER_ORD_ITEM oi
    	 		  	  JOIN
    	 		  	  	   BURGER_ORD o
    	 		  	  	ON
    	 		  	  		o.ORD_CODE = oi.ORD_CODE
    	 		  	  WHERE 
    	 		  	  		1 = 1
    	 		  	        AND oi.SET_YN  = 'N'
    	 		  	        AND o.ORD_DATE BETWEEN '20170301' AND '20170331'
 		  	        GROUP BY 	
 		  	        		상품코드
 		  	        
 		  	UNION ALL       
 		  	        	
 		  	  SELECT 	
 		  	  		 s.UNIT_ITEM_CODE AS 상품코드, SUM(QTY*UNIT_QTY) AS 판매수량
  	  		    FROM
					BURGER_ORD_ITEM bi
				JOIN
					BURGER_ORD o
				  ON
				  	o.ORD_CODE = bi.ORD_CODE 	
		  		JOIN 	
		  			BURGER_SET_ITEM s
	  			  ON
	  			  	s.SET_ITEM_CODE = bi.ITEM_CODE 
  	  		   WHERE
  	  		   		1 = 1
  	  		   	 AND
  	  		   	 	bi.SET_YN = 'Y'
  	  		   	 AND 
  	  		   	 	o.ORD_DATE BETWEEN '20170301' AND '20170331'
	   	 	GROUP BY 
	   	 			상품코드	  	  		
  	    	 		) a
	 		 JOIN
	 		 	  BURGER_ITEM 
	 		   ON 
	 		   	  a.상품코드 = ITEM_CODE 
	 		GROUP BY
	 				 a.상품코드, ITEM_NAME
	 		ORDER BY 
	 				판매수량 DESC ;
	
	//정현	
				select to_number(to_char(상품코드, 'FM00'), '99') as 상품코드, item_name, sum(판매수량) as 판매수량 
			from
			(
			    select oi.item_code as 상품코드, sum(qty) as 판매수량
			    from burger_ord_item oi
			    join burger_ord o on oi.ord_code = o.ord_code
			    where oi.cancel_yn = 'N' and
			    oi.set_yn = 'N' and
			    ord_date between to_date('20170301') and to_date('20170331')
			    group by oi.item_code
			    union ALL
			    select si.unit_item_code as 상품코드, sum(qty*unit_qty) as 판매수량
			    from burger_ord_item oi
			    join burger_ord o on oi.ord_code = o.ord_code
			    left join burger_set_item si on oi.item_code = si.set_item_code
			    where oi.cancel_yn = 'N' and
			    oi.set_yn = 'Y' and
			    ord_date between to_date('20170301') and to_date('20170331')
			    group by si.unit_item_code
			) u
			join burger_item on 상품코드 = item_code
			group by to_number(to_char(상품코드, 'FM00'), '99'), item_name
			order by 판매수량 desc;
				
			
	// 16 가상의 테이블 - > 구조를 이해 하라(가상으로 만들어서 해라 왜냐면 문법이 적용 되지 않을 수 있다.)	
			

	SELECT idx1 FROM dual 
	UNION ALL 
	SELECT idx2 FROM dual


	//내꺼			
		SELECT 
		  COALESCE(ITEM_NAME, '합계') AS ITEM_NAME,
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
  			GROUPING SETS ((ITEM_NAME), ());
  				
  		
 // another way of dual with unionall
 
 // sum of amount for each ITEM_NAME and insert on final column which name will be "합계". don't use rollup and goruping sets
		
	   SELECT 
		  ITEM_NAME, 
		  SUM(JAN) AS JAN, 
		  SUM(FEB) AS FEB,
		  SUM()    AS 합계
		FROM (
		  SELECT 
		    ITEM_NAME,
		    CASE WHEN SUBSTR(ORD_DATE, 1, 6) = '201701' THEN AMOUNT ELSE 0 END AS JAN,
		    CASE WHEN SUBSTR(ORD_DATE, 1, 6) = '201702' THEN AMOUNT ELSE 0 END AS FEB
		    
		    
		  FROM 
		    BURGER_ORD_ITEM 
		    JOIN BURGER_ORD 
		      ON BURGER_ORD.ORD_CODE = BURGER_ORD_ITEM.ORD_CODE
		    JOIN BURGER_ITEM 
		      ON BURGER_ORD_ITEM.ITEM_CODE = BURGER_ITEM.ITEM_CODE 
		  WHERE 
		    SUBSTR(ORD_DATE, 1, 4) = '2017' 
		  
		) t
		GROUP BY ITEM_NAME
		
		UNION ALL
		
		SELECT 
				'총합', SUM(JAN), SUM(FEB)
		  FROM (
			  SELECT 
				    ITEM_NAME,
				    CASE WHEN SUBSTR(ORD_DATE, 1, 6) = '201701' THEN AMOUNT ELSE 0 END AS JAN,
				    CASE WHEN SUBSTR(ORD_DATE, 1, 6) = '201702' THEN AMOUNT ELSE 0 END AS FEB
			    FROM 
			    	 BURGER_ORD_ITEM 
			    JOIN BURGER_ORD 
			      ON BURGER_ORD.ORD_CODE = BURGER_ORD_ITEM.ORD_CODE
			    JOIN BURGER_ITEM 
			      ON BURGER_ORD_ITEM.ITEM_CODE = BURGER_ITEM.ITEM_CODE 
			  WHERE 
		    SUBSTR(ORD_DATE, 1, 4) = '2017' 
		) t;
			 
		
//sec

 SELECT 
		  ITEM_NAME, 
		  SUM(JAN) AS JAN, 
		  SUM(FEB) AS FEB,
		  SUM(AMOUNT) 
		FROM (
		  SELECT 
		    ITEM_NAME,
		    CASE WHEN SUBSTR(ORD_DATE, 1, 6) = '201701' THEN AMOUNT ELSE 0 END AS JAN,
		    CASE WHEN SUBSTR(ORD_DATE, 1, 6) = '201702' THEN AMOUNT ELSE 0 END AS FEB,
		    SUM(AMOUNT) AS AMOUNT
		  FROM 
		    BURGER_ORD_ITEM 
		    JOIN BURGER_ORD 
		      ON BURGER_ORD.ORD_CODE = BURGER_ORD_ITEM.ORD_CODE
		    JOIN BURGER_ITEM 
		      ON BURGER_ORD_ITEM.ITEM_CODE = BURGER_ITEM.ITEM_CODE 
		  WHERE 
		    SUBSTR(ORD_DATE, 1, 4) = '2017' 
		  
		) t
		GROUP BY ITEM_NAME
		
		UNION ALL
		
		SELECT '총합', SUM(JAN), SUM(FEB), SUM(AMOUNT)
		FROM (
		  SELECT 
		    ITEM_NAME,
		    CASE WHEN SUBSTR(ORD_DATE, 1, 6) = '201701' THEN AMOUNT ELSE 0 END AS JAN,
		    CASE WHEN SUBSTR(ORD_DATE, 1, 6) = '201702' THEN AMOUNT ELSE 0 END AS FEB,
		     SUM(AMOUNT) AS AMOUNT
		  FROM 
		    BURGER_ORD_ITEM 
		    JOIN BURGER_ORD 
		      ON BURGER_ORD.ORD_CODE = BURGER_ORD_ITEM.ORD_CODE
		    JOIN BURGER_ITEM 
		      ON BURGER_ORD_ITEM.ITEM_CODE = BURGER_ITEM.ITEM_CODE 
		  WHERE 
		    SUBSTR(ORD_DATE, 1, 4) = '2017' 
		) t;
	
		
			 
  		
  		
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

		  
  				
  				
  				
  				
  				
  				
  				
	
				