--                                           Assignment-8 
 
 SET SERVEROUTPUT ON;
 
 
--1) Write a PL/SQL program that takes marks as input and displays grade using if-else ladder 
DECLARE
    MARKS NUMBER(3);
    GRADE CHAR(1);
BEGIN
    MARKS := &MARKS;
    
    IF MARKS>=90 AND MARKS<=100 THEN GRADE := 'O';
    ELSIF MARKS>=80 AND MARKS<90  THEN GRADE := 'E';
    ELSIF MARKS>=70 AND MARKS<80 THEN GRADE := 'A';
    ELSIF MARKS>=60 AND MARKS<70 THEN GRADE := 'B';
    ELSIF MARKS>=50 AND MARKS<60 THEN GRADE := 'C';
    ELSIF MARKS>=40 AND MARKS<50 THEN GRADE := 'D';
    ELSIF MARKS<=40 AND MARKS>=0 THEN GRADE := 'F';
    ELSE GRADE:= 'I';
    END IF;
    DBMS_OUTPUT.PUT_LINE('MARKS IS : ' || MARKS);
    DBMS_OUTPUT.PUT_LINE('GRADE IS : ' || GRADE);
END;

-- 2) Write a PL/SQL program to display all even numbers up to a number using simple loop 
DECLARE 
    N NUMBER;    
BEGIN
    N := &N;
    DBMS_OUTPUT.PUT_LINE('EVEN NUMBERS UPTO '|| N ||' :');
    FOR I IN 1..N LOOP
        IF MOD(I,2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(I);
        END IF;
    END LOOP;
END;
    
--3) Write a PL/SQL program to find the factorial of a number using For loop 
DECLARE 
    NUM NUMBER;
    F NUMBER := 1;
BEGIN
    NUM := &NUM;
    DBMS_OUTPUT.PUT_LINE('FACTORIAL OF THE NUMBER '||NUM||' IS ');
    FOR I IN 1..NUM LOOP
        F := F*I;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(F);
END;

--4) Write a PL/SQL program to display the Fibonacci series upto 20000 using While loop 
DECLARE 
    NUM NUMBER;
    A NUMBER := 0;
    B NUMBER := 1;
    C NUMBER := 0;
BEGIN
    NUM := &NUM;
    DBMS_OUTPUT.PUT_LINE('FIBONACCI SERIES UPTO '||NUM||' ARE :');
    DBMS_OUTPUT.PUT_LINE(A);
    DBMS_OUTPUT.PUT_LINE(B);
    WHILE B <= NUM LOOP
        C := A+B;
        EXIT WHEN C > NUM; 
        DBMS_OUTPUT.PUT_LINE(C);
        A := B;
        B := C;
    END LOOP;
END;
        
    
        
    
--5) Write a PL/SQL program to insert  random numbers in a table random_num (rand_no number(20))

CREATE TABLE RAND_NUMBER(
    RAND_NO NUMBER(20)
);
DECLARE 
    NUM NUMBER(20);
BEGIN
    NUM := DBMS_RANDOM.VALUE(1,999999999999999999);
    INSERT INTO RAND_NUMBER VALUES(NUM);
END;
SELECT * FROM RAND_NUMBER;



-- 6) Write a PL/SQL program to fill up the table sphere(rad number(2),area number(10,2), volume 
-- number(15,2)) with radius values from 1 – 20  
CREATE TABLE SPHERE(RAD NUMBER (2),
                    AREA NUMBER(10,2),
                    VOLUME NUMBER(15,2)
                    );
DECLARE
    RAD NUMBER;
    AREA NUMBER(10,2);
    VOL NUMBER(15,2);
    PI NUMBER :=3.14;
BEGIN
    FOR RAD IN 1..20 LOOP
        --DBMS_OUTPUT.PUT_LINE('RADIUS OF SPHERE IS: '||RAD);
        AREA := 4*PI*RAD*RAD;
        --DBMS_OUTPUT.PUT_LINE('AREA OF THE SPHERE IS :  '||AREA);
        VOL := (4/3)*PI*RAD*RAD*RAD;
        --DBMS_OUTPUT.PUT_LINE('VOLUME OF THE SPHERE IS :  '||VOL);
        INSERT INTO SPHERE VALUES(RAD,AREA,VOL);
    END LOOP;
