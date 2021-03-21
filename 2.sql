# MySQL 내장함수 : 사용자의 편의를 위해 다양한 기능의 내장함수를 미리 정의하여 제공(문자열 함수, 수학 함수, 날짜와 시간 함수 등)

SELECT LENGTH('asdfasdf'); # 전달받은 문자열 길이를 반환 = 8

SELECT CONCAT('MY', 'sql Op', 'en Source'); # 전달받은 문자열을 모두 결합하여 하나의 문자열로 변환, 전달받은 문자열 중 하나라도 NULL 존재하면 NULL을 반환

SELECT LOCATE('abc','abababababcabacbac'); # 문자열 내에서 찾는 문자열이 처음으로 등장하는 위치를 찾아서 해당 위치를 반환, 찾는 문자열이 문자열 내에 없으면 0 반환, MySQL에서는 문자열의 시작 인덱스를 1부터 계산 = 9

SELECT 
LEFT('MySQL is an open source relational management system', 5), # 문자열의 왼쪽부터 지정한 개수만큼 문자를 반환 = MySQL
RIGHT('MySQL is an open source relational management system', 6); # 문자열의 오른쪽부터 지정한 개수만큼 문자를 반환 = system

SELECT 
LOWER('MySQL is an open source relational management system'), # 문자열의 모든 문자를 소문자로 변경
UPPER('MySQL is an open source relational management system'); # 문자열의 모든 문자를 대문자로 변경

SELECT REPLACE('MSSQL', 'MS', 'My'); # 문자열에서 특정 문자열을 대체 문자열로 교체

