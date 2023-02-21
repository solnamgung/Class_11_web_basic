
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
	   	   		
   	   					
  				
  	// 15) 2017.03 중 가장 많이 팔린 상품 순으로 나열 하시고, 판매 수량도 같이 적어라 (단, 세트메뉴는 구성된 단품으로 ....)
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
	
				