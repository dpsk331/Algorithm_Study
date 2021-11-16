--CHAPTER3. 날짜 함수 활용
--1. EMP 테이블에서, 입사 일자(HIREDATE) 컬럼을 이용하여 연도, 월/일, 요일, 분기를 검색하시오.
--단, 입사일자는 월요일부터 일요일 순으로 정렬합니다. 
SELECT EMPNO, ENAME, TO_CHAR(HIREDATE, 'YYYY') "Year",
                     TO_CHAR(HIREDATE, 'MM, MONTH') "Date",
                     TO_CHAR(HIREDATE, 'DAY') "Day",
                     TO_CHAR(HIREDATE, 'Q') "Quarter"
--                     CASE
--                          WHEN TO_CHAR(HIREDATE, 'MM') IN ('01', '02', '03') THEN '1'
--                          WHEN TO_CHAR(HIREDATE, 'MM') IN ('04', '05', '06') THEN '2'
--                          WHEN TO_CHAR(HIREDATE, 'MM') IN ('07', '08', '09') THEN '3'
--                          WHEN TO_CHAR(HIREDATE, 'MM') IN ('10', '11', '12') THEN '4'
--                     END "Quarter"
FROM EMP
WHERE HIREDATE IS NOT NULL;

--2. EMP 테이블에서 20번 부서에 근무하는 사원들을 입사 일자를 기준으로 정렬하여 다음과 같이 검색하시오.
--START_DATE : 입사 일자가 포함된 한 주의 시작일 (일요일)
--END_DATE : 입사 일자가 포함된 한 주의 종료일 (토요일)
SELECT EMPNO, ENAME, HIREDATE, 
                     TO_CHAR(HIREDATE, 'DY') "Day", 
                     TRUNC(HIREDATE, 'DAY') START_DAE, --한 주의 시작일(일요일)
                     TRUNC(HIREDATE, 'DAY') + 6 END_DATE -- 한 주의 종료일(토요일)
FROM EMP;

--4. EMP 테이블에서, 입사 일자(HIREDATE)의 주차를 검색하시오.
--한 주의 시작일은 일요일이며, 달력을 기준으로 주차를 검색합니다.
--SELECT TRUNC(base, 'D') AS DATE1, 
--       TRUNC(base, 'MM') AS DATE2, 
--       TRUNC(TRUNC(base,'MM'),'D') AS DATE3, 
--       (TRUNC(base,'D') - TRUNC(TRUNC(base,'MM'),'D'))/7 + 1 AS "Week"
--FROM ( SELECT TO_DATE('2015/01/06', 'YYYY/MM/DD') AS base FROM dual ) ; 

SELECT EMPNO, ENAME, HIREDATE, 
       (TRUNC(HIREDATE,'D') - TRUNC(TRUNC(HIREDATE,'MM'),'D'))/7 + 1 "Week"
FROM EMP;


-------------------------------------------------------------------
--CHAPTER4. TOP-n 질의 활용
--1. EMP 테이블에서, 급여(SAL)를 가장 많이 받는 3명을 다음과 같이 검색하시오. (ROWNUM 활용)
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM (SELECT * FROM EMP ORDER BY SAL DESC)
WHERE ROWNUM <= 3;

SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
FROM EMP
ORDER BY SAL DESC
FETCH FIRST 2 ROWS ONLY;

--2. EMP 테이블에서, 급여를 가장 많이 받는 사원 순으로 5 ~ 10등의 사원 정보를 다음과 같이 검색하시오. (ROWNUM 활용)
SELECT RANK, EMPNO, ENAME, SAL,DEPTNO
FROM (SELECT ROWNUM RANK, EMPNO, ENAME, SAL,DEPTNO 
      FROM (SELECT *
            FROM EMP 
            ORDER BY SAL DESC))
WHERE RANK BETWEEN 5 AND 10;

--3. EMP 테이블에서 급여를 가장 많이 받는 3명을 검색하시오.
--단, 동일한 급여를 받는 사원이 둘 이상 있다면 함께 검색한다.
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM (SELECT EMPNO, ENAME, SAL, DEPTNO, RANK() OVER(ORDER BY SAL DESC) RANK FROM EMP)
WHERE RANK <=3;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY SAL DESC
FETCH FIRST 3 ROWS WITH TIES;

--4. EMP 테이블에서, 부서별(DEPTNO) 가장 많은 급여(SAL)를 받는 사원을 한 명씩 검색하시오.
--단, 동일한 급여를 받는 사원이 존재할 경우 임의의 한 명을 검색한다
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM (SELECT EMPNO, ENAME, SAL, DEPTNO, 
      ROW_NUMBER() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) RANK
      FROM EMP)
WHERE RANK = 1;


-------------------------------------------------------------------
--CHAPTER5. 조인, 서브쿼리 활용
--1. DEPT, EMP 테이블을 사용하여 SALES 부서에 근무하고, 
--1981년 상반기(1월-6월)에 입사한 사원 정보를 검색하시오. 
--이때 커미션을 합한 급여(SAL + COMM)를 함께 검색하고 입사 일자 순으로 정렬합니다.
SELECT E.EMPNO, E.ENAME, E.HIREDATE, SAL+COMM INCOME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.DNAME = 'SALES'
AND HIREDATE BETWEEN TO_DATE('19810101', 'YYYYMMDD') AND TO_DATE('19810630', 'YYYYMMDD')
ORDER BY E.HIREDATE;

