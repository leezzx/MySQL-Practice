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

SELECT 
TRIM('       MySQL       '), # 제거할 문자를 명시하지 않으면 공백을 제거 = MySQL
TRIM(LEADING '#' FROM '###MySQL##'), # 전달받은 문자열 앞에 존재하는 특정 문자를 제거 = MySQL##
TRIM(TRAILING '#' FROM '###MySQL##'), # 전달받은 문자열 뒤에 존재하는 특정 문자를 제거 = ###MySQL
TRIM(BOTH '#' FROM '###MySQL##'); # 전달받은 문자열의 양 끝에 존재하는 특정 문자를 제거, 지정자 없을시 자동으로 BOTH = MySQL

SELECT FORMAT(123123123123.123123123, 3); # 숫자타입의 데이터를 세 자리마다 쉼표를 사용하는 '#,###,###.##'형식으로 변환, 반환되는 데이터 형식은 문자열 타입, 두 번째 인수는 반올림할 소수 부분의 자릿수

SELECT 
FLOOR(10.95), # 내림 = 10
CEIL(10.95), # 올림 = 11
ROUND(10.95); # 반올림 = 11

SELECT 
SQRT(4), # 양의 제곱근 = 2
POW(2, 3), # 첫 번째 인수로는 밑수를 전달하고, 두 번째 인수로는 지수를 전달하여 거듭제곱 계산 = 8
EXP(3), # 인수로 지수를 전달받아, e의 거듭제곱 계산 = 20.08553692318768
LOG(3); # 자연로그 값을 계산 = 1.0986122886681098

SELECT
SIN(PI()/2), # 사인값 반환 = 1
COS(PI()), # 코사인값 반환 = -1
TAN(PI()/4); # 탄젠트값 반환 = 0.9999999999999999

SELECT
ABS(-3), # 절대값을 반환 = 3
RAND(), # 0.0보다 크고 1.0보다 작은 하나의 실수를 무작위로 생성
ROUND(RAND()*100, 0); # 0보다 크고 100보다 작은 하나의 정수를 무작위로 생성

SELECT
NOW(), # 'YYYY-MM-DD HH:MM:SS' 또는 YYYYMMDDHHMMSS
CURDATE(), # 'YYYY-MM-DD' 또는 YYYYMMDD
CURTIME(); # 'HH:MM:SS' 또는 HHMMSS

SELECT
DATE(NOW()), # 전달받은 값에 해당하는 날짜 정보 변환
MONTH(NOW()), # 월에 해당하는 값을 반환, 0 ~ 12
DAY(NOW()), # 일에 해당하는 값을 반환, 0 ~ 31
HOUR(NOW()), # 시간에 해당하는 값을 반환, 0 ~ 23
MINUTE(NOW()), # 분에 해당하는 값을 반환, 0 ~ 59
SECOND(NOW()); # 초에 해당하는 값을 반환, 0 ~ 59

SELECT
MONTHNAME(NOW()), # 월에 해당하는 이름을 반환
DAYNAME(NOW()); # 요일에 해당하는 이름을 반환

SELECT
DAYOFWEEK(NOW()), # 일자가 해당 주에서 몇 번째 날인지를 반환, 1부터 7사이의 값을 반환(일요일=1, 토요일=7)
DAYOFMONTH(NOW()), # 일자가 해당 월에서 몇 번째 날인지를 반환, 0 ~ 31
DAYOFYEAR(NOW()); # 일자가 해당 연도에서 몇 번째 날인지를 반환, 1 ~ 366

SELECT
DATE_FORMAT(NOW(), '%D %y %a %d %n %j')  # 전달받은 형식에 맞추어 날짜와 시간정보를 문자열로 변환, MySQL Date and Time Function : https://dev.mysql,com/doc/refman/8.0/en/date-and-time-function.html 참고