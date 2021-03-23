# 연락처 테이블 만들기 (이름, 전화번호, 주소, 이메일 ...)

CREATE DATABASE Lee;
USE lee;

CREATE TABLE user (
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(10) NULL,
    tell INT NULL,
    direc VARCHAR(100) NULL,
    email VARCHAR(100) NULL
);

INSERT INTO user
VALUE (1, "이창규", 01091735469, "서울시 종로구 계동길 52-4 401호", "leezzx@naver.com");

ALTER TABLE user
ADD gender VARCHAR(5) NULL;

UPDATE user
SET gender = "남"
WHERE id = 1;

SELECT * FROM user;
