SHOW DATABASES; # 현재 서버에 어떤 DB가 있는지 보기, 번개모양으로 실행 or Ctrl+Enter로 한줄씩 실행, ;는 SQL 쿼리가 끝났다는 뜻 

USE world; # 사용할 데이터베이스 지정, SCHEMAS에서 직접선택 가능

SHOW TABLES; # 데이터베이스 world의 테이블 이름보기

SHOW TABLE STATUS; # 테이블의 정보조회

DESCRIBE city; # city 테이블에 무슨 열이 있는지 확인, desc로도 가능

desc country;
desc countrylanguage;

SELECT * FROM city; # 요구하는 데이터를 가져오는 구문, 데이터베이스 내 테이블에서 원하는 정보를 추출, *은 All을 의미
SELECT Name, Population FROM city; # 테이블에서 필요로하는 열만 가져오기, 여러개의 열 가져올 때는 콤마로 구분, 열 이름의 순서는 출력 순서대로 배열 가능

SELECT * 
FROM city
WHERE Population >= 8000000; # 조회하는 결과에 특정한 조건으로 원하는 데이터를 보고 싶을 때 사용, SELECT 필드이름 FROM 테이블이름 WHERE 조건식

SELECT * 
FROM city
WHERE Population < 8000000
AND Population > 7000000; # 관계연산자 사용 (or, and, =, >, <, !=, not 등)

SELECT * 
FROM city
WHERE Population BETWEEN 7000000 AND 8000000; # 데이터가 숫자로 구성되어 있어 연속적인 값은 BETWEEN ... AND

# 한국에 있는 도시들 보기
SELECT *
FROM city
WHERE CountryCode = 'KOR';

# 미국에 있는 도시들 보기
SELECT *
FROM city
WHERE CountryCode = 'USA';

# 한국에 있는 도시들 중에 인구수가 1,000,000이상인 도시 보기
SELECT *
FROM city
WHERE CountryCode = 'KOR'
AND Population >= 1000000;

SELECT *
FROM city
WHERE Name IN ('Seoul', 'New York', 'Tokyo'); # 이산적인 값의 조건에는 IN() 사용 가능

# 한국, 미국, 일본의 도시 보기
SELECT *
FROM city
WHERE CountryCode IN ('KOR', 'USA', 'JPN');

SELECT *
FROM city
WHERE CountryCode LIKE 'KO_'; # 문자열의 내용 검색하기 위해 LIKE 사용, 한 글자만 모를 때 _로 대체

SELECT *
FROM city
WHERE Name LIKE 'Tel%'; # 문자뒤에 %는 하나 이상 모두 대체

SELECT *
FROM city
WHERE CountryCode = ( SELECT CountryCode
					  FROM city
					  WHERE Name = 'Seoul' /* KOR */ ); # Sub Query : 쿼리문 앝에 또 쿼리문이 들어있는 것, 서브쿼리의 결과가 둘 이상이면 에러 발생
                        
SELECT *
FROM city
WHERE Population > ANY ( SELECT Population
						 FROM city
						 WHERE District = 'New York' /* 6개의 결과값 생성 */ ); # ANY : 서브쿼리의 둘 이상의 결과 중 한 가지만 만족해도 가능, SOME = ANY = IN과 동일한 의미
                            
SELECT *
FROM city
WHERE Population > ALL ( SELECT Population
						 FROM city
						 WHERE District = 'New York' ); # ALL : 서브쿼리의 여러개의 결과를 모두 만족해야 함

SELECT *
FROM city
ORDER BY Population DESC; # 결과가 출력되는 순서를 조절하는 구문, 기본적으로 오름차순(ASCENDING) 정렬 = ASC(default임으로 생략가능), 내림차순(DESCENDING)으로 정렬은 열 이름 뒤에 DESC

SELECT *
FROM city
ORDER BY CountryCode ASC, Population DESC; # 혼용 가능 

# 인구수로 내림차순하여 한국에 있는 도시 보기 
SELECT *
FROM city
WHERE CountryCode = 'KOR'
ORDER BY Population DESC;

# 국가 면적크기로 내림차순하여 나라 보기 (country table)
SELECT *
FROM country
ORDER BY SurfaceArea DESC;

SELECT DISTINCT CountryCode
FROM city; # DISTINCT : 중복된 것은 1개씩만 보여주면서 출력, 테이블의 크기가 클수록 효율적

SELECT *
FROM city
ORDER BY Population DESC
LIMIT 10; # 출력 개수를 제한, 상위의 10개만 출력, 서버의 전반적인 성능을 나쁘게 하는 악성 쿼리문제 개선 시 활용

SELECT CountryCode, MAX(Population) AS 'Population' # AS 로 컬럼명 지정
FROM city
GROUP BY CountryCode; # 그룹으로 묶어주는 역할, 집계 함수와 함께 사용(MAX(), MIN(), AVG() : 평균, COUNT() : 행의 개수, COUNT(DISTINCT) : 중복 제외된 행의 개수, STDEV() : 표준편차, VARIANCE() : 분산), 읽기 좋게 하기 위해 별칭 사용

# 도시는 몇개인가
SELECT COUNT(Name) AS '전체도시'
From city;

# 도시들의 평균 인구수는
SELECT AVG(Population) AS 'AVG Population'
From city;

SELECT CountryCode AS '국가 코드', MAX(Population) AS 'MAX Population'
FROM city
GROUP BY CountryCode
HAVING MAX(Population) > 8000000; # WHERE과 비슷한 개념으로 조건 제한, 집계함수에 대한 조건 제한하는 편리한 개념, HAVING은 반드시 GROUP BY절 다음에 나와야 함

SELECT CountryCode, Name, SUM(Population)
FROM city
GROUP BY CountryCode, Name WITH ROLLUP; # 총합 또는 중간합계가 필요한 경우 사용, GROUP BY절과 함께 WITH ROLLUP문 사용alter

SELECT *
FROM city
JOIN country ON city.CountryCode = country.Code; # 데이터 베이스 내의 여러 테이블에서 가져온 레코드를 조합하여 하나의 테이블이나 결과 집합으로 표현, 조건 필요

# city, country, countrylanguage 테이블 3개를 JOIN하기
SELECT *
FROM city
JOiN country ON city.CountryCode = country.Code
JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode;