create table  member(
name varchar2(20) not null,
id varchar2(30) primary key,
password varchar2(30) not null,
email varchar2(80) not null,
phone varchar2(11) not null);

insert into member values('ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'youjin', '123123', 'firstmind_@naver.com', '01057192212');
insert into member values('ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½', 'jungmin', '234234', 'min@naver.com', '01012341234');
select * from member;
drop table member;
commit;

drop table book;
create table book(
bigfield varchar2(40) not null,
no varchar2(20) primary key,
smfield varchar2(40),
name varchar2(100) not null,
author varchar2(50) not null,
translator varchar2(50),
publisher varchar2(40) not null,
checkoutdate date,
checkedout varchar2(20));

select * from book;
<<<<<<< HEAD
select name from book;
select * from book where name='Head First Java';
=======
select * from book where name like '%¿­Ç÷%';
>>>>>>> 23e7d4d6213d08b5d2ade523bef2651d2e406d9c
select * from book where no='B006.1';
create sequence seq_list;
drop table list;
create table list(
id number primary key not null,
borrower varchar2(10) not null,
name varchar2(100) not null,
no varchar2(20) not null,
outdate varchar2(10),
duedate varchar2(10),
returndate varchar2(10),
returntype varchar2(20));

select * from list;
insert into list values(seq_list.NEXTVAL,'¹ÚÀ¯Áø', 'µ¥ÀÌÅ¸º£ÀÌ½º·Ð', 'G002.2', 
sysdate, 
sysdate+14,
null, null);
<<<<<<< HEAD
delete from list where ID=1;
=======
delete from list where ID=1;

SELECT * FROM user_tab_columns WHERE table_name='BOOK';
SELECT * FROM col;
>>>>>>> 23e7d4d6213d08b5d2ade523bef2651d2e406d9c
