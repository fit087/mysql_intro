show databases;
use school;
status;

/*
insert into students
(name, birthday, sex, weight, height, country)
values
('Alfred','1990-03-02', 'M', '78.5', '1.74','Germany'),
('Rose','1991-03-02', 'F', '68.5', '1.64',default);
 */

/* Initial state -- */
alter table people
rename to students;

alter table students
change column carreer profession varchar(20) not null default '';

delete from students
where name='Alfred' or name='Rose'
limit 2;

drop table subjects;
drop table test;

alter table students
drop column profession,
drop column code;

/* -- Initial state */

insert into students values
(default, 'Alfred','1990-03-02', 'M', '78.5', '1.74','Germany'),
(default, 'Rose','1991-03-02', 'F', '68.5', '1.64',default);

select * from students;

select '** Adding Column: Profession' AS '** DEBUG:';

alter table students
add column profession varchar(10);

select * from students;

select '** Delete Column: Profession' AS '** DEBUG:';

alter table students
drop column profession;

select * from students;

select '** Adding Column: Profession after name' AS '** DEBUG:';

alter table students
add column profession varchar(10) after name;

select '** Adding Column: code as first' AS '** DEBUG:';

alter table students
add column code tinyint first;

select '** Modify Column: profession as not null but with default '''' ' AS '** DEBUG:';

update students
set profession = ''
where profession is null;

alter table students
modify column profession varchar(20) not null default '';

select * from students;

select '** Change Column: profession to carreer ' AS '** DEBUG:';

alter table students
change column profession carreer varchar(20) not null default '';

select '** Rename table: students to people' AS '** DEBUG:';

alter table students
rename to people;

desc people;


/*
 Create new table
*/

create table if not exists subjects(
	name varchar(30) not null unique,
	description text,
	charge tinyint unsigned,
	nclasses tinyint unsigned,
	age year default '2020'
) default charset = utf8;

alter table subjects
add column idsubject int first;

alter table subjects
add primary key(idsubject);

/*
	Delete table
*/

create table if not exists test(
	id int,
	name varchar(9),
	years year
);

insert into test values
('1','Anabelle','1995'),
('2','Belle','1999');

select * from test;

drop table if exists test;

/*
	DDL-Data Definition Language

	create database
	create table
	alter table
	drop table

	DML-Data Manipulation Language
	
	insert into

*/
