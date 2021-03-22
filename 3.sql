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