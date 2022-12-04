/*

	# 연습환경 셋팅작업
    
		> 파일탐색기열기 > '내PC' 우 클릭 > '속성' 클릭 > '고급시스템 설정' 클릭
        > (고급탭에서) '환경변수' 클릭 > (시스템변수에서) path클릭 
        > 새로만들기 클릭 
        > C:\Program Files\MySQL\MySQL Server 8.0\bin 입력후 확인
        
        > cmd를 관리자 권한으로 실행
        > test_db-master폴더의 위치를 복사해 놓고 cd 명령어로 디비연습폴더로 이동
          (예시) cd C:\Users\user\Desktop\test_db-master\test_db-master
        > mysql -u root -p -t <employees.sql 명령어 입력
          비밀번호 1234 입력후 (30~40초 대기후 로드 완료 메세지 확인)
		> Mysqlworkbench에서 새로고침 클릭 
        > employees 스키마를 확인
        > 끝

*/
USE EMPLOYEES;


# 전체 데이터 조회하기. (DEPARTMENTS)
SELECT 
    	*
FROM
    	DEPARTMENTS;

# 전체 데이터 조회하기. (DEPT_MANAGER)

SELECT 
		*
FROM 
		DEPT_MANAGER;
    
    
# 전체 데이터 조회하기. (TITLES)
 
 SELECT 
 		*
 FROM 
 		TITLES;	
        
        
# 직함을 중복되지않게 가져오기. (TITLES)
SELECT DISTINCT  
		TITLE
FROM 
		TITLES;
  
  
# 부서번호를 중복없이 조회하기.(DEPT_EMP)
SELECT DISTINCT
		DEPT_NO
FROM 
		DEPT_EMP;
  
        
# 모든 컬럼을 10개의 레코드만 조회하기 (EMPLOYEES)
SELECT 
		*
FROM 
		EMPLOYEES
LIMIT
		10;  
 
 
# 모든 컬럼을 10번째부터 3레코드만 조회하기 (EMPLOYEES)
SELECT 
		*
FROM 
		EMPLOYEES
LIMIT
		10 , 3;  
        
# 사원번호 , 이름(성,이름) 조회하기. (EMPLOYEES)
 SELECT 
		EMP_NO ,
		FIRST_NAME , 
		LAST_NAME 
FROM 
		EMPLOYEES;

# 사원번호 , 생년월일 , 성별 조회하기.(EMPLOYEES)
SELECT 
		EMP_NO ,
		BIRTH_DATE ,
		GENDER
FROM 
		EMPLOYEES;
 

 # 부서번호 , 부서 이름 조회하기.(DEPARTMENTS)
 SELECT 
	 	DEPT_NO ,
	 	DEPT_NAME 
 FROM 
 		DEPARTMENTS;
 
 
 # 사원번호 , 급여 조회하기.(SALARIES) 
 SELECT 
	 	EMP_NO ,
	 	SALARY
 FROM 
 		SALARIES;
 
 
 # 사원번호 , 직함 이름을 조회하기. (TITLES)
 SELECT 
	 	EMP_NO ,
	 	TITLE
 FROM 
 		TITLES;
    

# 급여 , 10 % 인상된 금액 조회하기.(SALARIES)
SELECT 
		SALARY , 
	    SALARY + SALARY * 0.1
FROM 
		SALARIES;
	
		
# 급여 , 10 % 인하된 금액 조회하기.(SALARIES)
SELECT 
		SALARY , 
	    SALARY - SALARY * 0.1
FROM 
		SALARIES;

	
# 사원번호 , 급여 , 3.3%세금 , 세금 공제후 실 급여 조회하기. (SALARIES)
SELECT 
		EMP_NO,
		SALARY , 
		SALARY * 0.033 AS TAX,        
		SALARY - (SALARY * 0.033) AS AFTER_TAX
FROM 
		SALARIES;



# 1986년 이후에 입사한 사원들의 정보. (EMPLOYEES)
SELECT 
		*
FROM 
		EMPLOYEES
WHERE 
		HIRE_DATE >= '1986-01-01';


# 'd001'부서의 매니저 중에 1990년 이후부터 근무했던 매니저의 사원번호 , 부서번호 , 근무시작날짜 조회하기. (DEPT_MANAGER) 
SELECT 
	    EMP_NO, 
	    DEPT_NO, 
	    FROM_DATE
FROM
   	 	DEPT_MANAGER
WHERE
   	 	DEPT_NO = 'D001' AND FROM_DATE >= '1990-01-01';


# 'd001'부서와 'd002'부서 매니저의 사원번호 , 부서번호를 조회하기. (DEPT_MANAGER)
SELECT 
	    EMP_NO, 
	    DEPT_NO
FROM
    	DEPT_MANAGER
WHERE
    	DEPT_NO IN ('D001' , 'D002');        
        
        
# 'd003' 부서가 아닌 사원번호 , 부서번호를 조회하기. (DEPT_MANAGER)
SELECT 
		EMP_NO ,
		DEPT_NO 
FROM 
		DEPT_MANAGER
WHERE 
		DEPT_NO <> 'd003';
		
		
# 급여가 60000 이상 70000 이하인 사원의 사원번호 , 급여를 조회하기. (SALARIES)
SELECT 
	    EMP_NO, 
	    SALARY
