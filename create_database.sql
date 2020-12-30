/*
mysql> source \home\user\Desktop\test.sql;
*/

create database school 
default charset utf8
default collate utf8_general_ci;

/*
delete database
drop database banco;
delete table
drop table students;
*/

use school;

create table students(
	id int NOT NULL auto_increment,
	name varchar(30) not null,
	birthday date,
	sex enum('M', 'F'),
	weight decimal(5,2),
	height decimal(3,2),
	country varchar(20) default 'USA',
	primary key(id)
)default charset = utf8;


LOAD DATA LOCAL INFILE "./table.csv" INTO TABLE school.students
charset utf8
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(name, @datevar, sex, weight, @h, country)
set birthday = STR_TO_DATE(@datevar,'%d/%m/%Y'), height = replace(@h, ',','.');

show databases;
status;
show tables;
describe students;
select * from students;

/*
LOAD DATA LOCAL INFILE "/path/to/boats.csv" INTO TABLE boatdb.boats
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, name, type, owner_id, @datevar, rental_price)
set date_made = STR_TO_DATE(@datevar,'%m/%d/%Y');
*/
