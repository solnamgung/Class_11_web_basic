			
USE DATABASE EXAM;
// 1 고객명 고객전화번호 담당직원명 담당직원직급을 출력하세요. <조건> 담당직원이 있는 고객만 출력하세요.
			
			SELECT 
					c.CUS_NAME, c.TEL_NUM, e.EMP_NAME, e.JIKUP
			  FROM 
			  		CUSTOMER c
		INNER JOIN 
					EMPLOYEE e
			    ON 
			    	c.EMP_NO = e.EMP_NO
		
	
// 2. 최고 연봉을 받는 사람을 구하라.
           
            SELECT  
            		EMP_NAME
        	  FROM
        	  		EMPLOYEE 
    	  	 WHERE
    	  	 		SALARY = ( SELECT 
    	  	 							MAX(SALARY)
    	  	  		  			 FROM
    	  	  							EMPLOYEE 	
    	  	 							);
    	  	
// 3.  부서별 사원수를 구하라...  (사원이 없는 부서 포함) 사원이 적은 부서 부터 많은 부서순으로
					
			SELECT 
	    	  			d.DEP_NAME, 
	    	  			COUNT(e.EMP_NO) as num_employees
				  FROM 
				  		DEPT d
			 LEFT JOIN 
			 			EMPLOYEE e ON d.DEP_NO = e.DEP_NO
			  GROUP BY 
			  			d.DEP_NAME
			  ORDER BY 
			 			num_employees ASC;



//4. 직원별 담당 고객수를 구하시오. (고객수 내림차순)

			  SELECT
			 		 E.EMP_NAME  	 AS 직원별,
			 		 COUNT(C.CUS_NO) AS 담당고객
		 		FROM
		 			  EMPLOYEE E
		   LEFT JOIN
		   			  CUSTOMER C 
		   	      ON
		   	      	  E.EMP_NO = C.EMP_NO 
		   	GROUP BY 
		   			  E.EMP_NO,
		   			  E.EMP_NAME 
			ORDER BY
					  담당고객 DESC;

// 5. 평균이상의 연봉을 받는 사람을 구하라(2,595.9)
	  SELECT		
      			EMP_NAME   AS 직원명,
      		      SALARY   AS 연봉
        FROM
        		EMPLOYEE 
	   WHERE
	   		    SALARY > (SELECT
	   		    				AVG(SALARY)
   		    				FROM
   		    					EMPLOYEE )
	ORDER BY 
   		        연봉 DESC;
 	   	  						
   		        
//6. 직급별 최고 연봉자와 평균 연봉자를 구하라
		
		SELECT 
   	  		 MAX(e.EMP_NAME) KEEP(DENSE_RANK LAST ORDER BY e.SALARY) 이름,
   	  		 e.JIKUP		 AS 직급,
   	  		 MAX(e.SALARY) AS 최고연봉,
   	  		 AVG(e.SALARY) AS 직급평균연봉
   	    FROM
   	    	 EMPLOYEE e
	GROUP BY 
			e.JIKUP
    ORDER BY
    		최고연봉;
		
// 7. 부서별 총 연봉합계 구하기 -> 옆으로 가게 정렬
	
// vertical
		SELECT 
				D.DEP_NAME,
				SUM(E.SALARY)   AS TOTAA_SALARY
		  FROM
		  		EMPLOYEE E
    RIGHT JOIN 
		  		DEPT D 
		    ON
		    	E.DEP_NO = D.DEP_NO 
	   GROUP BY 
	   			D.DEP_NAME ;


//horizontal	 
	  SELECT
  			 *
		FROM
		  	(SELECT
				     DEP_NAME,
				     SALARY
		  	   FROM
		     		 EMPLOYEE e
		       JOIN 
		       		 DEPT d ON e.DEP_NO = d.DEP_NO)
			  PIVOT
					  (SUM(SALARY)
					   FOR DEP_NAME
					     IN ('영업부' AS "영업부",
					         '총무부' AS "총무부",
					         '자재부' AS "자재부",
					         '전산부' AS "전산부"))
		    ORDER BY  1;
			   
