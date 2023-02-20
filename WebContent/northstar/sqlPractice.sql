			
			// 1 고객명 고객전화번호 담당직원명 담당직원직급을 출력하세요. <조건> 담당직원이 있는 고객만 출력하세요.
			
			SELECT 
					c.CUS_NAME, c.TEL_NUM, e.EMP_NAME, e.JIKUP
			  FROM 
			  		CUSTOMER c
		INNER JOIN 
					EMPLOYEE e
			    ON 
			    	c.EMP_NO = e.EMP_NO
			 WHERE 
			 		c.EMP_NO IS NOT NULL ;
	
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
					DEPT.DEP_NAME, 
					COUNT(EMPLOYEE.EMP_NO)  AS NUM_EMPLOYEES
			  FROM 
			  		EMPLOYEE
		INNER JOIN 
					DEPT ON EMPLOYEE.DEP_NO = DEPT.DEP_NO
		  GROUP BY 
		  			DEPT.DEP_NAME , EMPLOYEE.EMP_NO
		  ORDER BY 
		 			NUM_EMPLOYEES ASC;




//4. 직원별 담당 고객수를 구하시오. (고객수 내림차순)

			SELECT 
					e.EMP_NAME, 
					COUNT(c.CUS_NO) AS CUSTOMER_COUNT
			  FROM 
			  		EMPLOYEE e
		  LEFT JOIN 
		  			CUSTOMER c ON e.EMP_NO = c.EMP_NO
		   GROUP BY 
		   			e.EMP_NO, e.EMP_NAME  
		   ORDER BY 
		  			CUSTOMER_COUNT DESC;

// 5. 평균이상의 연봉을 받는 사람을 구하라(2,595.9)
		SELECT 
				AVG(SALARY)
		  FROM
		  		EMPLOYEE;

		 SELECT 
		 		EMP_NAME, 
		 		SALARY
	 	   FROM
	 	   		EMPLOYEE 
 	   	  WHERE
 	   	  		SALARY >= ( SELECT 
 	   	  						   AVG(SALARY)
   	  						  FROM
   	  						  		EMPLOYEE 
 	   	  									   );
 	   	  									  
 	   	  									  
//6. 직급별 최고 연봉자와 평균 연봉자를 구하라
		
		SELECT 
				EMP_NAME,
				JIKUP,
				MAX(SALARY)  AS HIGHEST_SAL,
				AVG(SALARY)  AS AVERAGE_SAL
		  FROM
		  		EMPLOYEE 
	  GROUP BY
	  			JIKUP,
	  			EMP_NAME ;
	  		
		
// 7. 부서별
			
    		 
			 	