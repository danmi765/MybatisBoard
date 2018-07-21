select * from tab;

select * from board;
select * from member;
select * from gallery;
select * from cmt;


create user tester22 identified by qwert;
grant resource, connect to tester22;

-- tester22 �����Ϸ�

create table board (
	idx integer primary key,
	userid varchar2(100),
	title varchar2(1000),
	content varchar2(2000),
	writedate date,
	bno integer
);

create table member(
	userid varchar2(100) primary key,
	userpsw varchar2(50),
	username varchar2(100),
	joindate date,
	sex varchar2(10),
	age varchar2(100)
);

create table gallery(
	idx integer primary key,
	title varchar2(1000),
	content varchar2(2000),
	filename varchar2(1000),
	writedate date,
	userid varchar2(100),
	bno integer
);

create table cmt(
	idx integer primary key,
	userid varchar2(100),
	content varchar2(1000) ,
	writedate date,
	bno integer,
	tablename varchar2(100)
);


rename board1 to board;

alter table board add(tablename varchar2(100));
alter table gallery add(username varchar(100));
alter table cmt add(bno integer);
alter table board add(bno integer);
alter table gallery add(bno integer);

alter table gallery rename column gno to bno;
alter table board rename column bno to idx;
alter table board1 rename column username to userid;

alter table board set unused (tablename);
alter table board drop column tablename;  




update gallery set username='admin' where username is null;
update board set tablename='게시판' where tablename is null ;
update cmt set bno=3 where bno is null;
update member set sex='여자' where userid='admin';
update member set username='뽕', sex='여자', age='20' where userid='danmi765';

delete from cmt where userid is null;
delete from gallery where filename='poland.png';


delete from board;
delete from cmt;
drop sequence board_seq;
drop sequence gallery_seq;
drop table board;

create sequence board_seq start with 1 increment by 1;
create sequence cmt_seq start with 1 increment by 1;



-- �ڷ��Է�

insert into board values(board_seq.nextval, 'title35','content32','admin',sysdate,1);

insert into member values('admin','qwert','������',sysdate,'W','26');

insert into gallery values(gallery_seq.nextval, 'title2','content2', 'france.png', sysdate, 'admin',1);

insert into cmt values(cmt_seq.nextval, 'admin', 'content', sysdate);




-- ��Ÿ

select bno, title, username, writedate 
	from (select ceil(rownum/3) as page, bno, title, username, writedate 
			from (select bno, title, username, writedate from board1 order by bno desc) b) b
	where page='3';
	
select * from board1 where content like '%��%';
	

SELECT B.idx, B.title, B.content, B.userid, B.writedate , B.bno, SUM(DECODE(C.idx, NULL, 0, 1)) cmtcnt FROM BOARD B, CMT C WHERE B.idx = C.bno(+) GROUP BY B.idx, B.title, B.content, B.userid, B.writedate, B.bno order by b.idx desc;

SELECT B.idx, B.title, B.userid, B.writedate , B.bno, SUM(DECODE(C.idx, NULL, 0, 1)) cmtcnt FROM BOARD B, CMT C WHERE B.idx = C.bno(+) and b.userid like '%'|| 'a' ||'%' GROUP BY B.idx, B.title, B.userid, B.writedate, B.bno order by b.idx desc;
select idx, title, userid, writedate, bno from board where ${option} like '%'|| #{key} ||'%' order by idx desc
				
	
			
	
				



