/*
	
    # 숫자 관련함수 

		1) ABS		: 절대값을 가져온다.
		2) CEIL		: 소수점을 올린값을 가져온다.
		3) FLOOR	: 소수점을 버린수를 가져온다.
		4) ROUND	: 소수점을 반올림한 값을 가져온다. (자릿수를 지정할 수 있다.)
		5) TRUNCATE : 소수점을 버린 값을 가져온다. 	   (자릿수를 지정할 수 있다.)
		6) POW		: x의 y승을 가져온다.
		7) MOD		: 나머지값을 가져온다.
		8) GREATEST : 최대값을 가져온다.
		9) LEAST    : 최소값을 가져온다.

*/

SELECT 
		ABS(100), 
		ABS(-100),
		CEIL(10.1), 
		CEIL(10.4), 
		CEIL(10.8), 
		FLOOR(10.1), 
		FLOOR(10.4), 
		FLOOR(10.8),
		ROUND(10.1),             # 자릿수를 생략하면 소숫점이 5이상일때 반올림한다.
		ROUND(10.4), 
		ROUND(10.8),
		ROUND(166.555 , 0),       # 자릿수가 0이면 소숫점에서 반올림한다.
		ROUND(166.555 , 1),       # 자릿수가 양수이면 해당자리에서 반올림한다.
		ROUND(166.555 , -1),      # -1인 경우 소숫점 이하를 버리고 정수의 뒤에서부터 지정된 자릿수까지 반올림한다.
		TRUNCATE(166.555 , 0),    # 0소수점 이하 자리수를 버린다.
		TRUNCATE(166.555 , 1),	  # 1소수점 이하 자리수를 버린다. 
		TRUNCATE(166.555 , -1),   # -1인 경우 소숫점 이하를 버리고 정수의 뒤에서부터 지정된 자릿수까지 0으로 처리한다.
		POW(10 , 2),
		MOD(10, 3),
		GREATEST(10,3,4,5,3,6),
		LEAST(10,-3,4,2,6,3,2);



/*
	# 문자열 함수 

		1) CONCAT  : 문자열을 연결한 값을 가져온다.
		2) INSERT  : 문자열을 삽입한 값을 가져온다. 
		3) REPLACE : 문자열을 대체한다.
		4) INSTR   : 문자열의 시작위치를 가져온다. 
					 문자열이 2개 이상 있을 경우 처음 위치만 반환한다. 
					 문자열이 없을 경우 0을 반환한다.
	    5) LEFT 	 : 왼쪽에서 갯수만큼 자른 문자열을 가져온다.
		6) RIGHT 	 : 오른쪽에서 갯수만큼 자른 문자열을 가져온다.
		7) MID   	 : 원하는 위치의 문자열을 원하는 갯수만큼 자른 문자열을 가져온다.
		8) SUBSTRING : 원하는 위치의 문자열을 원하는 갯수만큼 자른 문자열을 가져온다.
		9) LOCATE    : 문자열의 검색 위치(index)를 반환한다.
		10) LTRIM   : 왼쪽 공백을 없앤다.
		11) RTRIM  : 오른쪽 공백을 없앤다.
		12) TRIM   : 양쪽 공백을 없앤다.
		13) LCASE , LOWER : 대문자를 소문자로 변환하여 가져온다.
		14) UCASE , UPPER : 소문자를 대문자로 변환하여 가져온다.
*/

SELECT 
		CONCAT('qwer1234' , '@' , 'gmail.com'),				# (문자열 , 문자열)
		INSERT('qwer1234gmail.com' , 9 , 0 ,'@'),			# (문자열 , 시작위치[1부터 숫자를 센다.] , 삭제할 원본문자열 갯수 , 치환문자열) 
		INSERT('qwer1234gmail.com' , 9 , 5 ,'@'),		
		REPLACE('qwer1234@gmail.com' , 'gmail' , 'naver'),  # (문자열 , 교체될 문자열 , 교체할 문자열 )
		INSTR('qwer1234@gmail.com' , '@gmail.com'),			# (문자열 , 조회할문자열)
		INSTR('qwer1234@gmail.com' , '@naver.com'), 		# 없으면 0
		LEFT('770312-1234567' , 6),		     				# (문자열, 왼쪽부터 자를 갯수)
		RIGHT('770312-1234567' , 7),	     				# (문자열, 오른쪽부터 자를 갯수)
		MID('770312-1234567' , 3),           				# (문자열 , 자르기 시작할 위치)
		SUBSTRING('770312-1234567' , 3),     				# (문자열 , 자르기 시작할 위치)
		MID('770312-1234567' , 3 , 2),	     				# (문자열 , 자르기 시작할 위치 , 자를 갯수)	 
		SUBSTRING('770312-1234567' , 3 , 2), 				# (문자열 , 자르기 시작할 위치 , 자를 갯수)	 
		LOCATE('@' , 'qwer1234@naver.com' ), 				# (찾고 싶은 문자열 , 문자열)
		LOCATE('e' , 'qwer1234@naver.com' ), 				# (찾고 싶은 문자열 , 문자열)
		CONCAT('[', '       ABC        ' , ']'),
		CONCAT('[', LTRIM('       ABC        ') , ']'),
		CONCAT('[', RTRIM('       ABC        ') , ']'),
		CONCAT('[', TRIM('       ABC        ') , ']'),
		LCASE('acDDefg'), 
		LOWER('acDDefg'),
		UCASE('acDDefg'),
		UPPER('acDDefg');



/*
  
	# 날짜 관련 함수
    
		1)  NOW() , SYSDATE() , CURRENT_TIMESTAMP() : 날짜와 시간관련 정보를 가져온다.
		2)  CURRENT_DATE() ,  CURDATE() 			: 날짜관련 정보를 가져온다.
		3)  CURRENT_TIME(), CURTIME()   			: 시간관련 정보를 가져온다.
        
        
	# 날짜 형식 포맷하기
    
        - 포맷으로 지정한 형식으로 변환된 날짜 및 시간 값을 가져온다.

*/

SELECT 
		NOW(),              
		SYSDATE(),
		CURRENT_TIMESTAMP(),
		CURRENT_DATE(), 
		CURDATE(),
		CURRENT_TIME(), 
		CURTIME(),
		DATE_FORMAT(NOW() , '%Y년 %m월 %d일 ,%H시 %i분 %S초'), 
	    DATE_FORMAT(NOW() , '%Y-%m-%d'),
	    DATE_FORMAT(NOW() , '%Y년%m월-%d일');
	