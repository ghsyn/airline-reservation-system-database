-- 더미

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `CRS`.`고객`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`고객` (`ID`)VALUES (1);
INSERT INTO CRS.`고객` (`ID`)VALUES (2);
INSERT INTO CRS.`고객` (`ID`)VALUES (3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`상품`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`상품` (`ID`, `이름`)VALUES (1, '인천-제주 항공권');
INSERT INTO CRS.`상품` (`ID`, `이름`)VALUES (2, '김포-도쿄 항공권');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`PNR`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`PNR` (`ID`, `고객_ID`, `상품_ID`, `예약일자`)VALUES (1, 1, 1, '2023-05-01');
INSERT INTO CRS.`PNR` (`ID`, `고객_ID`, `상품_ID`, `예약일자`)VALUES (2, 3, 1, '2023-05-01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`성별_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`성별_코드` (`CODE`, `NAME`)VALUES (1, '남');
INSERT INTO CRS.`성별_코드` (`CODE`, `NAME`)VALUES (2, '여');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`국적코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`국적코드` (`코드`, `이름`)VALUES (1, '대한민국');
INSERT INTO CRS.`국적코드` (`코드`, `이름`)VALUES (2, '일본');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`체류지_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`체류지_코드` (`코드`, `국적코드`, `이름`)VALUES (1, 1, '제주호텔');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`연령_구분_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`연령_구분_코드` (`ID`, `연령 구분`)VALUES (1, '성인');
INSERT INTO CRS.`연령_구분_코드` (`ID`, `연령 구분`)VALUES (2, '소아');
INSERT INTO CRS.`연령_구분_코드` (`ID`, `연령 구분`)VALUES (3, '유아');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`PAX`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`PAX` (`ID`, `PNR_ID`, `성별 코드_CODE`, `국적코드`, `체류지 코드`, `이름`, `핸드폰번호`, `생년월일`, `이메일`, `연령 구분 코드_ID`)VALUES (1, 1, 1, 1, 1, '김시연', '010-2532-8112', '2000-07-15', 'siyeon@gmail.com', 1);
INSERT INTO CRS.`PAX` (`ID`, `PNR_ID`, `성별 코드_CODE`, `국적코드`, `체류지 코드`, `이름`, `핸드폰번호`, `생년월일`, `이메일`, `연령 구분 코드_ID`)VALUES (2, 1, 1, 1, 1, '김정민', '010-9415-3892', '1999-03-01', 'jungmin@gmail.com', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`항공사`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`항공사` (`ID`)VALUES (1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`비행기`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`비행기` (`ID`, `항공사_ID`, `비행기 모델`, `구매일자`)VALUES (1, 1, 'BOEING98', '1998-11-09');
INSERT INTO CRS.`비행기` (`ID`, `항공사_ID`, `비행기 모델`, `구매일자`)VALUES (2, 1, 'JUNGMIN99', '1999-03-01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`좌석_상세_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`좌석_상세_코드` (`ID`, `이름`)VALUES (1, '앞 좌석');
INSERT INTO CRS.`좌석_상세_코드` (`ID`, `이름`)VALUES (2, '비상구');
INSERT INTO CRS.`좌석_상세_코드` (`ID`, `이름`)VALUES (3, '세미프론트');
INSERT INTO CRS.`좌석_상세_코드` (`ID`, `이름`)VALUES (4, '일반석A');
INSERT INTO CRS.`좌석_상세_코드` (`ID`, `이름`)VALUES (5, '일반석B');
INSERT INTO CRS.`좌석_상세_코드` (`ID`, `이름`)VALUES (6, '일반석C');
INSERT INTO CRS.`좌석_상세_코드` (`ID`, `이름`)VALUES (7, '비지니스 라이트');

COMMIT;

-- -----------------------------------------------------
-- Data for table `CRS`.`국제_국내_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`국제_국내_코드` (`코드`, `이름`)VALUES (1, '국제');
INSERT INTO CRS.`국제_국내_코드` (`코드`, `이름`)VALUES (2, '국내');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`운임종류_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`운임종류_코드` (`코드`, `이름`)VALUES (1, 'FLY');
INSERT INTO CRS.`운임종류_코드` (`코드`, `이름`)VALUES (2, 'FLYBAG');
INSERT INTO CRS.`운임종류_코드` (`코드`, `이름`)VALUES (3, 'FLEX');
INSERT INTO CRS.`운임종류_코드` (`코드`, `이름`)VALUES (4, 'BIZ LITE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`운임금액_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`운임금액_코드` (`코드`, `이름`)VALUES (1, '운임');
INSERT INTO CRS.`운임금액_코드` (`코드`, `이름`)VALUES (2, '유류할증료');
INSERT INTO CRS.`운임금액_코드` (`코드`, `이름`)VALUES (3, '국내공항이용료');
INSERT INTO CRS.`운임금액_코드` (`코드`, `이름`)VALUES (4, '해외공항이용료');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`노선구분_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`노선구분_코드` (`코드`, `이름`)VALUES (1, '기본');
INSERT INTO CRS.`노선구분_코드` (`코드`, `이름`)VALUES (2, '할인');
INSERT INTO CRS.`노선구분_코드` (`코드`, `이름`)VALUES (3, '탄력');
INSERT INTO CRS.`노선구분_코드` (`코드`, `이름`)VALUES (4, '성수기');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`운임`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`운임` (`ID`, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, `운임가격`)VALUES (1, 2, 1, 1, 1, 1000);
INSERT INTO CRS.`운임` (`ID`, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, `운임가격`)VALUES (1, 2, 1, 1, 2, 2000);
INSERT INTO CRS.`운임` (`ID`, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, `운임가격`)VALUES (1, 2, 1, 1, 3, 3000);
INSERT INTO CRS.`운임` (`ID`, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, `운임가격`)VALUES (1, 2, 1, 2, 1, 100);
INSERT INTO CRS.`운임` (`ID`, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, `운임가격`)VALUES (1, 2, 1, 2, 2, 200);
INSERT INTO CRS.`운임` (`ID`, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, `운임가격`)VALUES (1, 2, 1, 2, 3, 300);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`결제수단코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`결제수단코드` (`코드`, `이름`)VALUES (1, '현금');
INSERT INTO CRS.`결제수단코드` (`코드`, `이름`)VALUES (2, '카드');
INSERT INTO CRS.`결제수단코드` (`코드`, `이름`)VALUES (3, '페이코');
INSERT INTO CRS.`결제수단코드` (`코드`, `이름`)VALUES (4, '포인트');
INSERT INTO CRS.`결제수단코드` (`코드`, `이름`)VALUES (5, '기프티켓');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`지역구분코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`지역구분코드` (`코드`, `대륙`)VALUES (1, '대한민국');
INSERT INTO CRS.`지역구분코드` (`코드`, `대륙`)VALUES (2, '동북아시아');
INSERT INTO CRS.`지역구분코드` (`코드`, `대륙`)VALUES (3, '동남아시아');
INSERT INTO CRS.`지역구분코드` (`코드`, `대륙`)VALUES (4, '러시아/몽골');
INSERT INTO CRS.`지역구분코드` (`코드`, `대륙`)VALUES (5, '대양주/괌/사이판');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`공항`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('1', 1, 'SEL', '서울', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('2', 1, 'ICN', '인천', '1');
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('3', 1, 'GMP', '김포', '1');
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('4', 1, 'PUS', '부산', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('5', 1, 'CJU', '제주', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('6', 1, 'KWJ', '광주', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('7', 1, 'CJJ', '청주', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('8', 1, 'TAE', '대구', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('9', 2, 'NRT', '도쿄(나리타)', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('10', 2, 'KIX', '오사카(간사이)', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('11', 3, 'HAN', '하노이', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('12', 3, 'SGN', '호찌민', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('13', 4, 'UBN', '울란바타르', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('15', 5, 'GUM', '괌', NULL);
INSERT INTO CRS.`공항` (`ID`, `지역구분코드`, `IATA`, `공항이름`, `부모 공항`)VALUES ('16', 5, 'SPN', '사이판', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`신분증_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`신분증_코드` (`CODE`, `NAME`)VALUES (1, '여권');
INSERT INTO CRS.`신분증_코드` (`CODE`, `NAME`)VALUES (2, '주민등록증');
INSERT INTO CRS.`신분증_코드` (`CODE`, `NAME`)VALUES (3, '운전면허증');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`개인`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`개인` (`고객_ID`, `성별_코드`, `이름`, `영어이름`, `국적코드`, `이메일`, `전화번호`, `생년월일`)VALUES (1, 1, '김정민', 'KIM JEONGMIN', 1, 'jungmin@gmail.com', '010-9415-3892', '1999-03-01');
INSERT INTO CRS.`개인` (`고객_ID`, `성별_코드`, `이름`, `영어이름`, `국적코드`, `이메일`, `전화번호`, `생년월일`)VALUES (2, 1, '김시연', 'KIM SIYEON', 1, 'siyeon@gmail.com', '010-2532-8112', '2000-07-15');
INSERT INTO CRS.`개인` (`고객_ID`, `성별_코드`, `이름`, `영어이름`, `국적코드`, `이메일`, `전화번호`, `생년월일`)VALUES (3, 2, '이지희', 'LEE JIHEE', 1, 'jihee@gmail.com', '010-2029-1098', '2000-10-08');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`법인우대_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`법인우대_코드` (`코드`, `이름`)VALUES (1, 'VIP');
INSERT INTO CRS.`법인우대_코드` (`코드`, `이름`)VALUES (2, 'GOLD');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`간편회원구분코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`간편회원구분코드` (`CODE`, `NAME`)VALUES (1, '네이버');
INSERT INTO CRS.`간편회원구분코드` (`CODE`, `NAME`)VALUES (2, '카카오');
INSERT INTO CRS.`간편회원구분코드` (`CODE`, `NAME`)VALUES (3, '애플');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`정회원`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`정회원` (`개인_고객_ID`, `PASSWORD`)VALUES (1, '1234');
INSERT INTO CRS.`정회원` (`개인_고객_ID`, `PASSWORD`)VALUES (2, '1234');
INSERT INTO CRS.`정회원` (`개인_고객_ID`, `PASSWORD`)VALUES (3, '1234');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`시즌구분_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`시즌구분_코드` (`CODE`, `NAME`)VALUES (1, 'HOT');
INSERT INTO CRS.`시즌구분_코드` (`CODE`, `NAME`)VALUES (2, 'SAE');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`운항구분_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`운항구분_코드` (`CODE`, `NAME`)VALUES (1, '여객');
INSERT INTO CRS.`운항구분_코드` (`CODE`, `NAME`)VALUES (2, '화물');
INSERT INTO CRS.`운항구분_코드` (`CODE`, `NAME`)VALUES (3, '기타');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`운항계획`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`운항계획` (`ID`, `운항구분_코드`, `비행기_ID`, `시즌구분_코드`, `항공편명`, `항공편_판매가능일자`, `탑승구`)VALUES (1, 1, 1, 1, '7C151', '2023-04-20', 21);
INSERT INTO CRS.`운항계획` (`ID`, `운항구분_코드`, `비행기_ID`, `시즌구분_코드`, `항공편명`, `항공편_판매가능일자`, `탑승구`)VALUES (2, 1, 2, 2, '7C101', '2023-04-20', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`운항경로`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`운항경로` (`ID`, `운항계획_ID`)VALUES (1, 1);
INSERT INTO CRS.`운항경로` (`ID`, `운항계획_ID`)VALUES (2, 1);
INSERT INTO CRS.`운항경로` (`ID`, `운항계획_ID`)VALUES (2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`출도착`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`출도착` (`운항계획_ID`, `운항계획_운항구분_코드`, `출발공항`, `도착공항`, `출발일자`, `도착일자`, `적립가능_마일리지`)VALUES (1, 1, '2', '5', '2023-05-01', '2023-05-01', 1000);
INSERT INTO CRS.`출도착` (`운항계획_ID`, `운항계획_운항구분_코드`, `출발공항`, `도착공항`, `출발일자`, `도착일자`, `적립가능_마일리지`)VALUES (2, 1, '3', '9', '2023-05-01', '2023-05-01', 3000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`혜택 코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`혜택 코드` (`ID`, `NAME`)VALUES (1, '기본그룹');
INSERT INTO CRS.`혜택 코드` (`ID`, `NAME`)VALUES (2, 'NHN');
INSERT INTO CRS.`혜택 코드` (`ID`, `NAME`)VALUES (3, '삼성');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`항공권`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`항공권` (`상품_ID`, `운임_ID`, `운항계획_ID`)VALUES (1, 1, 1);
INSERT INTO CRS.`항공권` (`상품_ID`, `운임_ID`, `운항계획_ID`)VALUES (2, 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`제휴상품_종류`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`제휴상품_종류` (`ID`, `종류`)VALUES (1, 'JJ멤버스 파트너스');
INSERT INTO CRS.`제휴상품_종류` (`ID`, `종류`)VALUES (2, '호텔/숙박');
INSERT INTO CRS.`제휴상품_종류` (`ID`, `종류`)VALUES (3, '보험상품');
INSERT INTO CRS.`제휴상품_종류` (`ID`, `종류`)VALUES (4, '렌터카');
INSERT INTO CRS.`제휴상품_종류` (`ID`, `종류`)VALUES (5, 'WI-FI');
INSERT INTO CRS.`제휴상품_종류` (`ID`, `종류`)VALUES (6, '라운지');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`액세서리_종류_코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`액세서리_종류_코드` (`코드`, `이름`, `금액`)VALUES (1, '샤프', NULL);
INSERT INTO CRS.`액세서리_종류_코드` (`코드`, `이름`, `금액`)VALUES (2, '펜', NULL);
INSERT INTO CRS.`액세서리_종류_코드` (`코드`, `이름`, `금액`)VALUES (3, '포스트잇', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`구매방법 코드`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`구매방법 코드` (`코드`, `구매방법`)VALUES (1, '온라인');
INSERT INTO CRS.`구매방법 코드` (`코드`, `구매방법`)VALUES (2, '오프라인');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`식사_및_음료_종류`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`식사_및_음료_종류` (`ID`, `종류`)VALUES (1, '한식');
INSERT INTO CRS.`식사_및_음료_종류` (`ID`, `종류`)VALUES (2, '중식');
INSERT INTO CRS.`식사_및_음료_종류` (`ID`, `종류`)VALUES (3, '양식');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRS`.`좌석_운행_구분`
-- -----------------------------------------------------
START TRANSACTION;
USE CRS;
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (1, 1);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (1, 2);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (1, 3);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (1, 4);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (2, 3);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (2, 4);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (2, 5);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (2, 6);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (3, 1);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (3, 2);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (3, 3);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (3, 4);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (3, 5);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (3, 6);
INSERT INTO CRS.`좌석_운행_구분` (`운임종류_코드`, `좌석_상세_코드`)VALUES (4, 7);

COMMIT;

UPDATE CRS.국적코드
SET 이름 = '대한민국(KOREA, REPUBLIC OF)'
WHERE 코드 = 1;

UPDATE CRS.성별_코드
SET NAME = '남자'
WHERE CODE = 1;

UPDATE CRS.성별_코드
SET NAME = '여자'
WHERE CODE = 2;

INSERT INTO CRS.상품 (ID, 이름)VALUES (90, '찌개와 웰컴드링크 제공');
INSERT INTO CRS.상품 (ID, 이름)VALUES (100, '결합을 위한 찌개');
INSERT INTO CRS.상품 (ID, 이름)VALUES (101, '웰컴드링크');

INSERT INTO CRS.결합상품 (상품_ID, 설명, 총_가격)VALUES (90, '든든한 찌개와 웰컴드링크 오렌지 주스를 드려요', 15000);

INSERT INTO CRS.결합상품_구성상세 (결합상품_상품_ID, 상품_ID)VALUES (90, 1);
INSERT INTO CRS.결합상품_구성상세 (결합상품_상품_ID, 상품_ID)VALUES (90, 100);
INSERT INTO CRS.결합상품_구성상세 (결합상품_상품_ID, 상품_ID)VALUES (90, 101);


INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 2, 1, 1, 10000);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 2, 1, 2, 20000);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 2, 1, 3, 30000);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 2, 2, 1, 2000);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 2, 2, 2, 200);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 2, 2, 3, 3333);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 3, 1, 1, 22222);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 3, 1, 2, 33333);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 3, 1, 3, 44444);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 3, 2, 1, 22);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 3, 2, 2, 2111);
INSERT INTO CRS.운임 (ID, `국제/국내 코드`, `운임종류 코드`, `노선구분 코드`, `운임금액 코드`, 운임가격)VALUES (1, 2, 3, 2, 3, 23333);

INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (1, 1, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (1, 2, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (2, 1, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (2, 2, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (3, 1, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (3, 2, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (4, 1, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (4, 2, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (5, 1, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (5, 2, 1);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (6, 1, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (6, 2, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (7, 1, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (7, 2, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (8, 1, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (8, 2, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (9, 1, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (9, 2, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (10, 1, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (10, 2, 2);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (11, 1, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (11, 2, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (12, 1, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (12, 2, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (13, 1, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (13, 2, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (14, 1, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (14, 2, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (15, 1, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (15, 2, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (20, 1, 3);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (16, 1, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (16, 2, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (17, 1, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (17, 2, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (18, 1, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (18, 2, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (19, 1, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (19, 2, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (20, 1, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (20, 2, 4);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (21, 1, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (21, 2, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (22, 1, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (22, 2, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (23, 1, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (23, 2, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (24, 1, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (24, 2, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (25, 1, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (25, 2, 5);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (26, 1, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (26, 2, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (27, 1, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (27, 2, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (28, 1, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (28, 2, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (29, 1, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (29, 2, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (30, 1, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (30, 2, 6);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (20, 2, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (31, 1, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (31, 2, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (32, 1, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (32, 2, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (33, 1, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (33, 2, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (34, 1, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (34, 2, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (35, 1, 7);
INSERT INTO CRS.비행기_좌석 (`좌석 번호`, 비행기_ID, `좌석 상세 코드_ID`)VALUES (35, 2, 7);
