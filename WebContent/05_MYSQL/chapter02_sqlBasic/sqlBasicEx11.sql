 /*
	
    # CASE문
    
    - MySQL에서 CASE문은 프로그래밍 언어에서 스위치(switch)문과 비슷하지만,
	  다수의 조건에 하나의 반환 값은 동작하지 않는다.
		[형식]
		CASE
			WHEN 조건 THEN  '반환 값'
			WHEN 조건 THEN  '반환 값'
			ELSE 			'WHEN 조건에 해당 안되는 경우 반환 값'
		END AS '컬럼 명'
	- WHEN과 THEN은 한쌍이어야 한다.
	- WHEN과 THEN은 다수가 존재할 수 있다.
	- ELSE가 존재하면 모든 조건에 해당하지 않는 경우에 반환 값을 설정할 수 있다.
	- ELSE가 존재하지 않고, 조건에 맞지 않아서 반환 값이 없으면 NULL를 반환한다.

*/

USE EMPLOYEES;
 
# 예시 1)
SELECT DISTINCT
		DEPT_NO,
	    CASE
			WHEN DEPT_NO = 'D001' 					THEN '강남본사'
			WHEN DEPT_NO IN ('D002','D003','D004')	THEN '신촌지사'
		END AS LOCATION
FROM
		DEPT_EMP;



# 예시 2) ELSE문 사용
SELECT DISTINCT
		DEPT_NO,
	    CASE
			WHEN DEPT_NO = 'D001' 				   THEN '강남본사'
			WHEN DEPT_NO IN ('D002','D003','D004') THEN '신촌지사'
	        ELSE 										'대전지사'
		END AS LOCATION
FROM
		DEPT_EMP;