//2 horizontal		  
			SELECT 
				  "영업부",
				  "총무부",
				  "자재부",
				  "전산부"
			FROM
			  (
			    SELECT
			      DEP_NAME,
			      SALARY
			    FROM
			      EMPLOYEE e
			      JOIN DEPT d ON e.DEP_NO = d.DEP_NO
			  )
			  PIVOT (
			    SUM(SALARY)
			    FOR DEP_NAME
			    IN (
			      '영업부' AS "영업부",
			      '총무부' AS "총무부",
			      '자재부' AS "자재부",
			      '전산부' AS "전산부"
			    )
			  )
			ORDER BY 1;
		  	
		  SELECT 
			    SUM(CASE WHEN DEP_NO = 10 THEN SALARY  ELSE 0 END) AS 자재부,
			    SUM(CASE WHEN DEP_NO = 20 THEN SALARY  ELSE 0 END) AS 총무부,
			    SUM(CASE WHEN DEP_NO = 30 THEN SALARY ELSE 0 END) AS 영업부,
			    SUM(CASE WHEN DEP_NO = 40 THEN SALARY ELSE 0 END) AS 전산부
		   FROM
    			EMPLOYEE;
	
		  	
	
	// 8 연봉 탑 five 
	SELECT DISTINCT
			    e1.EMP_NAME,
			    e1.SALARY
			FROM
			    EMPLOYEE e1
			WHERE
			    5 >= (
			        SELECT 
			        	   COUNT(DISTINCT e2.SALARY)
			          FROM 
			          	   EMPLOYEE e2
			         WHERE 
			         	   e2.SALARY >= e1.SALARY
			    )
			ORDER BY e1.SALARY DESC;
			
	//9
	
			SELECT DISTINCT 
							e.EMP_NO,
							e.EMP_NAME,
							e.SALARY
					   FROM  (
					   			SELECT
					   				   EMP_NO,
					   				   EMP_NAME,
					   				   SALARY,
					   				   RANK() OVER(ORDER BY SALARY DESC)  AS SAL_RANK
					   		      FROM 
					   		      		EMPLOYEE 
					   		  GROUP BY
					   		  			EMP_NO, EMP_NAME, SALARY	
					   )e
					  WHERE 
					  		e.SAL_RANK BETWEEN 3 AND 5;


// 10. 부서별 사원수 및 고객수 구하기.	 중복되는 데이터는 어떻게 할까요


		SELECT 
				DEP_NAME AS 부서,
				COUNT(EMP_NO) AS 사원수
		  FROM
		  		DEPT d 
	 LEFT JOIN
	  	  		EMPLOYEE e 
  		    ON
  		    	e.DEP_NO = d.DEP_NO
	  GROUP BY
	 			DEP_NAME;
	 		
	 	
 		SELECT
 			   d.DEP_NAME 	   AS 부서명,
			   COUNT(c.CUS_NO) AS 고객수
		  FROM
			   DEPT d
  	 LEFT JOIN 
  	 		   EMPLOYEE e 
  	 		ON 
  	 		   e.DEP_NO = d.DEP_NO
     LEFT JOIN 
     		   CUSTOMER c 
     		ON 
     		   c.EMP_NO = e.EMP_NO
      GROUP BY
			   d.DEP_NAME;

	// 사원수와 고객수 합치기
	
		SELECT 
				d.DEP_NAME   			  AS 부서명,
				COUNT(DISTINCT e.EMP_NO)  AS 사원수,
				COUNT(DISTINCT c.CUS_NO)  AS 고객수
		  FROM
		  		DEPT d 
  	 LEFT JOIN
  	 			EMPLOYEE e 
  	 		ON
  	 			e.DEP_NO = d.DEP_NO 
	 LEFT JOIN
				CUSTOMER c 
			ON
				c.EMP_NO = e.EMP_NO 
	  GROUP BY 
	  			d.DEP_NAME;

		  	
		   
				
			
















			
    		 
			 	