END;
SELECT * FROM SPHERE;


--7) Write a PL/SQL program to display name, age and rating from table sailor from user input s_id

SELECT * FROM SAILOR;
DECLARE 
    S_SID SAILOR.SID%TYPE;
    S_SNAME SAILOR.SNAME%TYPE;
    S_AGE SAILOR.AGE%TYPE;
    S_RATING SAILOR.RATING%TYPE;
BEGIN
    S_SID := '&SID';
    SELECT SNAME,AGE,RATING INTO  S_SNAME,S_AGE,S_RATING FROM SAILOR WHERE SID=S_SID;
    DBMS_OUTPUT.PUT_LINE(S_SNAME||' '||S_AGE||' '||S_RATING);
END;


--8) Write a PL/SQL program to display all multiples of 3 up to a number using while loop
DECLARE
    NUM NUMBER;
    I NUMBER:=0;
BEGIN
    NUM:=&NUM;
    WHILE I<=NUM LOOP
         
            DBMS_OUTPUT.PUT_LINE(I);
        
        I :=I+3;
    END LOOP;
END;


--9) Write a PL/SQL program to display multiples of 5 using for loop 
DECLARE
    NUM NUMBER;
    I NUMBER;
BEGIN
    NUM:=&NUM;
    FOR I IN 1..NUM LOOP
         
            DBMS_OUTPUT.PUT_LINE(5*I);
        
        
    END LOOP;
END;

--10) Write a PL/SQL program to calculate the salary from basic pay 
DECLARE 
    BASIC_PAY NUMBER;
    DA NUMBER;
    HRA NUMBER;
    AMOUNT NUMBER;
BEGIN
    BASIC_PAY := &BASIC_PAY;
    DA := .2*BASIC_PAY;
    HRA := .15*BASIC_PAY;
    AMOUNT:= BASIC_PAY+DA+HRA;
    DBMS_OUTPUT.PUT_LINE('DA: '||DA);
    DBMS_OUTPUT.PUT_LINE('HRA: '||HRA);
    DBMS_OUTPUT.PUT_LINE('TOTAL AMOUNT: '||AMOUNT);
END;
--11) Write a PL/SQL program to STRING REVERSE. 
DECLARE 
    STR VARCHAR2(30);
    REV VARCHAR2(30):='';
    CH CHAR(1);
    LEN NUMBER(30);
BEGIN 
    STR:='&STR';
    LEN:=LENGTH(STR);
    DBMS_OUTPUT.PUT_LINE('ORIGINAL STRING IS : '||STR);
    FOR I IN 1..LEN LOOP
        CH:=SUBSTR(STR,I,1);
        REV := CONCAT(CH,REV);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('REVERSED STRING IS : '||REV);
END;



--12) Write a PL/SQL program to find LEAP YEAR.

DECLARE 
    YR NUMBER(4);
BEGIN
    YR:=&YR;
    IF MOD(YR,400)=0 OR ( MOD(YR,100)<>0 AND MOD(YR,4)=0) THEN
        DBMS_OUTPUT.PUT_LINE('LEAP YEAR: '||YR);
    ELSE
        DBMS_OUTPUT.PUT_LINE('NOT LEAP YEAR: '||YR);
    END IF;
END;

--                                     Assignment-9(EXCEPTIONS) 
--1) Take s_id as input from keyboard and display the corresponding record. If s_id is not present in the sailor 
--table, then raise the proper predefined exception. 
 DECLARE
    S_SID SAILOR.SID%TYPE;
    SAILOR_DATA SAILOR%ROWTYPE;
