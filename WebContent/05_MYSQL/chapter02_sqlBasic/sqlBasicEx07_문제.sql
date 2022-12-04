CREATE DATABASE TEST_EMP;
USE TEST_EMP;

CREATE TABLE EMP(

	EMP_NO    INT,			# 사번
	NAME      VARCHAR(20),	# 이름
	JOB       VARCHAR(20),	# 직책
	HIRE_DATE VARCHAR(30),	# 입사일자
	SALARY    INT,			# 급여	
	COMM      INT,			# 커미션
	DEPT_NO   INT			# 부서번호

);


INSERT INTO EMP VALUES (7369 , 'SMITH' , 'CLERK' , '1980-12-17' , 800 , NULL , 20);
INSERT INTO EMP VALUES (7499 , 'ALLEN' , 'SALARYESMAN' , '1981-02-20' , 1600 , 300 , 30);
INSERT INTO EMP VALUES (7521 , 'WARD' , 'SALARYESMAN' , '1981-02-22' , 1250 , 500 , 30);
INSERT INTO EMP VALUES (7566 , 'JONES' , 'MANAGER' , '198 1-04-02' , 2975 , NULL , 20);
INSERT INTO EMP VALUES (7654 , 'MARTIN' , 'SALARYESMAN' , '1981-09-28' , 1250 , 1400 , 30);
INSERT INTO EMP VALUES (7698 , 'BLAKE' , 'MANAGER' , '1981-05-01' , 2850 , NULL , 30);
INSERT INTO EMP VALUES (7782 , 'CLARK' , 'MANAGER' , '1981-06-09' , 2450 , NULL , 10);
INSERT INTO EMP VALUES (7788 , 'SCOTT' , 'ANALYST' , '1987-07-13' , 3000 , NULL , 20);
INSERT INTO EMP VALUES (7839 , 'KING' , 'PRESIDENT' , '1981-11-17' , 5000 , NULL , 10);
INSERT INTO EMP VALUES (7844 , 'TURNER' , 'SALARYESMAN' , '1981-09-08', 1500 , 0 , 30);
INSERT INTO EMP VALUES (7876 , 'ADAMS' , 'CLERK' , '1987-07-13' , 1100 , NULL , 20);
INSERT INTO EMP VALUES (7900 , 'JAMES' , 'CLERK' , '1981-12-03' , 950 , NULL , 30);
INSERT INTO EMP VALUES (7902 , 'FORD' , 'ANALYST' , '1981-12-03' , 3000,NULL , 20);
INSERT INTO EMP VALUES (7934 , 'MILLER' , 'CLERK' , '1982-01-23' , 1300 , NULL , 10);


# 1) 사원 테이블의 모든 레코드를 조회하시오.


# 2) 사원명과 입사일을 조회하시오.


# 3) 사원번호와 이름을 조회하시오.	



# 4) 사원테이블에 있는 직책의 목록(중복제거)을 조회하시오.



# 5) 부서번호가 10인 사원을 조회하시오.


# 6) 월급여가 2500이상 되는 사원을 조회하시오.


# 7) 이름이 'KING'인 사원을 조회하시오.


# 8) 사원중 이름이 S로 시작하는 사원의 사원번호와 이름을 조회하시오.


# 9) 사원 이름에 T가 포함된 사원의 사원번호와 이름을 조회하시오.


# 10) 커미션이 300,500,1400인 사원의 사번,이름,커미션을 조회하시오.


# 11) 월급여가 1200에서 3500 사이의 사원의 사번,이름,월급여를 조회하시오.  


# 12) 직급이 매니저이고 부서번호가 30번인 사원의 이름,사번,직급,부서번호를 조회하시오.


# 13) 부서번호가 30이 아닌 사원의 사번,이름,부서번호를 조회하시오.


# 14) 커미션이 300, 500, 1400 이 모두 아닌 사원의 사번,이름,커미션을 조회하시오.


# 15) 이름에 S가 포함되지 않는 사원의 사번,이름을 조회하시오.


# 16) 급여가 1200보다 미만이거나 3700 초과하는 사원의 사번,이름,월급여를 조회하시오.


# 17) 급여가 높은 순으로 조회하되 급여가 같을 경우 이름의 알파벳이 빠른 사원순으로 사번,이름,월급여를 조회하시오. 


# 데이터베이스 삭제
DROP DATABASE TEST_EMP;