FROM
    	SALARIES
WHERE
		SALARY BETWEEN 60000 AND 70000;




# 급여가 150000이상인 사원들의 사원번호 , 급여를 조회하기. (SALARIES)
SELECT
		EMP_NO ,
		SALARY
FROM 
		SALARIES
WHERE 
		SALARY >= 150000;


# 급여가 100000이하인 사원들의 사원번호 , 급여를 조회하기. (SALARIES)
SELECT 
		EMP_NO ,
		SALARY
FROM 
		SALARIES
WHERE 
		SALARY <= 100000;
	
    
# 1990년 이후부터 매니저로 근무 하고 있는 사원들의 사원번호 , 부서번호 , 매니저 근무시작날짜 조회하기. (DEPT_MANAGER)
SELECT 
		EMP_NO ,
		DEPT_NO ,
		FROM_DATE
FROM 
		DEPT_MANAGER
WHERE 
		FROM_DATE >= '1990-01-01';

	
# 1990년 이전에 입사한 사원들의 사원번호 , 입사일자 조회하기. (EMPLOYEES)
SELECT  
		EMP_NO , 
		HIRE_DATE
FROM 
		EMPLOYEES
WHERE 
		HIRE_DATE < '1990-01-01';
		
		
# 1990년 이후에 입사한 남자사원의 사원번호 , 성별 , 입사일 조회하기. (EMPLOYEES)
SELECT 
		EMP_NO, 
	    GENDER, 
	    HIRE_DATE
FROM 
		EMPLOYEES
WHERE 
		GENDER = 'M' AND HIRE_DATE >= '1990-01-01';


# 1990년 이후부터 60000이상의 급여를 받는 사원의 사원번호 , 급여 날짜 조회하기. (SALARIES)
SELECT 
	    EMP_NO, 
	    SALARY
FROM
    	SALARIES
WHERE
    	FROM_DATE >= '1990-01-01' AND SALARY >= 60000;


# 'd001'부서와 'd002'부서 매니저의 사원번호 , 부서번호 조회하기. (DEPT_MANAGER)
SELECT 
	    EMP_NO, 
	    DEPT_NO
FROM
   	 	DEPT_MANAGER
WHERE
    	DEPT_NO = 'd001' OR DEPT_NO = 'd002';	


# 'd003'부서만 제외한 매니저의 사원번호 , 부서번호를 조회하기. (DEPT_MANAGER)
SELECT 
	    EMP_NO, 
	    DEPT_NO
FROM
   		DEPT_MANAGER
WHERE
    	NOT DEPT_NO = 'd003';
		
	
# 이름(성)에 'o'가 포함되어 있는 사원의 사원번호 , 이름(성)을 조회하기. (EMPLOYEES)
SELECT 
		EMP_NO ,
		FIRST_NAME
FROM 
		EMPLOYEES
WHERE 
		FIRST_NAME LIKE '%o%';

	
# 이름에 'o'가 포함되어 있고 마지막글자가 'o'가 아닌 사원의 사원번호 , 이름을 조회하기.(EMPLOYEES)
SELECT 
		EMP_NO ,
		FIRST_NAME
FROM 
		EMPLOYEES
WHERE 
		FIRST_NAME LIKE '%o%' AND NOT FIRST_NAME LIKE '%o';
        
        
# 사원 번호와 입사일을 조회하기 (입사일이 빠른 사람 순서) (EMPLOYEES)
SELECT 
		EMP_NO , 
		HIRE_DATE
FROM 
		EMPLOYEES
ORDER BY 
		HIRE_DATE DESC;


# first_name이 k로 시작하는 사원의 사원번호와 이름(성,이름)을 조회하기. (알파벳 순서 기준) (EMPLOYEES)
SELECT 
	    EMP_NO, 
	    FIRST_NAME,
	    LAST_NAME
FROM
    	EMPLOYEES
WHERE
    	FIRST_NAME LIKE 'k%'
ORDER BY 
		LAST_NAME;


# 1990년에 입사한 사원 번호와 입사일을 조회하기. (입사일이 늦은 기준 순서) (EMPLOYEES) 
SELECT 
		EMP_NO , 
		HIRE_DATE
FROM 
		EMPLOYEES
WHERE 
		HIRE_DATE BETWEEN '1990-01-01' AND '1990-12-31'
ORDER BY 
		HIRE_DATE DESC;


# 이름의 첫글자가 A로 시작하는 사원의 사원번호 , 이름을 조회하기. (EMPLOYEES)
SELECT
		EMP_NO,
        FIRST_NAME,
        LAST_NAME
FROM
		EMPLOYEES
WHERE
		FIRST_NAME LIKE 'A%';


# 이름의 마지막 글자가 s로 끝나는 사원의 사원번호 , 이름을 조회하기. (EMPLOYEES)
SELECT
		EMP_NO,
        FIRST_NAME,
        LAST_NAME
FROM
		EMPLOYEES
WHERE
		LAST_NAME LIKE '%S';
  

# 사원의 번호와 이름(성,이름)을 조회하기. (성,이름 모두 알파벳 순서) (EMPLOYEES)
SELECT 
		EMP_NO , 
		FIRST_NAME,
    	LAST_NAME
FROM 
		EMPLOYEES
ORDER BY 
		FIRST_NAME,
    	LAST_NAME;

