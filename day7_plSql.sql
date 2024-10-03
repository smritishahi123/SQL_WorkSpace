--1
set serveroutput on;
declare
	marks number(5,2);
	grade varchar2(1);
begin
	marks:=&marks;
	
if marks>=90 and marks<=100 then
	grade:='O';
elsif marks>=80 and marks<=90 then
	grade:='E';
elsif marks>=70 and marks<=80 then
	grade:='A';
elsif marks>=60 and marks<=70 then
	grade:='B';
elsif marks>=50 and marks<=60 then
	grade:='C';
elsif marks>=40 and marks<=50 then
	grade:='D';
else
	grade:='F';
end if;
dbms_output.put_line('grade is: '||grade);
end;
/


--3
set serveroutput on;
declare
	n1 number(3);
	ans number;
	i number;
begin
	n1:=&n1;
ans:=1;
i:=1;
while i<=n1
loop
	ans:=ans*i;
	i:=i+1;
end loop;
dbms_output.put_line('factorial is: '||ans);
end;
/

--
CREATE TABLE RANDOM_NUM(RAND_NO NUMBER(20));
CREATE TABLE SPHERE(RAD NUMBER(2),AREA NUMBER(10,2),VOLUME NUMBER(15,2));
--4
set serveroutput on;
declare
	num random_num.rand_no%type;
	i number;
begin
i:=0;
while i<=10
loop
	select dbms_random.value(100,1000)into num from dual;
	insert into random_num values(num);
	i:=i+1;
end loop;
end;
/

--
set serveroutput on;
declare
	area number;
	vol number;
begin
	area:=0;
	vol:=0;
	for rad in 1..20
	loop
		area:=3.14*rad*rad;
		vol:=1.33*3.14*rad*rad*rad;
		insert into sphere values(rad,area,vol);
	end loop;
end;
/