SELECT EMPNO, ENAME, HIREDATE, SAL+COMM INCOME
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES')
AND HIREDATE BETWEEN TO_DATE('19810101', 'YYYYMMDD') AND TO_DATE('19810630', 'YYYYMMDD')
ORDER BY HIREDATE;

--2. DEPT, EMP 테이블을 사용하여 JOB이 'MANAGER'인 사원들의 부서 정보 및 사원 정보를 검색하시오.
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.JOB = 'MANAGER';

--3. DEPT, EMP 테이블을 사용하여, 소속 부서의 평균 급여보다 많은 급여를 받는 
--'MANAGER' 들의 부서 번호, 사원 번호, 사원 이름, 급여를 검색하시오.
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = D.DEPTNO)
AND E.JOB = 'MANAGER';

--4. DEPT, EMP 테이블에서, 2000 이상의 급여(SAL)를 받는 사원들의 소속 부서의 이름(DNAME)을 함께 검색하시오. 
--단, 근무하는 사원이 없는 부서이름도 검색합니다.
SELECT D.DEPTNO DPET_DEPTNO, D.DNAME, E.DEPTNO EMP_DEPTNO, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO
AND (E.SAL >= 2000 OR E.SAL IS NULL);


SELECT D.DEPTNO DPET_DEPTNO, D.DNAME, E.DEPTNO EMP_DEPTNO, E.EMPNO, E.ENAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO
AND E.SAL(+) >= 2000;

SELECT d.deptno AS dept_deptno, d.dname, e.deptno AS emp_deptno, e.empno, e.ename, e.sal
FROM dept d LEFT OUTER JOIN emp e
ON d.deptno = e.deptno
AND e.sal >= 2000 ;

--5. DEPARTMENTS, EMPLOYEES 테이블을 조인하여 다음과 같이 검색하시오.
--단, 근무하는 사원이 없는 부서 정보 및 소속된 부서가 없는 사원 정보도 함께 검색합니다.
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY, E.DEPARTMENT_ID
FROM DEPARTMENTS D FULL OUTER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_ID;

--6. EMP 테이블에서, 'JONES' (ENAME)보다 더 많은 급여(SAL)를 받는 사원을 검색하시오.
--단, JONES의 급여도 함께 검색합니다.
SELECT E.EMPNO, E.ENAME, E.SAL, J.SAL "Jones's Salary"
FROM EMP E, EMP J
WHERE J.ENAME = 'JONES'
AND E.SAL > J.SAL;

--6. EMP 테이블에서, 'JONES' (ENAME)보다 더 많은 급여(SAL)를 받는 사원을 검색하시오.
--단, JONES의 급여도 함께 검색합니다.
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.MANAGER_ID, D.LOCATION_ID
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID
AND E.EMPLOYEE_ID IS NULL;

SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID IS NOT NULL);

SELECT *
FROM DEPARTMENTS D
WHERE NOT EXISTS (SELECT 1 FROM EMPLOYEES WHERE DEPARTMENT_ID = D.DEPARTMENT_ID);

--8. DEPT, EMP 테이블을 사용하여 각 부서의 소속 사원 유무를 확인하는 검색 결과를 만드시오.
--EMP 컬럼은 소속 사원이 존재할 때 'YES', 아니면 'NO'를 검색합니다.
SELECT D.DEPTNO, D.DNAME, D.LOC, DECODE(COUNT(E.DEPTNO), 0, 'NO', 'YES') AS "EMP"
FROM DEPT D, EMP E
WHERE D.DEPTNO = E.DEPTNO(+)
GROUP BY D.DEPTNO, D.DNAME, D.LOC;

--9. COUNTRIES, EMPLOYEES 테이블을 이용하여, 'Canada'에서 근무 중인 사원 정보를 다음과 같이 검색하시오. 
--만약 추가적으로 필요한 테이블이 더 있다면 함께 사용합니다.
SELECT E.FIRST_NAME, E.LAST_NAME, E.SALARY, E.JOB_ID, C.COUNTRY_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND D.LOCATION_ID = L.LOCATION_ID
AND L.COUNTRY_ID = C.COUNTRY_ID
AND COUNTRY_NAME = 'Canada';

--12. EMP 테이블에서 1981년도에 입사한 사원들을 입사 월별로 인원수를 검색하시오.
--단, 사원이 없는 월도 함께 출력
SELECT D.HIRE, NVL(E.CNT, 0) CNT
FROM (SELECT TO_CHAR(HIREDATE, 'YYYY/MM') HIRE, COUNT(*) CNT
      FROM EMP
      WHERE TO_CHAR(HIREDATE, 'YYYY') = '1981'
      GROUP BY TO_CHAR(HIREDATE, 'YYYY/MM')) E,
     (SELECT '1981/'||LPAD(LEVEL, 2, 00) HIRE
      FROM DUAL
      CONNECT BY LEVEL <= 12) D
WHERE E.HIRE(+) = D.HIRE
ORDER BY D.HIRE;

--13. EMPLOYEES 테이블을 이용하여 부서별 최대 급여를 받는 사원 정보를 검색하시오.
SELECT LAST_NAME, SALARY, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES E
WHERE E.SALARY = (SELECT MAX(SALARY)
                  FROM EMPLOYEES DE
                  WHERE DE.department_id = e.department_id)
ORDER BY DEPARTMENT_ID;

SELECT LAST_NAME, SALARY, JOB_ID, DEPARTMENT_ID
FROM EMPLOYEES
WHERE (DEPARTMENT_ID, SALARY) IN (SELECT DEPARTMENT_ID, MAX(SALARY)
                                  FROM EMPLOYEES
                                  GROUP BY DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID;