USE CRS;

## 1. 홈페이지에서 항공권 예매 방문, 출발지 목록 가져오기

SELECT 대륙
     , 공항이름
     , IATA
FROM 공항 공
         JOIN 지역구분코드 지
              ON 지.코드 = 공.지역구분코드;

###########

# 2. 출발지 선택 후 운항하는 도착지만 가져오기

# 서울의 ID
SET @출발지_ID = '1';

SELECT *
FROM 공항 공
         JOIN 지역구분코드 지
              ON 지.코드 = 공.지역구분코드
         JOIN 출도착 출
              ON 공.ID = 출.도착공항
WHERE 출.출발공항 IN (SELECT ID FROM 공항 공2 WHERE (공2.ID = @출발지_ID OR 공2.`부모 공항` = @출발지_ID));

###########

# 3. 도착지 및 날짜 선택 후 조회 클릭 (편도)

SET @조회일 = '2023-04-30'; # 실제로는 now() 같이 현 날짜로 설정.
SET @출발일 = '2023-05-01';

# 5 제주, 9 도쿄

SET @출발지_ID = '1'; # 서울의 ID 서울로 조회하면 서울 전체(인천, 김포)가 나온다.
SET @도착지_ID = '9';

SELECT 출발일자
     , 도착일자
     , 항공편명
     , 운코.이름
     , SUM(운임가격) AS 가격
     , (SELECT COUNT(*)
        FROM 비행기_좌석 비좌
                 JOIN 좌석_상세_코드 좌상코
                      ON 좌상코.ID = 비좌.`좌석 상세 코드_ID`
                 JOIN 좌석_운행_구분 좌운구
                      ON 좌상코.ID = 좌운구.좌석_상세_코드
        WHERE 좌운구.운임종류_코드 = 운.`운임종류 코드`)
    - (SELECT COUNT(*)
       FROM 티켓
                JOIN PAX P
                     ON P.ID = 티켓.PAX_ID
                JOIN PNR P2
                     ON P.PNR_ID = P2.ID
                JOIN 항공권 항2
                     ON P2.상품_ID = 항2.상품_ID
                JOIN 운항계획 운3
                     ON 항2.운항계획_ID = 운3.ID
                JOIN 비행기 비2
                     ON 운3.비행기_ID = 비2.ID
                JOIN 비행기_좌석 비좌
                     ON 비2.ID = 비좌.비행기_ID AND 티켓.`비행기_좌석_좌석 번호` = 비좌.`좌석 번호`
                JOIN 좌석_운행_구분 좌운구
                     ON 좌운구.좌석_상세_코드 = 비좌.`좌석 상세 코드_ID`
                         AND 좌운구.운임종류_코드 = 운.`운임종류 코드`) AS '좌석 수'
FROM 항공권 항
         JOIN 운임 운
              ON 운.ID = 항.운임_ID
         JOIN 운항계획 운2
              ON 운2.ID = 항.운항계획_ID
         JOIN 출도착 출
              ON 운2.ID = 출.운항계획_ID AND 운2.운항구분_코드 = 출.운항계획_운항구분_코드
         JOIN 운임종류_코드 운코
              ON 운코.코드 = 운.`운임종류 코드`
         JOIN 비행기 비
              ON 비.ID = 운2.비행기_ID
WHERE 출.출발공항 IN (SELECT ID FROM 공항 공2 WHERE (공2.ID = @출발지_ID OR 공2.`부모 공항` = @출발지_ID))
  AND 출.도착공항 = @도착지_ID
  AND DATE_FORMAT(출발일자, '%Y-%m-%d') = @출발일
GROUP BY 항.상품_ID, `운임종류 코드`, 출발일자, 도착일자, 비.ID, 항공편명
ORDER BY 출발일자;
;

###########

# 4. 번들 선택하기

# 1번은 찌개와 웰컴드링크가 포함된 묶음 상품이 있어서 해당 번들을 추천해준다.
# 2번은 묶음상품없음

SET @항공권_ID = '1';

SELECT 이름
     , 설명
     , 총_가격
FROM 결합상품 결
         JOIN 결합상품_구성상세 결구
              ON 결.상품_ID = 결구.결합상품_상품_ID
         JOIN 상품 상
              ON 상.ID = 결.상품_ID
WHERE 결구.상품_ID = @항공권_ID;


###########

# 5. 티켓 예매

# 원활한 테스트를 위해 더미 데이터 삭제
DELETE
FROM 결제수단 결
WHERE 결.티켓_ID IN (SELECT ID
                  FROM 티켓
                  WHERE PAX_ID = 1);

DELETE
FROM 티켓
WHERE PAX_ID = 1;

DELETE
FROM 티켓
WHERE PAX_ID = 2;

DELETE
FROM PAX
WHERE PNR_ID = 1;

DELETE
FROM PAX
WHERE PNR_ID = 2;

DELETE
FROM PNR
WHERE PNR.고객_ID = 1;

DELETE
FROM PNR
WHERE PNR.고객_ID = 3;

START TRANSACTION;

# 예약 삽입
INSERT INTO CRS.PNR(ID, 고객_ID, 상품_ID, 예약일자)
VALUES (1, 1, 1, '2023-05-01');

# 탑승객 정보를 입력

