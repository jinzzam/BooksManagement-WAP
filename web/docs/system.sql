create table  member(
name varchar2(20) not null,
id varchar2(30) primary key,
password varchar2(30) not null,
email varchar2(80) not null,
phone varchar2(11) not null);

select * from member;
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
select * from book where name like '%열혈%';
select * from book where no='B006.1';
create sequence seq_list;


create table list(
id number primary key not null,
borrower varchar2(10) not null,
name varchar2(100) not null,
no varchar2(20) not null,
outdate date,
duedate date,
returndate date,
returntype varchar2(20));

commit;
select * from list;

insert into list values(seq_list.NEXTVAL,'박유진', '데이타베이스론', 'G002.2', 
sysdate, 
sysdate+14,
null, null);

insert into list values(
seq_list.NEXTVAL,
'김태정',
'CSS',
'F012',
sysdate,
sysdate+14,
null, null
);

insert into list values(
seq_list.NEXTVAL,
'이정민',
'JSP의 모든 것',
'G022',
sysdate,
sysdate+14,
null, null
);

insert into list values(
seq_list.NEXTVAL,
'박유진',
'Jaavavava',
'A033.2',
sysdate,
sysdate+14,
null, null
);

insert into list values(
seq_list.NEXTVAL,
'김태정',
'파이썬응용',
'A003',
sysdate,
sysdate+14,
null, null
);

delete from list where ID=1;
