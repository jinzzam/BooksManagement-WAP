create table member(
name varchar2(20) not null,
birthday varchar2(8),
gender varchar2(1) not null,
id varchar2(30) primary key,
password varchar2(30) not null,
email varchar2(80) not null,
phone varchar2(11));

select * from member;
drop table member;
commit;

create table book(
bigfield varchar2(40) not null,
no varchar2(20) primary key,
smfield varchar2(40),
name varchar2(100) not null,
author varchar2(50) not null,
translator varchar2(50),
publisher varchar2(40) not null,
checkoutdate varchar2(10),
checkedout varchar2(20));

select * from book;
drop table book;

select name from book;


create or replace type project_type as object(
name varchar2(50),
role varchar2(20)
);

create type project_table as table of project_type;