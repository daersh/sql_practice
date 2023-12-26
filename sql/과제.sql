-- <JOIN 미사용 연습문제>
-- 1. 모든 사원 모든 컬럼 조회
select * from employee;
-- 2. 사원들의 사번(사원번호), 이름 조회
select EMP_ID, EMP_NAME from employee;
-- 3. 201번 사번의 사번 및 이름 조회
select EMP_ID, EMP_NAME from employee where EMP_ID = 201;
-- 4. employee 테이블에서 부서 코드가 'D9'인 사원 조회
select EMP_ID, EMP_NAME,DEPT_CODE  from employee where DEPT_CODE ='D9';
-- 5. employee 테이블에서 직급 코드가 'J1'인 사원 조회
select EMP_ID, EMP_NAME,JOB_CODE  from employee where JOB_CODE ='J1'; 
-- 6. employee 테이블에서 급여가 300만원 이상(>=)인 사원의
-- 사번, 이름, 부서코드, 급여를 조회하시오.
select EMP_ID, EMP_NAME,DEPT_CODE  from employee where SALARY >= 3000000;
-- 7. 부서코드가 'D6'이고 급여를 300만원보다 많이 받는
-- 직원의 이름, 부서코드, 급여 조회
select EMP_NAME,DEPT_CODE,SALARY from employee 
where SALARY >= 3000000 AND DEPT_CODE = 'D6';
-- 8. 보너스를 받지 않는 사원에 대한
-- 사번, 직원명, 급여, 보너스를 조회
select EMP_ID, EMP_NAME, BONUS  from employee where BONUS IS NULL;
-- 9. 'D9' 부서에서 근무하지 않는 사원의
-- 사번, 이름, 부서코드를 조회
select EMP_ID, EMP_NAME,DEPT_CODE  from employee where DEPT_CODE != 'D9';
-- 10. employee 테이블에서 퇴사 여부가 N인 직원들 조회하고
-- 사번, 이름, 입사일을 별칭을 사용해 조회해 보기
-- (퇴사 여부 컬럼은 ENT_YN이고 N은 퇴사 안한 사람, Y는 퇴사 한 사람)
select EMP_ID, EMP_NAME,HIRE_DATE  from employee where ENT_YN >= 'N';
-- 11. employee 테이블에서 급여 350만원 이상
-- 550만원 이하를 받는 직원의
-- 사번, 이름, 급여, 부서코드, 직급코드를 별칭을 사용해 조회해 보기
select EMP_ID, EMP_NAME,DEPT_CODE,JOB_CODE from employee 
where SALARY between 3500000 and 5500000;
-- 12. employee 테이블에서 '성이 김씨'인 직원의 사번, 이름, 입사일 조회
select EMP_ID, EMP_NAME,HIRE_DATE  from employee 
where EMP_NAME like '김%';
-- 13. employee 테이블에서 '성이 김씨'가 아닌 직원의 사번, 이름, 입사일 조회
select EMP_ID, EMP_NAME,HIRE_DATE  from employee 
where EMP_NAME not like '김%';
-- 14. EMPLOYEE 테이블에서 '하'문자가 이름에 포함 된
-- 직원의 이름, 주민번호, 부서코드 조회
select EMP_NAME,EMP_NO,DEPT_CODE  from employee 
where EMP_NAME like '%하%';
-- 15. 'J2'직급이면서 급여가 200만원 이상인 직원이거나
-- 'J7'직급인 직원의 이름, 급여, 직급코드 조회
select EMP_NAME, SALARY ,JOB_CODE  from employee 
where (JOB_CODE = 'J2' AND SALARY >=2000000) 
OR (JOB_CODE = 'J7');
-- 16. 'J2'직급이거나 'J7'직급인 직원들 중에
-- 급여가 200만원 이상인 직원의 이름, 급여, 직급코드 조회
select EMP_NAME, SALARY ,JOB_CODE  from employee 
where (JOB_CODE = 'J2' || JOB_CODE = 'J7') && (SALARY >=2000000);
-- 17. IN 연산자로 업그레이드
select EMP_NAME, SALARY ,JOB_CODE  from employee 
where JOB_CODE IN ('J2','J7') && (SALARY >=2000000);
-- ------------------------------------------
-- <JOIN 사용 연습문제>              
-- 1. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.(1명)
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE a
JOIN DEPARTMENT b ON a.DEPT_CODE = b.Dept_ID
WHERE EMP_NAME LIKE '%형%';
-- 2. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.(9명)
SELECT EMP_NAME,JOB_NAME ,DEPT_ID, DEPT_TITLE
FROM EMPLOYEE a
JOIN DEPARTMENT b ON a.DEPT_CODE = b.Dept_ID
JOIN JOB c ON a.JOB_CODE = c.JOB_CODE
WHERE DEPT_TITLE LIKE '%해외영업%';
-- 3. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.(8명)(INNER JOIN 결과)
SELECT EMP_NAME, BONUS ,DEPT_TITLE, LOCATION_ID
FROM EMPLOYEE a
JOIN DEPARTMENT b ON a.DEPT_CODE = b.Dept_ID
WHERE BoNUS is not NULL;
-- 4. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.(3명)
SELECT EMP_NAME, JOB_NAME, DEPT_TITLE, NATIONAL_NAME
FROM EMPLOYEE a
JOIN DEPARTMENT b ON a.DEPT_CODE = b.Dept_ID
JOIN JOB c ON a.JOB_CODE = c.JOB_CODE
JOIN LOCATION d ON b.LOCATION_ID = d.LOCAL_CODE
JOIN NATIONAL e ON e.NATIONAL_CODE = d.NATIONAL_CODE
WHERE a.DEPT_CODE = 'D2';

