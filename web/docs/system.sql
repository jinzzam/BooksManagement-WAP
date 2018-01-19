create table member(
name varchar2(20) not null,
birthday varchar2(8),
gender varchar2(1) not null,
id varchar2(30) primary key,
password varchar2(30) not null,
email varchar2(80) not null,
phone varchar2(11));

select * from member;

insert into member values('박유진', '19971119', 'f', 'youjin', '1234', 'firstmind_@naver.com', '01057192212');
insert into member values('이정민', '19941207', 'm', 'jeongmin', '9984', 'min@naver.com', '01012345678');

create table book(
no varchar2(10) primary key,
classfi varchar2(20) not null,
name varchar2(100) not null,
author varchar2(50) not null,
translator varchar2(40),
publisher varchar2(30) not null,
checkoutdate varchar2(20),
checkedout varchar2(1));

select * from book;