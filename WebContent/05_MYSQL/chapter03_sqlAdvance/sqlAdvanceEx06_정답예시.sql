USE EMPLOYEES;

# 부서번호가 'd001'인 부서의 사원번호와 이름(FIRST,LAST)을 조회하기. (DEPT_EMP , EMPLOYEES)

SELECT
		EMP_NO,
        FIRST_NAME,
        LAST_NAME
FROM
		EMPLOYEES
WHERE
		EMP_NO IN (SELECT
						EMP_NO
					FROM
							DEPT_EMP
					WHERE 
							DEPT_NO = 'd001');

													
							
# 부서이름이 'Production'인 부서의 사원번호와 이름(FIRST,LAST)을 조회하기.  (DEPT_EMP , DEPARTMENTS , EMPLOYEES)

SELECT
		EMP_NO,
        FIRST_NAME,
        LAST_NAME
FROM
		EMPLOYEES
WHERE
		EMP_NO IN (SELECT
							EMP_NO
					FROM
							DEPT_EMP
					WHERE 
							DEPT_NO IN (SELECT
												DEPT_NO 
										FROM
												DEPARTMENTS
										WHERE
												DEPT_NAME = 'Production'));

							

												
# 전체급여의 평균보다 많이 수령하고 있는 사원의 사원번호 , 이름(FIRST,LAST)을 조회하기.	(SALARIES , EMPLOYEES)

SELECT
		EMP_NO,
        FIRST_NAME,
        LAST_NAME
FROM
		EMPLOYEES
WHERE
		EMP_NO IN (SELECT 
						EMP_NO 
				   FROM
						SALARIES
				   WHERE
						SALARY > (SELECT AVG(SALARY) FROM SALARIES));				 



# 1960년 이후에 태어난 사원들이 근무하고 사원들의 사원번호, 근무부서 번호를 조회하기. (DEPT_EMP , EMPLOYEES)

SELECT
		EMP_NO,
        DEPT_NO
FROM
		DEPT_EMP
WHERE
		EMP_NO IN (SELECT
							EMP_NO
				   FROM
							EMPLOYEES
				   WHERE
							BIRTH_DATE >= '1960-01-01');
  
  							
  
# 직급이 'Senior Engineer'인 사원의 이름(FIRST,LAST)을 조회하기. (TITLES , EMPLOYEES)

SELECT
		FIRST_NAME,
        LAST_NAME
FROM
		EMPLOYEES
WHERE
		EMP_NO IN (SELECT 
							EMP_NO
					FROM 
							TITLES
					WHERE
							TITLE = 'Senior Engineer');
  
							

# 관리자의 사원번호 , 이름(FIRST,LAST)을 조회하기. (DEPT_MANAGER , EMPLOYEES)

SELECT
		EMP_NO,
		FIRST_NAME,
		LAST_NAME
FROM
		EMPLOYEES
WHERE
		EMP_NO IN (SELECT
						EMP_NO
				   FROM
				   		DEPT_MANAGER);
				
				   		
  
# 'Development'부서에서 성별로 인원수를 조회하기 (EMPLOYEES , DEPT_EMP , DEPARTMENTS)

SELECT 
		GENDER,
		COUNT(GENDER)
FROM
		EMPLOYEES
WHERE
		EMP_NO IN (SELECT 
							EMP_NO
					FROM
							DEPT_EMP
					WHERE
							DEPT_NO = (SELECT 
												DEPT_NO
										FROM	
												DEPARTMENTS
										WHERE
												DEPT_NAME = 'Development'))
GROUP BY
		GENDER;
