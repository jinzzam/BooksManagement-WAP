create table member(
name varchar2(20) not null,
birthday varchar2(8),
gender varchar2(1) not null,
id varchar2(30) primary key,
password varchar2(30) not null,
email varchar2(80) not null,
phone varchar2(11));

select * from member;

insert into member values('������', '19971119', 'f', 'youjin', '1234', 'firstmind_@naver.com', '01057192212');
insert into member values('������', '19941207', 'm', 'jeongmin', '9984', 'min@naver.com', '01012345678');

create table book(
bigfield varchar2(20) not null,
no varchar2(10) primary key,
smfield varchar2(10),
name varchar2(100) not null,
author varchar2(30) not null,
translator varchar2(20),
publisher varchar2(20) not null,
checkoutdate varchar2(10),
checkedout varchar2(1));

select * from book;
drop table book;