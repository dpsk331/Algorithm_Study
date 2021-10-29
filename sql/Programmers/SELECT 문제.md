[프로그래머스: SQL 고득점 Kit: SELECT 문제](https://programmers.co.kr/learn/courses/30/parts/17042)

---

#### **TABLE INFO**

ANIMAL\_INS 테이블은 동물 보호소에 들어온 동물의 정보를 담은 테이블입니다. ANIMAL\_INS 테이블 구조는 다음과 같으며, ANIMAL\_ID, ANIMAL\_TYPE, DATETIME, INTAKE\_CONDITION, NAME, SEX\_UPON\_INTAKE는 각각 동물의 아이디, 생물 종, 보호 시작일, 보호 시작 시 상태, 이름, 성별 및 중성화 여부를 나타냅니다.

| **NAME** | **TYPE** | **NULLABLE** |
| --- | --- | --- |
| ANIMAL\_ID | VARCHAR(N) | FALSE |
| ANIMAL\_TYPE | VARCHAR(N) | FALSE |
| DATETIME | DATETIME | FALSE |
| INTAKE\_CONDITION | VARCHAR(N) | FALSE |
| NAME | VARCHAR(N) | TRUE |
| SEX\_UPON\_INTAKE | VARCHAR(N) | FALSE |

<br />

---

## **모든 레코드 조회하기**

### **문제 설명**

동물 보호소에 들어온 모든 동물의 정보를 ANIMAL\_ID순으로 조회하는 SQL문을 작성해주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.

| **ANIMAL\_ID** | **ANIMAL\_TYPE** | **DATETIME** | **INTAKE\_CONDITION** | **NAME** | **SEX\_UPON\_INTAKE** |
| --- | --- | --- | --- | --- | --- |
| A349996 | Cat | 2018-01-22 14:32:00 | Normal | Sugar | Neutered Male |
| A350276 | Cat | 2017-08-13 13:50:00 | Normal | Jewel | Spayed Female |
| A350375 | Cat | 2017-03-06 15:01:00 | Normal | Meo | Neutered Male |
| A352555 | Dog | 2014-08-08 04:20:00 | Normal | Harley | Spayed Female |

..이하 생략

<br />

### **나의 풀이**

```
SELECT *
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
```

<br />

---

## **역순 정렬하기**

### **문제 설명**

동물 보호소에 들어온 모든 동물의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 이때 결과는 ANIMAL\_ID 역순으로 보여주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.

| **NAME** | **DATETIME** |
| --- | --- |
| Rocky | 2016-06-07 09:17:00 |
| Shelly | 2015-01-29 15:01:00 |
| Benji | 2016-04-19 13:28:00 |
| Jackie | 2016-01-03 16:25:00 |
| \*Sam | 2016-03-13 11:17:00 |

..이하 생략

<br />

### **나의 풀이**

```
SELECT NAME, DATETIME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID DESC;
```

<br />

---

## **아픈 동물 찾기**

### **문제 설명**

동물 보호소에 들어온 동물 중 아픈 동물[1](https://programmers.co.kr/learn/courses/30/lessons/59036#fn1)의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.예시

예를 들어 ANIMAL\_INS 테이블이 다음과 같다면

| **ANIMAL\_ID** | **ANIMAL\_TYPE** | **DATETIME** | **INTAKE\_CONDITION** | **NAME** | **SEX\_UPON\_INTAKE** |
| --- | --- | --- | --- | --- | --- |
| A365172 | Dog | 2014-08-26 12:53:00 | Normal | Diablo | Neutered Male |
| A367012 | Dog | 2015-09-16 09:06:00 | Sick | Miller | Neutered Male |
| A365302 | Dog | 2017-01-08 16:34:00 | Aged | Minnie | Spayed Female |
| A381217 | Dog | 2017-07-08 09:41:00 | Sick | Cherokee | Neutered Male |

이 중 아픈 동물은 Miller와 Cherokee입니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.

| **ANIMAL\_ID** | **NAME** |
| --- | --- |
| A367012 | Miller |
| A381217 | Cherokee |

<br />

### **나의 풀이**

```
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION = "Sick"
ORDER BY ANIMAL_ID;
```

<br />

---

## **어린 동물 찾기**

### **문제 설명**

동물 보호소에 들어온 동물 중 젊은 동물[1](https://programmers.co.kr/learn/courses/30/lessons/59037#fn1)의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.

**예시**

예를 들어 ANIMAL\_INS 테이블이 다음과 같다면

| **ANIMAL\_ID** | **ANIMAL\_TYPE** | **DATETIME** | **INTAKE\_CONDITION** | **NAME** | **SEX\_UPON\_INTAKE** |
| --- | --- | --- | --- | --- | --- |
| A365172 | Dog | 2014-08-26 12:53:00 | Normal | Diablo | Neutered Male |
| A367012 | Dog | 2015-09-16 09:06:00 | Sick | Miller | Neutered Male |
| A365302 | Dog | 2017-01-08 16:34:00 | Aged | Minnie | Spayed Female |
| A381217 | Dog | 2017-07-08 09:41:00 | Sick | Cherokee | Neutered Male |

이 중 젊은 동물은 Diablo, Miller, Cherokee입니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.

| **ANIMAL\_ID** | **NAME** |
| --- | --- |
| A365172 | Diablo |
| A367012 | Miller |
| A381217 | Cherokee |

<br />

### **나의 풀이**

```
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
WHERE INTAKE_CONDITION != 'Aged'
ORDER BY ANIMAL_ID;
```

<br />

---

## **동물의 아이디와 이름**

### **문제 설명**

동물 보호소에 들어온 모든 동물의 아이디와 이름을 ANIMAL\_ID순으로 조회하는 SQL문을 작성해주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.

| **ANIMAL\_ID** | **NAME** |
| --- | --- |
| A349996 | Sugar |
| A350276 | Jewel |
| A350375 | Meo |
| A352555 | Harley |
| A352713 | Gia |
| A352872 | Peanutbutter |
| A353259 | Bj |

((이하 생략))

<br />

### **나의 풀이**

```
SELECT ANIMAL_ID, NAME
FROM ANIMAL_INS
ORDER BY ANIMAL_ID;
```

<br />

---

## **여러 기준으로 정렬하기**

### **문제 설명**

동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조회하는 SQL문을 작성해주세요. 단, 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 보여줘야 합니다.

**예시**

예를 들어, ANIMAL\_INS 테이블이 다음과 같다면

| **ANIMAL\_ID** | **ANIMAL\_TYPE** | **DATETIME** | **INTAKE\_CONDITION** | **NAME** | **SEX\_UPON\_INTAKE** |
| --- | --- | --- | --- | --- | --- |
| A349996 | Cat | 2018-01-22 14:32:00 | Normal | Sugar | Neutered Male |
| A350276 | Cat | 2017-08-13 13:50:00 | Normal | Jewel | Spayed Female |
| A396810 | Dog | 2016-08-22 16:13:00 | Injured | Raven | Spayed Female |
| A410668 | Cat | 2015-11-19 13:41:00 | Normal | Raven | Spayed Female |

1.  이름을 사전 순으로 정렬하면 다음과 같으며, 'Jewel', 'Raven', 'Sugar'
2.  'Raven'이라는 이름을 가진 개와 고양이가 있으므로, 이 중에서는 보호를 나중에 시작한 고양이를 먼저 조회합니다.

따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.

| **ANIMAL\_ID** | **NAME** | **DATETIME** |
| --- | --- | --- |
| A350276 | Jewel | 2017-08-13 13:50:00 |
| A396810 | Raven | 2016-08-22 16:13:00 |
| A410668 | Raven | 2015-11-19 13:41:00 |
| A349996 | Sugar | 2018-01-22 14:32:00 |

<br />

### **나의 풀이**

```
SELECT ANIMAL_ID, NAME, DATETIME
FROM ANIMAL_INS
ORDER BY NAME, DATETIME DESC;
```

<br />

---

## **상위 n개 레코드**

### **문제 설명**

동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.예시

예를 들어 ANIMAL\_INS 테이블이 다음과 같다면

| **ANIMAL\_ID** | **ANIMAL\_TYPE** | **DATETIME** | **INTAKE\_CONDITION** | **NAME** | **SEX\_UPON\_INTAKE** |
| --- | --- | --- | --- | --- | --- |
| A399552 | Dog | 2013-10-14 15:38:00 | Normal | Jack | Neutered Male |
| A379998 | Dog | 2013-10-23 11:42:00 | Normal | Disciple | Intact Male |
| A370852 | Dog | 2013-11-03 15:04:00 | Normal | Katie | Spayed Female |
| A403564 | Dog | 2013-11-18 17:03:00 | Normal | Anna | Spayed Female |

이 중 가장 보호소에 먼저 들어온 동물은 Jack입니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.

| **NAME** |
| --- |
| Jack |

※ 보호소에 가장 먼저 들어온 동물은 한 마리인 경우만 테스트 케이스로 주어집니다.

<br />

### **나의 풀이**

```
SELECT NAME
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MIN(DATETIME)
                  FROM ANIMAL_INS);
```