BEGIN
    S_SID := '&SID';
    SELECT * INTO SAILOR_DATA FROM SAILOR WHERE SID=S_SID;
    DBMS_OUTPUT.PUT_LINE('NAME: '||SAILOR_DATA.SNAME||' AGE: '||SAILOR_DATA.AGE||' RATING: '||SAILOR_DATA.RATING);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('NOW SUCH RECORDS WITH '||S_SID||' FOUND!!');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR!! ');
END;        

 
 SELECT * FROM  SAILOR;
 
 
--2) Take b_name as input from keyboard & show the corresponding boat table. If more than one record satisfy 
--for the particular b_name, raise the proper predefined exception. 
 
 DECLARE
    B_BNAME BOAT.BNAME%TYPE;
    BOAT_DATA BOAT%ROWTYPE;
BEGIN
    B_BNAME:='&BNAME';
    SELECT * INTO BOAT_DATA FROM BOAT WHERE BNAME=B_BNAME;
    DBMS_OUTPUT.PUT_LINE(' BOAT NAME: '||BOAT_DATA.BNAME||' BOAT COLOR: '||BOAT_DATA.COLOR);
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
            DBMS_OUTPUT.PUT_LINE('TOO MANY VALUES MATCHED!!');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR!!');    
END;
 
SELECT * FROM BOAT;
 
 
 
--3) Take basic as input from keyboard and da=60% of basic, hra=15% of basic, interim=35% of (basic + da). 
--Display da, hra, interims & total. If interim is between 3000 and 5000, then total=2*basic. If interim is greater 
--than 5000, then total=3*basic. (User defined exception).

DECLARE 
    BASIC_PAY NUMBER;
    DA NUMBER;
    HRA NUMBER;
    INTERIM NUMBER;
    TOTAL NUMBER;
    MY_EXCEPTION EXCEPTION;
BEGIN
    BASIC_PAY:=&BASIC_PAY;
    IF BASIC_PAY<=0 THEN 
        RAISE MY_EXCEPTION;
    END IF;
    DA:= 0.6*BASIC_PAY;
    HRA:=0.15*BASIC_PAY;
    INTERIM:=0.35*(BASIC_PAY+DA);
    IF INTERIM >=3000 AND INTERIM <= 5000 THEN
        TOTAL:=2*BASIC_PAY;
    ELSIF INTERIM > 5000 THEN
        TOTAL:=3*BASIC_PAY;
    ELSE
        TOTAL:=BASIC_PAY+DA+HRA+INTERIM;
    END IF;
    DBMS_OUTPUT.PUT_LINE('DA :'||DA);
    DBMS_OUTPUT.PUT_LINE('HRA: '||HRA);
    DBMS_OUTPUT.PUT_LINE('INTERIM: '||INTERIM);
    DBMS_OUTPUT.PUT_LINE('TOTAL: '||TOTAL);
    EXCEPTION 
        WHEN MY_EXCEPTION THEN
            DBMS_OUTPUT.PUT_LINE('SALARY LESS THAN 0!!');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR');
END;


--                                    Assignment-10 (PROCEDURES)
--1) Create a PL/SQL procedure to calculate factorial of a number 
CREATE OR REPLACE PROCEDURE CALCULATE_FACTORIAL(NUM IN NUMBER,FACT OUT NUMBER) IS
BEGIN
    FACT := 1;
    FOR I IN 1..NUM LOOP
        FACT := FACT*I;
    END LOOP;
END;
DECLARE 
    NUM NUMBER;
    RESULT NUMBER;
BEGIN
    NUM := &NUM;
    CALCULATE_FACTORIAL(NUM,RESULT);
    DBMS_OUTPUT.PUT_LINE('FACTORIAL OF THE '||NUM||' IS '||RESULT);
END;

--2) Create a PL/SQL procedure that takes a user-input date and then prints if the year is a leap year. 
CREATE OR REPLACE PROCEDURE IS_LEAP(YR IN NUMBER ,RESULT OUT BOOLEAN) IS
BEGIN
    IF MOD(YR,400)=0 OR (MOD(YR,100)<>0 AND MOD(YR,4)=0) THEN
        RESULT:=TRUE;
    ELSE
        RESULT:=FALSE;
    END IF;
END;

