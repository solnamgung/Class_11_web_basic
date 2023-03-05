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
				
			
-- 16 가상의 테이블 - > 구조를 이해 하라(가상으로 만들어서 해라 왜냐면 문법이 적용 되지 않을 수 있다.)	

 
   	  
   	  -- 인덱스 가공하지마, 조인을 걸때 
   	 
   	
  --*******************************************상품코드****************************************************************	
   	  	SELECT 
				CASE WHEN indexCol = 1     THEN ITEM_CODE ELSE '합계' END    AS 상품코드,
				CASE WHEN indexCol = 1     THEN ITEM_NAME ELSE '합계' END    AS 상품명,
				SUM(CASE WHEN indexCol = 1 THEN AMT_JAN ELSE AMT_JAN END )  AS JAN,
				SUM(CASE WHEN indexCol = 1 THEN AMT_FEB ELSE AMT_FEB END )  AS FEB,
				SUM(TOTAL_SUM) AS 합계
	
		  FROM
		  		(
		  		  SELECT
		  		  		boi.ITEM_CODE, 
		  		  		bi.ITEM_NAME ,
		  		  		SUM(CASE WHEN SUBSTR(bo.ORD_DATE, 5, 2) ='01' THEN boi.AMOUNT ELSE 0 END) AS AMT_JAN,
		  		  		SUM(CASE WHEN SUBSTR(bo.ORD_DATE, 5, 2) ='02' THEN boi.AMOUNT ELSE 0 END) AS AMT_FEB,
		  		  		SUM(boi.AMOUNT) AS TOTAL_SUM
	  		  	   FROM
	  		  	   		BURGER_ORD bo,
	  		  	   		BURGER_ORD_ITEM boi,
	  		  	   		BURGER_ITEM bi
	  	   		  WHERE 
	  	   		  		1 = 1
	  	   		  		AND bo.ORD_CODE = boi.ORD_CODE
	  	   		  		AND boi.ITEM_CODE = bi.ITEM_CODE
	  	   		  		AND bo.ORD_DATE LIKE '2017%'
   		  		GROUP BY 
   		  				 bi.ITEM_NAME 
		  		) T ,		  			
		  		(
		  		  SELECT 1 indexCol FROM DUAL
		  		  UNION ALL
		  		  SELECT 2 indexCol FROM DUAL 
		  		) U  
		  		GROUP BY 
				    CASE WHEN indexCol = 1 THEN 상품코드 ELSE '합계' END, 
				    CASE WHEN indexCol = 1 THEN 상품명 ELSE '합계' END
		  	    ORDER BY 1;
		  	   
   	 --********************************************혜원씨꺼*********************************************************** 
   	  
   	   SELECT CASE WHEN IDX=1 THEN ITEM_CODE ELSE '합계' END   AS 상품코드
      ,SUM(CASE WHEN IDX=1 THEN AMOUNT_01 ELSE AMOUNT_01 END) AS JAN
      ,SUM(CASE WHEN IDX=1 THEN AMOUNT_02 ELSE AMOUNT_02 END) AS FEB
      ,SUM(CASE WHEN IDX=1 THEN AMOUNT_03 ELSE AMOUNT_03 END) AS MAR
      ,SUM(월총합) 합계
			  FROM (
			            SELECT B.ITEM_CODE
			                  ,SUM(CASE WHEN SUBSTR(A.ORD_DATE, 5,2)='01' THEN B.AMOUNT ELSE 0 END) AMOUNT_01
			                  ,SUM(CASE WHEN SUBSTR(A.ORD_DATE, 5,2)='02' THEN B.AMOUNT ELSE 0 END) AMOUNT_02
			                  ,SUM(CASE WHEN SUBSTR(A.ORD_DATE, 5,2)='03' THEN B.AMOUNT ELSE 0 END) AMOUNT_03
			                  ,SUM(B.AMOUNT) 월총합
			              FROM BURGER_ORD A
			                  ,BURGER_ORD_ITEM B
			             WHERE 1=1
			                AND A.ORD_CODE = B.ORD_CODE
			                AND A.ORD_DATE LIKE '2017%'
			                
			            GROUP BY B.ITEM_CODE
			        ) A
			        , (
			            SELECT 1 IDX FROM DUAL
			            UNION ALL
			            SELECT 2 IDX FROM DUAL
			        ) B
			        
			GROUP BY CASE WHEN IDX=1 THEN ITEM_CODE ELSE '합계' END '합계' END
			
			ORDER BY 1;
   	   
 --***************************** 상품명순으로*****************************************************************
 		
    SELECT CASE WHEN IDX=1 THEN ITEM_CODE ELSE '합계' END   AS 상품코드
      ,SUM(CASE WHEN IDX=1 THEN AMOUNT_01 ELSE AMOUNT_01 END) AS JAN
      ,SUM(CASE WHEN IDX=1 THEN AMOUNT_02 ELSE AMOUNT_02 END) AS FEB
      ,SUM(CASE WHEN IDX=1 THEN AMOUNT_03 ELSE AMOUNT_03 END) AS MAR
      ,SUM(월총합) 합계
			  FROM (
			            SELECT B.ITEM_CODE
			                  ,SUM(CASE WHEN SUBSTR(A.ORD_DATE, 5,2)='01' THEN B.AMOUNT ELSE 0 END) AMOUNT_01
			                  ,SUM(CASE WHEN SUBSTR(A.ORD_DATE, 5,2)='02' THEN B.AMOUNT ELSE 0 END) AMOUNT_02
			                  ,SUM(CASE WHEN SUBSTR(A.ORD_DATE, 5,2)='03' THEN B.AMOUNT ELSE 0 END) AMOUNT_03
			                  ,SUM(B.AMOUNT) 월총합
			              FROM BURGER_ORD A
			                  ,BURGER_ORD_ITEM B
			             WHERE 1=1
			                AND A.ORD_CODE = B.ORD_CODE
			                AND A.ORD_DATE LIKE '2017%'
			                
			            GROUP BY B.ITEM_CODE
			        ) A
			        , (
			            SELECT 1 IDX FROM DUAL
			            UNION ALL
			            SELECT 2 IDX FROM DUAL
			        ) B
			        
			GROUP BY CASE WHEN IDX=1 THEN ITEM_CODE ELSE '합계' END
			
			ORDER BY 1;
		
		
  		//17
		  		
		SELECT 
		    CASE 
		        WHEN B.IDX = 1 THEN STOREadd 
		        ELSE STOREadd || ' 합계' 
		    END AS STORE_ADD,
		    CASE
				WHEN B.IDX = 1 THEN EMPname
				ELSE NULL
			END AS EMPname,
		    SUM(CASE 
		            WHEN B.IDX = 1 THEN SIXHOURS_AMOUNT 
		            ELSE SIXHOURS_AMOUNT 
		        END) AS SIX_AMT
		FROM (
		    SELECT
		        bs.STORE_ADDR AS STOREadd,
		        e.EMP_NAME    AS EMPname,
		        SUM(CASE WHEN bo.ORD_TIME BETWEEN '0000' AND '0559' THEN boi.AMOUNT ELSE 0 END) AS SIXHOURS_AMOUNT
		    FROM 
		        BURGER_STORE bs,
		        BURGER_EMP e,
		        BURGER_ORD bo,
		        BURGER_ORD_ITEM boi
		    WHERE 1=1
		        AND bs.STORE_CODE = e.STORE_CODE
		        AND e.EMP_CODE  = bo.EMP_CODE 
		        AND bo.ORD_CODE = boi.ORD_CODE
		        AND bo.ORD_TIME BETWEEN '0000' AND '0559'
		    GROUP BY  bs.STORE_ADDR, e.EMP_NAME    
		) A ,
		(
		    SELECT 1 IDX FROM DUAL
		    UNION ALL
		    SELECT 2 IDX FROM DUAL
		) B
		GROUP BY 
		    CASE WHEN B.IDX = 1 THEN STOREadd ELSE STOREadd || ' 합계' END,
		    CASE WHEN B.IDX = 1 THEN EMPname ELSE NULL END
		ORDER BY 1;




		  //18
	SELECT 
	  TO_CHAR(TO_DATE(HOUR, 'HH24'), 'HH24:MI') AS 시간대, 
	  SUM(AMOUNT) AS 매출 
	FROM (
	  SELECT 
	    TO_CHAR(TO_DATE(REPLACE(ORD_TIME, ':', ''), 'HH24MI'), 'HH24') AS HOUR, 
	    AMOUNT
	  FROM 
	    BURGER_ORD 
	    JOIN BURGER_ORD_ITEM 
	      ON BURGER_ORD.ORD_CODE = BURGER_ORD_ITEM.ORD_CODE
	  WHERE 
	    SUBSTR(ORD_DATE, 1, 4) = '2018' AND 
	    TO_CHAR(TO_DATE(REPLACE(ORD_TIME, ':', ''), 'HH24MI'), 'HH24') BETWEEN '13' AND '23'
	)
	GROUP BY 
	  TO_CHAR(TO_DATE(HOUR, 'HH24'), 'HH24:MI')
	ORDER BY 
	  SUM(AMOUNT) DESC 
	FETCH FIRST 3 ROWS ONLY;

	//19
		SELECT
	  BURGER_ITEM.ITEM_NAME,
	  SUM(BURGER_ORD_ITEM.AMOUNT) AS TOTAL_SALES
	FROM
	  BURGER_ORD_ITEM
	  JOIN BURGER_ITEM ON BURGER_ORD_ITEM.ITEM_CODE = BURGER_ITEM.ITEM_CODE
	  JOIN BURGER_ORD ON BURGER_ORD.ORD_CODE = BURGER_ORD_ITEM.ORD_CODE
	WHERE
	  SUBSTR(BURGER_ORD.ORD_DATE, 1, 4) = '2017'
	GROUP BY
	  BURGER_ITEM.ITEM_NAME;
	  
	  
	  // 21
	  --21 지점별 가장 많은 매출을 올린 직원 구하기
			-- 더 좋은 방법이 있을거다.
			select emp_name 사원명
			     , store_addr 지점명
			     , "총 매출"
			 from (
			        select emp_code
			             , o.store_code
			             , sum(amount) "총 매출"
			          from burger_ord_item oi
			        inner join burger_ord o 
			                on oi.ord_code = o.ord_code
			        group by emp_code, o.store_code
			      ) t1
			inner join burger_emp e 
			        on t1.emp_code = e.emp_code
			inner join burger_store s 
			        on t1.store_code = s.store_code
			where (t1.store_code, "총 매출") 
			   in (
			        select store_code
			             , max(합계) 맥스 
			          from (
			                select emp_code
			                     , o.store_code
			                     , sum(amount) 합계
			                  from burger_ord_item oi
			                inner join burger_ord o 
			                        on oi.ord_code = o.ord_code
			                group by emp_code, o.store_code
			                )
			        group by store_code
			      )
			order by "총 매출";
			-- dual
			select case when idx = 1 then emp_code else '최대' end 사원명
			     , store_code
			     , case when idx = 1 then sum(tot_amount) else max(tot_amount) end 총매출
			     , idx
			  from (
			            select emp_code
			                 , o.store_code
			                 , sum(amount) tot_amount
			              from burger_ord_item oi
			            inner join burger_ord o 
			                    on oi.ord_code = o.ord_code
			            group by emp_code, o.store_code
			        ) a
			      , (
			          select 1 idx from dual
			          union all
			          select 2 idx from dual
			        ) b
			group by idx
			       , store_code
			       , case when idx = 1 then emp_code else '최대' end;
				 
				 