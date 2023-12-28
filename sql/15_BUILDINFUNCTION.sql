-- ------------------------		BUILD IN FUNCTION		------------------------ --
			  -- mysql에서 제공하는 문자열,숫자,날짜,시간에 관한 내장 함수들 --
							  -- 1. 문자열 관련 함수 --
									-- 참고 --
						-- 문자열을 출력하면 값이 왼쪽벽 붙음 ?? --

-- 1-1 ASCII, CHAR
-- 영어ㅡ 숫자, 특수기호 제외 한 모든 문자들은 3바이트
SELECT ASCII('A'), CHAR(65);
SELECT
	   bit_length('한글')   -- bit
	 , char_length('한글')  -- char
     , LENGTH('한글');      -- byte
-- 2, 8, 16 진수 표기
SELECT BIN(OCT(6)), OCT(65),HEX(65);

-- 1-2 CONCAT(string,string....), concat_ws(구분자,string,string,....)
SELECT CONCAT('abc','def','ghi');
SELECT CONCAT_ws('.......','abc','def','ghi');

-- 1-3 ELT , FIELD, FIND_IN_SET, INSTR, LOCATE
SELECT 
       ELT(2,'apple','strawberry','banana')              -- 해당 위치 문자열 반환
	 , FIELD('apple',  'apple','strawberry','banana')    -- 찾을 문자열 위치 반환
     , FIND_IN_SET('banana', 'apple,strawberry,banana') -- 찾을 문자열 위치 반환
     , instr('사과딸기바나나','딸기')					 	 -- 기준 문자열에서 부분 문자열의 위치반환
     , locate('딸기','사과딸기바나나');   					 -- instr과 동일하지만 순서가 반대


-- 1-4 FORMAT  천 단위마다 반올림해줌, 두번째 인자는 소수점 아래 자릿수까지 반올림해서 표현해줌
select FORMAT(21343421234124.2134124,2);
-- 1-5 insert(기준 문자열, 위치, 해당 위치에서 지울 길이, 삽입할 문자열)
SELECT INSERT('나와라 피카츄!', 5,2,'꼬') as 'INSERT',
-- 1-6 LEFT 맨 우칙에서 좌측으로 몇 칸 제거
       LEFT('HELLO WORLD!',5) as 'LEFT', RIGHT('NICE SHOT',5)as 'RIGHT',
-- 1-7 UPPER, LOWER -알파벳 대소문자 변경			-중요 
	   LOWER('HELLO WORLD!') as 'LOWER', UPPER('nice SHOT') as 'UPPER',
-- 1-8 LPAD , RPAD(문자열, 길이, 채울 문자열)  		-중요
       LPAD('HELLO',10,'#') as 'LPAD', RPAD('HELLO',10,'#')as 'RPAD',
-- 1-9 LTRIM(문자열), RTRIM(문자열), TRIM   		-중요
	   CHAR_LENGTH(LTRIM('     왼쪽'))as 'LTRIM',				 -- 좌측 공백제거
       CHAR_LENGTH(RTRIM('우측     '))as 'RTRIM',				 -- 우측 공백제거
       TRIM('     중앙       ')as 'TRIM',					     -- 좌우 공백제거
       TRIM(BOTH     '@' FROM '@@@@중앙@@@@') as 'TRIM_BOTH',     -- 양측@제거
	   TRIM(LEADING  '@' FROM '@@@@중앙@@@@') as 'TRIM_LEADING',  -- 좌@ 제거
       TRIM(TRAILING '@' FROM '@@@@중앙@@@@') as 'TRIM_TRAILING'; -- 우@ 제거 


                               -- 2. 숫자 관련 함수 --
                               



							-- 3. 날짜 및 시간 관련 함수 --