select * from location;
select * from NATIONAL;
-- 5. 급여 테이블의 등급별 최소급여(MIN_SAL)보다 많이 받는 직원들의
-- 사원명, 직급명, 급여, 연봉을 조회하시오.
-- 연봉에 보너스포인트를 적용하시오.(20명)
SELECT EMP_ID,EMP_NAME, JOB_NAME, SALARY, MIN_SAL,BONUS ,12*SALARY*(1+IFNULL(BONUS,0))
 FROM EMPLOYEE a
LEFT JOIN DEPARTMENT b ON a.DEPT_CODE = b.Dept_ID
LEFT JOIN JOB c ON a.JOB_CODE = c.JOB_CODE
LEFT JOIN LOCATION d ON b.LOCATION_ID = d.LOCAL_CODE
LEFT JOIN SAL_GRADE f ON f.SAL_LEVEL = a.SAL_LEVEL
WHERE MIN_SAL< SALARY*(1+IFNULL(BONUS,0));


-- 6. 한국(KO)과 일본(JP)에 근무하는 직원들의 
-- 사원명, 부서명, 지역명, 국가명을 조회하시오.(15명)
SELECT EMP_NAME, DEPT_TITLE, LOCAL_NAME, NATIONAL_NAME
 FROM EMPLOYEE a
JOIN DEPARTMENT b ON a.DEPT_CODE = b.Dept_ID
JOIN JOB c ON a.JOB_CODE = c.JOB_CODE
JOIN LOCATION d ON b.LOCATION_ID = d.LOCAL_CODE
JOIN NATIONAL e ON e.NATIONAL_CODE = d.NATIONAL_CODE
JOIN SAL_GRADE f ON f.SAL_LEVEL = a.SAL_LEVEL
WHERE NATIONAL_NAME IN ('한국', '일본');

-- 7. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
-- self join 사용(60명)
SELECT a.EMP_ID, a.EMP_NAME, a.DEPT_CODE,b.EMP_NAME
 FROM EMPLOYEE a
 JOIN EMPLOYEE b 
 where a.DEPT_CODE = b.DEPT_CODE
 AND a.EMP_ID!=b.EMP_ID ;

select DEPT_CODE, EMP_NAME from employee;

-- 8. 보너스포인트가 없는 직원들 중에서 직급코드가 J4와 J7인 직원들의 사원명, 직급명, 급여를 조회하시오.
-- 단, join과 IN 사용할 것(8명)
SELECT EMP_NAME, DEPT_TITLE ,SALARY
FROM employee a
LEFT JOIN department b on a.dept_code = b.dept_id
where JOB_CODE in ('J4','J7')
and BONUS is NULL;

-- 9. 직급이 대리이면서 아시아 지역(ASIA1, ASIA2, ASIA3 모두 해당)에 근무하는 직원 조회
-- 사번(EMPLOYEE.EMP_ID), 이름(EMPLOYEE.EMP_NAME), 직급명(JOB.JOB_NAME), 부서명(DEPARTMENT.DEPT_TITLE),
-- 근무지역명(LOCATION.LOCAL_NAME), 급여(EMPLOYEE.SALARY)를 조회하시오
-- (해당 컬럼을 찾고, 해당 컬럼을 지닌 테이블들을 찾고, 테이블들을 어떤 순서로 조인해야 하는지 고민하고 SQL문을 작성할 것)
SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE,LOCAL_NAME, SALARY
FROM EMPLOYEE a
LEFT JOIN DEPARTMENT b ON a.DEPT_CODE = b.Dept_ID
LEFT JOIN JOB c ON a.JOB_CODE = c.JOB_CODE
LEFT JOIN LOCATION d ON b.LOCATION_ID = d.LOCAL_CODE
LEFT JOIN SAL_GRADE f ON f.SAL_LEVEL = a.SAL_LEVEL
WHERE JOB_NAME = '대리'
AND LOCAL_NAME LIKE ('ASIA%');

