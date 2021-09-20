--# IssueCount 2
insert into Table1 select name from systables;
insert into Table1 select name from systables;

--# IssueCount 0
insert into Table1(Name) select name from systables;

