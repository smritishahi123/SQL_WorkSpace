create table dept
(
	dept_id number(3) primary key,
	dept_name varchar2(15)
);

create table cust_100
(
	emp_id number(3) primary key,
	first_name varchar2(10) check (first_name=initcap(first_name)),
	last_name varchar2(10) check (last_name=initcap(last_name)) not null,
	e_mail varchar2(20) check (e_mail=upper(e_mail)),
	ph_no varchar2(15),
	hire_date date check (hire_date>'01-jan-1980'),
	job_id varchar2(10) check (job_id like 'FI%' or job_id like 'AD%' or job_id like 'IT%'),
	salary number (8,2) check (salary>=4000 and salary<=25000),
	mgr_id number(3),
	dept_id number(3),
	constraint dept_id_fk foreign key(dept_id) references dept(dept_id)
);

insert into dept values('90','CSE');
insert into dept values('69','CSBS');
insert into dept values('100','ECE');
insert into dept values('110','ME');

SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION FROM USER_CONSTRAINTS WHERE TABLE_NAME IN 'sailor';

insert into cust_100 values('1','Prasenjit', 'Das', 'PRASENJIT@AOT.EDU.IN','9123456789','06-jan-2002','IT','20000','123','90');

insert into cust_100 values('2','Partha', 'Ghosh',  'PARTHA@AOT.EDU.IN','9123456788','06-feb-2002','IT','19000','124','90');

insert into cust_100 values('3','Suman', 'Goswami',  'SUMAN@AOT.EDU.IN','9123456787','06-mar-2002','IT','18000','125','90');

insert into cust_100 values('4','Somen', 'Hati',  'SOMEN@AOT.EDU.IN','9123456786','06-apr-2002','IT','17000','126','90');

insert into cust_100 values('5','Nayan', 'Das',  'NAYAN@AOT.EDU.IN','9123456785','06-may-2002','IT','16000','127','90');

insert into cust_100 values('6','Swarup', 'Sarkar',  'SWARUP@AOT.EDU.IN','9123456784','06-jun-2002','IT','24000','128','69');

insert into cust_100 values('7','Jyotirmoy', 'Chakrborty',  'JYOTI@AOT.EDU.IN','9123456783','06-jul-2002','IT','15000','129','100');

insert into cust_100 values('8','Sanjib', 'Kundu',  'SANJIB@AOT.EDU.IN','9123456782','06-aug-2002','IT','14000','130','110');

insert into cust_100 values('9','Alok', 'Ghosh',  'ALOK@AOT.EDU.IN','9123456781','06-sep-2002','FINANCE','10000','131','110');

insert into cust_100 values('10','Dilip', 'Maity',  'DILIP@AOT.EDU.IN','9123456780','06-oct-2002','ADMIN','5000','132','90');

ALTER TABLE cust_100 DROP COLUMN mgr_id;



