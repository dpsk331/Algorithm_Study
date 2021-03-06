[프로그래머스: SQL 고득점 Kit: SUM, MAX, MIN 문제](https://programmers.co.kr/learn/courses/30/parts/17043)

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

## **최댓값 구하기**

### **문제 설명**

가장 최근에 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.

**예시**

예를 들어 ANIMAL\_INS 테이블이 다음과 같다면

| **ANIMAL\_ID** | **ANIMAL\_TYPE** | **DATETIME** | **INTAKE\_CONDITION** | **NAME** | **SEX\_UPON\_INTAKE** |
| --- | --- | --- | --- | --- | --- |
| A399552 | Dog | 2013-10-14 15:38:00 | Normal | Jack | Neutered Male |
| A379998 | Dog | 2013-10-23 11:42:00 | Normal | Disciple | Intact Male |
| A370852 | Dog | 2013-11-03 15:04:00 | Normal | Katie | Spayed Female |
| A403564 | Dog | 2013-11-18 17:03:00 | Normal | Anna | Spayed Female |

가장 늦게 들어온 동물은 Anna이고, Anna는 2013-11-18 17:03:00에 들어왔습니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.

| **시간** |
| --- |
| 2013-11-18 17:03:00 |

※ 컬럼 이름(위 예제에서는 "시간")은 일치하지 않아도 됩니다.

<br />

### **나의 풀이**

```
SELECT DATETIME AS "시간"
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MAX(DATETIME)
                 FROM ANIMAL_INS);
```

<br />

---

## **최솟값 구하기**

### **문제 설명**

동물 보호소에 가장 먼저 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.

**예시**

예를 들어 ANIMAL\_INS 테이블이 다음과 같다면

| **ANIMAL\_ID** | **ANIMAL\_TYPE** | **DATETIME** | **INTAKE\_CONDITION** | **NAME** | **SEX\_UPON\_INTAKE** |
| --- | --- | --- | --- | --- | --- |
| A399552 | Dog | 2013-10-14 15:38:00 | Normal | Jack | Neutered Male |
| A379998 | Dog | 2013-10-23 11:42:00 | Normal | Disciple | Intact Male |
| A370852 | Dog | 2013-11-03 15:04:00 | Normal | Katie | Spayed Female |
| A403564 | Dog | 2013-11-18 17:03:00 | Normal | Anna | Spayed Female |

가장 먼저 들어온 동물은 Jack이고, Jack은 2013-10-14 15:38:00에 들어왔습니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.

시간

| **시간** |
| --- |
| 2013-10-14 15:38:00 |

※ 컬럼 이름(위 예제에서는 "시간")은 일치하지 않아도 됩니다.

<br />

### **나의 풀이**

```
SELECT DATETIME AS "시간"
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MIN(DATETIME) 
                  FROM ANIMAL_INS);
```

<br />

---

## **동물 수 구하기**

### **문제 설명**

동물 보호소에 동물이 몇 마리 들어왔는지 조회하는 SQL 문을 작성해주세요.

**예시**

예를 들어 ANIMAL\_INS 테이블이 다음과 같다면

| **ANIMAL\_ID** | **ANIMAL\_TYPE** | **DATETIME** | **INTAKE\_CONDITION** | **NAME** | **SEX\_UPON\_INTAKE** |
| --- | --- | --- | --- | --- | --- |
| A399552 | Dog | 2013-10-14 15:38:00 | Normal | Jack | Neutered Male |
| A379998 | Dog | 2013-10-23 11:42:00 | Normal | Disciple | Intact Male |
| A370852 | Dog | 2013-11-03 15:04:00 | Normal | Katie | Spayed Female |
| A403564 | Dog | 2013-11-18 17:03:00 | Normal | Anna | Spayed Female |

동물 보호소에 들어온 동물은 4마리입니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.

| **count** |
| --- |
| 4 |

※ 컬럼 이름(위 예제에서는 count)은 일치하지 않아도 됩니다.

<br />

### **나의 풀이**

```
SELECT COUNT(*)
FROM ANIMAL_INS;
```

<br />

---

## **중복 제거하기**

### **문제 설명**

동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요. 이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다.

**예시**

예를 들어 ANIMAL\_INS 테이블이 다음과 같다면

| **ANIMAL\_ID** | **ANIMAL\_TYPE** | **DATETIME** | **INTAKE\_CONDITION** | **NAME** | **SEX\_UPON\_INTAKE** |
| --- | --- | --- | --- | --- | --- |
| A399552 | Dog | 2013-10-14 15:38:00 | Normal | Jack | Neutered Male |
| A379998 | Dog | 2013-10-23 11:42:00 | Normal | Disciple | Intact Male |
| A370852 | Dog | 2013-11-03 15:04:00 | Normal | Katie | Spayed Female |
| A403564 | Dog | 2013-11-18 17:03:00 | Normal | Anna | Spayed Female |

보호소에 들어온 동물의 이름은 NULL(없음), \*Sam, \*Sam, \*Sweetie입니다. 이 중 NULL과 중복되는 이름을 고려하면, 보호소에 들어온 동물 이름의 수는 2입니다. 따라서 SQL문을 실행하면 다음과 같이 나와야 합니다.

| **count** |
| --- |
| 2 |

※ 컬럼 이름(위 예제에서는 count)은 일치하지 않아도 됩니다.

<br />

### **나의 풀이**

```
SELECT COUNT(DISTINCT NAME)
FROM ANIMAL_INS
WHERE NAME IS NOT NULL;
```