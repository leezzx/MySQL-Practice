CREATE TABLE city2 SELECT * FROM city; # city 테이블과 똑같은 city2 테이블 생성
SELECT * FROM city2;

CREATE DATABASE suan; # 새로운 데이터 베이스를 생성, USE문으로 새 데이터베이스 사용
USE suan;

# 우클릭 REFRESH ALL을 통해 새로고침 가능

SELECT * FROM test; # Table 우클릭 CREATE TABLE을 통해 테이블 생성 가능, 데이터 타입 : https://dev.mysql.com/doc/refman/8.0/en/data-types.html

CREATE TABLE test2 ( # Table 직접 생성
	id INT NOT NULL PRIMARY KEY, # NULL 비허용
    col1 INT NULL, # NULL 허용
    col2 FLOAT NULL,
    col3 VARCHAR(45) NULL
);
SELECT * FROM test2;

ALTER TABLE test2
ADD col4 INT NULL; # ALTER TABLE과 ADD를 통해 테이블에 컬럼추가 가능
SELECT * FROM test2;

ALTER TABLE test2
MODIFY col4 VARCHAR(20) NULL; # ALTER TABLE과 MODIFY를 통해 테이블의 컬럼 타입을 변경가능
DESC test2;

ALTER TABLE test2
DROP col4; # ALTER TABLE과 DROP을 사용하여 테이블의 컬럼 제거 가능

# 인덱스(index) : 테이블에서 원한는 데이터를 빠르게 찾기 위해 사용, 테이블 컬럼 수정시 인덱스도 같이 수정해야함, 인덱스가 있는 테이블의 처리속도 감소

CREATE INDEX Col1Idx # 인덱스 생성
ON test (col1);

SHOW INDEX FROM test; # 인덱스 정보 보기

CREATE UNIQUE INDEX Col2Idx # 중복값을 허용하지 않는 인덱스
ON test (col2);
SHOW INDEX FROM test;

ALTER TABLE test
ADD FULLTEXT Col3Ix(col3); # 일반적인 인덱스와 달리 매우 빠르게 테이블의 모든 텍스트 칼럼을 검색
SHOW INDEX FROM test;

ALTER TABLE test
DROP INDEX Col3Idx; # ALTER TABLE ... DROP을 이용한 인덱스 삭제

DROP INDEX Col2Idx ON test; # DROP을 이용한 인덱스 삭제

/* VIEW : 데이터베이스에 존재하는 가상 테이블, 행과 열은 가지고 있지만 실제로 데이터를 저장하지는 않음, 여러 테이블이나 뷰를 하나의 테이블 처럼 볼 수 있음
다른 테이블이나 뷰에 저장되어 있는 데이터를 보여주는 역할만 수행, 한 번 정의된 뷰는 변경 불가, 자신만의 인덱스를 가질 수 없음, 쿼리 재사용 가능 */

CREATE VIEW testView AS
SELECT Col1, Col2
FROM test; # Col1과 Col2를 지니는 VIEW 만들기
SELECT * FROM testView;

ALTER VIEW testView AS
SELECT Col1, Col2, Col3
FROM test; # ALTER문 사용하여 뷰를 수정
SELECT * FROM testView;

DROP VIEW testView; # VIEW 삭제

# city, country, countrylanguage 테이블을 JOIN하고, 한국에 대한 정보만 뷰 생성하기
USE world;
CREATE VIEW allView AS
SELECT city.Name, country. SurfaceArea, city.Population, countrylanguage.Language
FROM city
JOIN country ON city.CountryCode = country.Code
JOiN countrylanguage ON city.CountryCode = countrylanguage.CountryCode
WHERE city.CountryCode = 'KOR';
SELECT * FROM allView;

USE suan;

INSERT INTO test
VALUE(1, 123, 1.1, "Test"); # 테이블 이름 다음에 나오는 열 생략가능, 생략 시 VALUE 다음에 나오는 값들의 순서 및 개수가 테이블에 정의된 열 순서 및 개수와 동일해야 함
SELECT * FROM test;

# 테이블 상에 직접 입력 후 Apply를 통해 가능alter

INSERT INTO test2 SELECT * FROM test; # test 테이블에 있는 내용을 test2 테이블에 복사
SELECT * FROM test2;

UPDATE test # 기존에 입력되어 있는 값 변경하는 구문
SET col1 = 1, col2 = 1.0, col3 = 'test'
WHERE id = 1; # WHERE 생략 가능하나 그 경우 테이블 전체 행의 내용 변경
SELECT * FROM test;

DELETE FROM test # 행 단위로 데이터 삭제하는 구문, 데이터는 지워지지만 테이블 용량은 줄지 않음(롤백 가능하기 때문), 원하는 데이터만 지울 수 있음
WHERE id = 1;
SELECT * FROM test;

TRUNCATE TABLE test; # 용량이 줄어들고 인덱스 등도 모두 삭제, 테이블은 삭제하지 않고 데이터만 삭제, 한꺼번에 다 지워야 함, 삭제 후 절대 복구 불가
SELECT * FROM test;

DROP TABLE test; # 테이블 전체를 삭제, 공간, 객체를 삭제, 되돌리기 불가능

DROP DATABASE suan; # 해당 데이터베이스를 삭제