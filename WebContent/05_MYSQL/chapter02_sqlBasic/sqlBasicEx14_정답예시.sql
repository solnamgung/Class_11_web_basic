USE EMPLOYEES;

# 전체 사원의 숫자를 조회하기. (EMPLOYEES)
SELECT
		COUNT(*)
FROM 
		EMPLOYEES;
        
	
# 전체 사원의 최고 급여 조회하기. (SALARIES)
SELECT
		MAX(SALARY)
FROM 
		SALARIES;

		
# 전체 사원의 최저 급여 조회하기. (SALARIES)
SELECT
		MIN(SALARY)
FROM 
		SALARIES;
  
		
# 전체 사원의 급여 평균 조회하기. (SALARIES)
SELECT
		AVG(SALARY)
FROM 
		SALARIES;        
    
		
# 전체 사원의 최고급여 , 최저 급여 , 평균급여 조회하기. (SALARIES)
SELECT
		MAX(SALARY),
        MIN(SALARY),
        AVG(SALARY)
FROM 
		SALARIES;
    
		
# 'd001' 부서의 직원수를 조회하기. (DEPT_EMP)
SELECT
		COUNT(*)
FROM
		DEPT_EMP
WHERE
		DEPT_NO = 'd001';

		
# 'd001' , 'd002' ,'d003' 부서가 아닌 부서의 직원수를 조회하기. (DEPT_EMP)
SELECT
		COUNT(*)
FROM
		DEPT_EMP
WHERE
		DEPT_NO NOT IN ('d001' , 'd002' ,'d003');

		
# 'd007'부서를 제외한 부서별로 직원수를 조회하기 (DEPT_EMP)
SELECT
		DEPT_NO,
		COUNT(EMP_NO)
FROM
		DEPT_EMP
WHERE
		DEPT_NO <> 'd007'
GROUP BY
		DEPT_NO;
 
 
# 부서별로 사원의 수를 조회한뒤 부서의 인원수가 많은 순서로 조회하기. (DEPT_EMP)
SELECT
		DEPT_NO,
		COUNT(EMP_NO)
FROM
		DEPT_EMP
GROUP BY
		DEPT_NO
ORDER BY
		COUNT(EMP_NO) DESC;
  
		
# 부서별로 사원수가 5만명 이상이 되는 부서만 인원수가 많은 순서로 조회하기. (DEPT_EMP)
SELECT
		DEPT_NO,
		COUNT(EMP_NO)
FROM
		DEPT_EMP
GROUP BY
		DEPT_NO
HAVING
		COUNT(EMP_NO) >= 50000
ORDER BY
        COUNT(EMP_NO);
        
        
# 직원별로 급여의 총합을 조회하기 (SALARIES)
SELECT
		EMP_NO,
		SUM(SALARY)
FROM 
		SALARIES
GROUP BY
		EMP_NO;
        
        
# 사원번호가 10000~10005인 직원들의 직원별로 급여의 평균을 조회하기  (SALARIES)
SELECT
		EMP_NO,
		AVG(SALARY)
FROM 
		SALARIES
WHERE
		EMP_NO BETWEEN 10000 AND 10005
GROUP BY
		EMP_NO;     
        
        
# 사원번호가 10000~10005인 직원들의 직원별로 급여의 평균을 조회하고 평균 금액이 60000~90000사이인 정보만 조회하며 금액이 큰 순서로 조회하기. (SALARIES)
SELECT
		EMP_NO,
		AVG(SALARY)
FROM 
		SALARIES
WHERE
		EMP_NO BETWEEN 10000 AND 10005
GROUP BY
		EMP_NO
HAVING
		AVG(SALARY) BETWEEN 65000 AND 90000
ORDER BY
		AVG(SALARY) DESC;

		
# 직원별로 급여의 평균을 조회하여 급여가 높은 사람 순서로 조회하기. (SALARIES)
SELECT
		EMP_NO,
		AVG(SALARY)
FROM 
		SALARIES
GROUP BY
		EMP_NO
ORDER BY
		AVG(SALARY) DESC;


# 직원별로 급여의 평균이 30000~50000사이인 직원코드를  조회하기. (SALARIES)
SELECT
		EMP_NO,
		AVG(SALARY)
FROM 
		SALARIES
GROUP BY
		EMP_NO
HAVING	
		AVG(SALARY) BETWEEN 30000 AND 50000;

        
# 직함별로 사원의 수를 조회하여 사원의 수가 적은 직함순으로 조회하기. (TITLES)
SELECT
		TITLE,
		COUNT(EMP_NO)
FROM 
		TITLES
GROUP BY
		TITLE
ORDER BY 
		COUNT(EMP_NO);
        
        
# 직함별로 사원의 수가 100000 이상되는 사원의 수를 조회하기.(TITLES)
SELECT
		TITLE,
		COUNT(EMP_NO)
FROM 
		TITLES
GROUP BY
		TITLE
HAVING
		COUNT(EMP_NO) >= 100000;
        
        
# 직함에 'Engineer'가 들어간 직함별로 사원의 수를 조회하기 (TITLES)
SELECT
		TITLE,
		COUNT(EMP_NO)
FROM 
		TITLES
WHERE
		TITLE LIKE '%Engineer%'
GROUP BY
		TITLE;        
        