# 예시) 김시연
SET @LAST_NAME_2 = 'KIM';
SET @FIRST_NAME_2 = 'SIYEON';
SET @GENDER_2 = '여자';
SET @DAY_OF_BIRTH_2 = '2000-07-15';
SET @AGE_2 = YEAR(DATE_SUB(NOW(), INTERVAL @DAY_OF_BIRTH_2 YEAR)) + 1;
SET @NATIONALITY_2 = '대한민국(KOREA, REPUBLIC OF)';
SET @PHONE_NUMBER_2 = '010-2532-8112';
SET @EMAIL_2 = 'iamsiyeon@gmail.com';

INSERT INTO CRS.PAX(ID, PNR_ID, `성별 코드_CODE`, 국적코드, `체류지 코드`, 이름, 핸드폰번호, 생년월일, 이메일, `연령 구분 코드_ID`)
VALUES (1, 1,
        (SELECT CODE FROM CRS.성별_코드 WHERE NAME = @GENDER),
        (SELECT 코드 FROM 국적코드 WHERE 이름 = @NATIONALITY), 1,
        CONCAT(@LAST_NAME, '-',@FIRST_NAME), @PHONE_NUMBER, @DAY_OF_BIRTH, @EMAIL,
        (SELECT
                CASE
                    WHEN (@AGE >= 12) THEN (SELECT ID FROM 연령_구분_코드 WHERE 연령_구분_코드.`연령 구분` = '성인')
                    WHEN (@AGE >= 2 && @AGE < 12) THEN (SELECT ID FROM 연령_구분_코드 WHERE 연령_구분_코드.`연령 구분` = '소아')
                    WHEN (@AGE < 2) THEN (SELECT ID FROM 연령_구분_코드 WHERE 연령_구분_코드.`연령 구분` = '유아')
                    END));


INSERT INTO CRS.PAX(ID, PNR_ID, `성별 코드_CODE`, 국적코드, `체류지 코드`, 이름, 핸드폰번호, 생년월일, 이메일, `연령 구분 코드_ID`)
VALUES (2, 1,
        (SELECT CODE FROM CRS.성별_코드 WHERE NAME = @GENDER_2),
        (SELECT 코드 FROM 국적코드 WHERE 이름 = @NATIONALITY_2), 1,
        CONCAT(@LAST_NAME_2, '-',@FIRST_NAME_2), @PHONE_NUMBER_2, @DAY_OF_BIRTH_2, @EMAIL_2,
        (SELECT
                CASE
                    WHEN (@AGE_2 >= 12) THEN (SELECT ID FROM 연령_구분_코드 WHERE 연령_구분_코드.`연령 구분` = '성인')
                    WHEN (@AGE_2 >= 2 && @AGE_2 < 12) THEN (SELECT ID FROM 연령_구분_코드 WHERE 연령_구분_코드.`연령 구분` = '소아')
                    WHEN (@AGE_2 < 2) THEN (SELECT ID FROM 연령_구분_코드 WHERE 연령_구분_코드.`연령 구분` = '유아')
                    END));

INSERT INTO CRS.티켓(ID, PAX_ID, `비행기_좌석_좌석 번호`)
VALUES (1, 1, 1);

INSERT INTO CRS.티켓(ID, PAX_ID,`비행기_좌석_좌석 번호`)
VALUES (2, 2, 2);

###########

# 6. 모든 금액을 결제완료 하면 티켓이 발급되고 결제수단에 결제 데이터들이 기록된다.
SET @항공권_ID = '1';
SET @티켓_ID = '1';

# 원활한 테스트를 위해 데이터 초기화
DELETE
FROM 결제수단 결
WHERE 티켓_ID = @티켓_ID;

SET @결제수단코드1 = 3; # 페이코
SET @결제금액1 = 100;

SET @결제수단코드2 = 2; # 카드
SET @결제금액2 = 1000;

INSERT INTO 결제수단 (티켓_ID, 결제수단코드, 결제금액)
VALUES ( @티켓_ID
       , @결제수단코드1
       , @결제금액1);

INSERT INTO 결제수단 (티켓_ID, 결제수단코드, 결제금액)
VALUES ( @티켓_ID
       , @결제수단코드2
       , @결제금액2);

###########

# 7. 티켓 출력

SELECT P.이름
     , 공.공항이름 AS '출발지'
     , 공2.공항이름 AS '도착지'
     , 항공편명
     , 출발일자
     , 도착일자
     , 탑승구
     , DATE_SUB(출발일자, INTERVAL 30 MINUTE) AS '탑승시간'
     , CONCAT(좌상코.이름, ' ', 티.`비행기_좌석_좌석 번호`, '번') AS '좌석번호'
FROM 티켓 티
         JOIN PAX P
              ON P.ID = 티.PAX_ID
         JOIN PNR P2
              ON P2.ID = P.PNR_ID
         JOIN 상품 상
              ON 상.ID = P2.상품_ID
         JOIN 항공권 항
              ON 상.ID = 항.상품_ID
         JOIN 운항계획 운
              ON 운.ID = 항.운항계획_ID
         JOIN 출도착 출
              ON 운.ID = 출.운항계획_ID
         JOIN 공항 공
              ON 출.출발공항 = 공.ID
         JOIN 공항 공2
              ON 출.도착공항 = 공2.ID
         JOIN 비행기 비
              ON 운.비행기_ID = 비.ID
         JOIN 비행기_좌석 비좌
              ON 비.ID = 비좌.비행기_ID AND 비좌.`좌석 번호` = 티.`비행기_좌석_좌석 번호`
         JOIN 좌석_상세_코드 좌상코
              ON 좌상코.ID = 비좌.`좌석 상세 코드_ID`
WHERE 항.상품_ID = @항공권_ID;
