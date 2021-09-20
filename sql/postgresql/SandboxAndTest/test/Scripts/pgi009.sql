--# IssueCount 2
select * from Table1 where id in (1,2,3,4,5,6);
select * from Table1 where id in (1,2,3,4,5,6,7);

--# IssueCount 0
select * from Table1 where id in (1,2,3,4);
select * from Table1 where id in (1,2,3);
select * from Table1 where id in (select id from table2);

