create table member(
name varchar2(20) not null,
birthday varchar2(8),
gender varchar2(2) not null,
id varchar2(30) primary key,
password varchar2(30) not null,
email varchar2(80) not null,
phone varchar2(11));

select * from member;
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
select name from book;
select no from book where name = '³ú¸¦ ÀÚ±ØÇÏ´Â ¾Ë°í¸®Áò';