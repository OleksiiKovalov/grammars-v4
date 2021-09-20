--# IssueCount 2
select * from tabl1 where id in (select id from tanbl2);
select * from tabl1 where id not in (select id from tanbl2);

--# IssueCount 0
select * from tabl1 where id in (1,2,3);
select * from tabl1 where id not in (1,2,3);

