create table  member(
name varchar2(20) not null,
id varchar2(30) primary key,
password varchar2(30) not null,
email varchar2(80) not null,
phone varchar2(11) not null);

insert into member values('박유진', 'youjin', '123123', 'firstmind_@naver.com', '01057192212');
insert into member values('이정민', 'jungmin', '234234', 'min@naver.com', '01012341234');
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
select name from book;
select * from book where name='Head First Java';

create table list(
borrower varchar2(10) not null,
name varchar2(100) not null,
no varchar2(20) not null,
outdate varchar2(10),
duedate varchar2(10),
returndate varchar2(10),
returntype varchar2(20));

select * from list;