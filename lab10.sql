/*
Gary Coltrane
3.18.17 DATABASE MGNT LAB 10


----------------------------------------------------------------------------------------
-- Courses and Prerequisites
-- by Alan G. Labouseur
-- Tested on Postgres 9.3.2
----------------------------------------------------------------------------------------

--
-- The table of courses.
--
create table Courses (
    num      integer not null,
    name     text    not null,
    credits  integer not null,
  primary key (num)
);


insert into Courses(num, name, credits)
values (499, 'CS/ITS Capping', 3 );

insert into Courses(num, name, credits)
values (308, 'Database Systems', 4 );

insert into Courses(num, name, credits)
values (221, 'Software Development Two', 4 );

insert into Courses(num, name, credits)
values (220, 'Software Development One', 4 );

insert into Courses(num, name, credits)
values (120, 'Introduction to Programming', 4);

select *
from courses
order by num ASC;


--
-- Courses and their prerequisites
--
create table Prerequisites (
    courseNum integer not null references Courses(num),
    preReqNum integer not null references Courses(num),
  primary key (courseNum, preReqNum)
);

insert into Prerequisites(courseNum, preReqNum)
values (499, 308);

insert into Prerequisites(courseNum, preReqNum)
values (499, 221);

insert into Prerequisites(courseNum, preReqNum)
values (308, 120);

insert into Prerequisites(courseNum, preReqNum)
values (221, 220);

insert into Prerequisites(courseNum, preReqNum)
values (220, 120);

select *
from Prerequisites
order by courseNum DESC;




/*
1. . func1on	PreReqsFor(courseNum)	-	Returns	the	immediate	prerequisites	for	the
passed-in	course	number.
*/
create or replace function PreReqsFor(int, REFCURSOR) returns refcursor as
$$
declare
    course_num        int := $1;
    preReqs           REFCURSOR := $2;
begin
    open preReqs for
      select preReqNum
      from Prerequisites
      where courseNum = course_num;
    return preReqs;
end;
  $$
  language plpgsql;


/*
 2. Returns	the	courses	for	which	the	passed-in	course
number	is	an	immediate	pre-requisite.
*/

create or replace function IsPreReqFor(int, REFCURSOR) returns refcursor as
$$
declare
    course_num    int       := $1;
    courses       REFCURSOR := $2;
begin
    open courses for
       select coursenum
       from Prerequisites
       where prereqNnm = course_num;
    return courses;
end;
$$
language plpgsql;


Select PreReqsFor(499, 'results');
Fetch all from results;
Select IsPreReqFor(221, 'results1');
Fetch all from results1;
