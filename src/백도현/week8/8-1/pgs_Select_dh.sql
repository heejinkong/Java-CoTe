-- [151136] 평균 일일 대여 요금 구하기
SELECT ROUND(AVG(DAILY_FEE),0) AS AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV';

-- [132203] 흉부외과 또는 일반외과 의사 목록 출력하기
SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD,'%Y-%m-%d') AS HIRE_YMD
FROM DOCTOR
WHERE MCDP_CD IN ('CS', 'GS')
ORDER BY 4 DESC, 1 ASC;

-- [133025] 과일로 만든 아이스크림 고르기
SELECT A.FLAVOR
FROM FIRST_HALF A LEFT JOIN ICECREAM_INFO B ON A.FLAVOR=B.FLAVOR
WHERE A.TOTAL_ORDER > 3000 AND B.INGREDIENT_TYPE = 'fruit_based'
ORDER BY TOTAL_ORDER DESC;

--[131120] 3월에 태어난 여성 회원 목록 출력하기
SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE MONTH(DATE_OF_BIRTH) = 3 AND TLNO IS NOT NULL AND GENDER = 'W'
ORDER BY 1

-- [131118] 서울에 위치한 식당 목록 출력하기
SELECT A.REST_ID, REST_NAME, FOOD_TYPE, FAVORITES, ADDRESS, ROUND(AVG(REVIEW_SCORE), 2) AS SCORE
FROM REST_INFO A LEFT JOIN REST_REVIEW B ON A.REST_ID = B.REST_ID
WHERE ADDRESS LIKE '서울%'
GROUP BY 1 HAVING SCORE IS NOT NULL
ORDER BY 6 DESC, 4 DESC;

-- [131536] 재구매가 일어난 상품과 회원 리스트 구하기
SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID HAVING COUNT(USER_ID) >= 2
ORDER BY USER_ID, PRODUCT_ID DESC;

-- [59404] 여러 기준으로 정렬하기
SELECT ANIMAL_ID, NAME,DATETIME AS ANIMAL_TYPE
FROM ANIMAL_INS
ORDER BY NAME ASC, DATETIME DESC;

--[131535] 조건에 맞는 회원수 구하기
SELECT COUNT(USER_ID) 
FROM USER_INFO AS USERS
WHERE YEAR(JOINED) = 2021 AND AGE BETWEEN 20 AND 29;

--[131537] 오프라인/온라인 판매 데이터 통합하기
SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM ONLINE_SALE
WHERE YEAR(SALES_DATE) = 2022 AND MONTH(SALES_DATE) = 3
UNION
SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') AS SALES_DATE, PRODUCT_ID, NULL AS USER_ID, SALES_AMOUNT
FROM OFFLINE_SALE
WHERE YEAR(SALES_DATE) = 2022 AND MONTH(SALES_DATE) = 3
ORDER BY 1, 2, 3
ORDER BY SALES_DATE ,PRODUCT_ID, USER_ID;

-- [298518] 특정 물고기를 잡은 총 수 구하기
SELECT count(*) AS FISH_COUNT
FROM FISH_INFO F INNER JOIN FISH_NAME_INFO N ON F.FISH_TYPE = N.FISH_TYPE
WHERE N.FISH_NAME IN ('BASS', 'SNAPPER');