DECLARE
    YR NUMBER(4);
    RES BOOLEAN;
BEGIN
    YR:=&YR;
    IS_LEAP(YR,RES);
    IF RES=TRUE THEN
        DBMS_OUTPUT.PUT_LINE('LEAP YEAR: '||YR);
    ELSE
        DBMS_OUTPUT.PUT_LINE('NOT LEAP YEAR: '||YR);
    END IF;   
END;



--3) Create a PL/SQL procedure to find prime number. 

CREATE OR REPLACE  PROCEDURE IS_PRIME(NUM IN NUMBER) IS
     FLAG BOOLEAN := TRUE;
BEGIN   
    FOR I IN 2..SQRT(NUM) LOOP
        IF MOD(NUM,I)=0 THEN 
            FLAG:=FALSE;
            EXIT;
        END IF;
    END LOOP;
    IF FLAG THEN 
         DBMS_OUTPUT.PUT_LINE('PRIME NUMBER: '||NUM);
    ELSE
         DBMS_OUTPUT.PUT_LINE('NOT PRIME NUMBER: '||NUM);
    END IF;
END;
DECLARE 
    NUM NUMBER;
BEGIN
    NUM:=&NUM;
    IS_PRIME(NUM);
END;


--4) Create a PL/SQL procedure to STRING REVERSE. 
CREATE OR REPLACE PROCEDURE  REVERSE_STRING(STR IN VARCHAR2) IS
    REV VARCHAR2(32767):='';    
BEGIN
    DBMS_OUTPUT.PUT_LINE('ORIGINAL STRING: '|| STR);
    FOR I IN REVERSE 1..LENGTH(STR) LOOP
        REV:=REV||SUBSTR(STR,I,1);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('REVERSED STRING: '|| REV);
END;
DECLARE 
    STR VARCHAR2(30);
BEGIN
    STR:='&STR';
    REVERSE_STRING(STR);
END;
--5) Create a PL/SQL function that takes a user-input date and then prints if the year is a leap year.
--6) Create a PL/SQL procedure to implement Fibonacci series. 
CREATE OR REPLACE PROCEDURE FIBO(N IN NUMBER) IS
C NUMBER:=0;
A NUMBER:=0;
B NUMBER:=1;
BEGIN
    DBMS_OUTPUT.PUT_LINE(A);
    DBMS_OUTPUT.PUT_LINE(B);
    WHILE B<=N-2 LOOP
        C:=A+B;
        DBMS_OUTPUT.PUT_LINE(C);
        A:=B;
        B:=C;
    END LOOP;
END;
DECLARE
    NUM NUMBER;
BEGIN
    NUM:=&NUM;
    FIBO(NUM);
END;
--7) Write a PL/SQL procedure that takes marks as user input and prints the corresponding grade. 

CREATE PROCEDURE GRADES(MARKS IN NUMBER)IS
GRADE CHAR;
BEGIN
    IF MARKS>=90 AND MARKS<=100 THEN GRADE := 'O';
    ELSIF MARKS>=80 AND MARKS<90  THEN GRADE := 'E';
    ELSIF MARKS>=70 AND MARKS<80 THEN GRADE := 'A';
    ELSIF MARKS>=60 AND MARKS<70 THEN GRADE := 'B';
    ELSIF MARKS>=50 AND MARKS<60 THEN GRADE := 'C';
    ELSIF MARKS>=40 AND MARKS<50 THEN GRADE := 'D';
    ELSIF MARKS<=40 AND MARKS>=0 THEN GRADE := 'F';
    ELSE GRADE:= 'I';
    END IF;
    DBMS_OUTPUT.PUT_LINE('MARKS IS : ' || MARKS);
    DBMS_OUTPUT.PUT_LINE('GRADE IS : ' || GRADE);
END;

DECLARE 
    MARKS NUMBER;
BEGIN
    MARKS:=&MARKS;
    GRADES(MARKS);
END;
--8) Create a PL/SQL function to calculate factorial of a number 
--9) Create a PL/SQL function to implement Fibonacci series. 

